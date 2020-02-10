Class {
	#name : #DeltaListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter',
		'searchTextInputPresenter',
		'deltaList',
		'listenToSelectionChange',
		'whenFilterAppliedBlock',
		'whenSelectionChangedBlock',
		'whenItemsChangedBlock'
	],
	#category : #'DeltaListModel-Spec'
}

{ #category : #specs }
DeltaListPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #listPresenter;
		add: #searchTextInputPresenter withConstraints: [ :constraints | constraints height: self inputTextHeight ]
]

{ #category : #'instance creation' }
DeltaListPresenter class >> empty [
	^ self withAll: OrderedCollection new
]

{ #category : #'instance creation' }
DeltaListPresenter class >> withAll: anOrderedCollection [
	^ (self on: DLMList new)
			originalItems: anOrderedCollection;
			yourself
]

{ #category : #api }
DeltaListPresenter >> add: anObject at: index [
	deltaList add: anObject at: index.
	self updateListPresenter
]

{ #category : #api }
DeltaListPresenter >> beMultipleSelection [
	listPresenter beMultipleSelection
]

{ #category : #api }
DeltaListPresenter >> beSingleSelection [
	listPresenter beSingleSelection
]

{ #category : #api }
DeltaListPresenter >> change: orderedCollectionOfObjects [
	deltaList change: orderedCollectionOfObjects.
	self updateListPresenter.
	whenItemsChangedBlock value
]

{ #category : #private }
DeltaListPresenter >> compileFilterQueryString: aString [
	| matchers |
	self flag: #TODO. "Implement extensible system."
	matchers := (aString splitOn: $|)
		reject: #isEmpty
		thenCollect: [ :s | '*' , s , '*' ].
		
	^ [ :x | matchers ifEmpty: [ true ] ifNotEmpty: [ matchers anySatisfy: [ :any | any match: (listPresenter display value: x) ] ] ]
]

{ #category : #accessing }
DeltaListPresenter >> deltaList [
	^ deltaList
]

{ #category : #private }
DeltaListPresenter >> doNotListenToSelectionChangeDuring: aBlock [
	listenToSelectionChange := false.
	aBlock value.
	listenToSelectionChange := true.
]

{ #category : #api }
DeltaListPresenter >> filter: filter [
	deltaList filter: filter.
	self updateListPresenter.
	whenFilterAppliedBlock value
]

{ #category : #private }
DeltaListPresenter >> handleSelectionChange [
	listenToSelectionChange
		ifFalse: [ ^ self ].
	
	self select: listPresenter selection selectedIndexes
]

{ #category : #initialization }
DeltaListPresenter >> initializePresenters [
	listenToSelectionChange := true.
	listPresenter := self newList.
	listPresenter
		whenSelectionChangedDo: [ :selection | self handleSelectionChange ].
	
	searchTextInputPresenter := self newTextInput.
	searchTextInputPresenter
		placeholder: 'Filter...';
		autoAccept: true;
		whenTextChangedDo: [ :text | self filter: (self compileFilterQueryString: text) ]
]

{ #category : #api }
DeltaListPresenter >> items: orderedCollectionOfObjects [
	self change: orderedCollectionOfObjects.
	self updateListPresenter
]

{ #category : #accessing }
DeltaListPresenter >> listPresenter [
	^ listPresenter
]

{ #category : #api }
DeltaListPresenter >> originalItems: orderedCollectionOfObjects [
	deltaList originalItems: orderedCollectionOfObjects.
	self updateListPresenter
]

{ #category : #api }
DeltaListPresenter >> remove: anObject [
	deltaList remove: anObject.
	self updateListPresenter
]

{ #category : #accessing }
DeltaListPresenter >> searchTextInputPresenter [
	^ searchTextInputPresenter
]

{ #category : #api }
DeltaListPresenter >> select: selectedIndexes [
	deltaList select: selectedIndexes.
	self updateListPresenter.
	whenSelectionChangedBlock value
]

{ #category : #'accessing model' }
DeltaListPresenter >> setModelBeforeInitialization: aDeltaList [
	deltaList := aDeltaList.
	whenFilterAppliedBlock := [ ]. 
	whenSelectionChangedBlock := [ ].
	whenItemsChangedBlock := [ ]
]

{ #category : #api }
DeltaListPresenter >> sort: sorter [
	deltaList sort: sorter.
	self updateListPresenter
]

{ #category : #private }
DeltaListPresenter >> updateListPresenter [
	listPresenter items: deltaList visibleItems.
	self doNotListenToSelectionChangeDuring: [ 
		listPresenter selectIndexes: deltaList indexesOfVisibleSelectedItems ].
]

{ #category : #'api-events' }
DeltaListPresenter >> whenFilterAppliedDo: aBlock [
	whenFilterAppliedBlock := aBlock
]

{ #category : #'api-events' }
DeltaListPresenter >> whenItemsChangedDo: aBlock [
	whenItemsChangedBlock := aBlock
]

{ #category : #'api-events' }
DeltaListPresenter >> whenSelectionChangedDo: aBlock [
	whenSelectionChangedBlock := aBlock
]
