Class {
	#name : #DLMList,
	#superclass : #Object,
	#instVars : [
		'originalItems',
		'deltas'
	],
	#category : #'DeltaListModel-Core'
}

{ #category : #api }
DLMList >> add: anObject at: index [
	self addDelta: (DLMAddAtIndex item: anObject index: index)
]

{ #category : #private }
DLMList >> addDelta: aDelta [
	"Adds aDelta to the delta list."
	deltas add: aDelta
]

{ #category : #api }
DLMList >> change: newItems [
	self addDelta: (DLMChange newItems: newItems)
]

{ #category : #api }
DLMList >> filter: filter [
	self addDelta: (DLMFilter filter: filter)
]

{ #category : #accessing }
DLMList >> indexesOfVisibleSelectedItems [
	^ self outcomingState indexesOfVisibleSelectedItems
]

{ #category : #initialization }
DLMList >> initialize [
	super initialize.
	deltas := OrderedCollection new
]

{ #category : #accessing }
DLMList >> originalItems [
	"A copy of original items as they were provided initially to myself, without any delta applied.
	 We copy these items to avoid modifying them.
	"
	^ originalItems copy
]

{ #category : #api }
DLMList >> originalItems: orderedCollectionOfObjects [
	originalItems := orderedCollectionOfObjects collect: [ :object | DLMListItemWrapper wrap: object ]
]

{ #category : #accessing }
DLMList >> outcomingState [
	"State of the list once delta have been interpreted."
	^ (deltas
		inject: (DLMListState items: self originalItems)
		into: [ :visibleItemsBeingBuilt :delta |
			delta executeOn: visibleItemsBeingBuilt ])
]

{ #category : #api }
DLMList >> remove: anObject [
	self addDelta: (DLMRemove item: anObject)
]

{ #category : #api }
DLMList >> select: selectedItems [
	self addDelta: (DLMSelect selectedIndexes: selectedItems)
]

{ #category : #accessing }
DLMList >> selectedItems [
	"Return selected items as they are shown to the user.
	 In practice, this the #visibleItems list for which non-selected.
	"
	^ self outcomingState selectedItems
]

{ #category : #api }
DLMList >> sort: sorter [
	self addDelta: (DLMSort sorter: sorter)
]

{ #category : #accessing }
DLMList >> visibleItems [
	"Return items as they are shown to the user.
	 That is to say #originalItems with the deltas applied except items selection.
	"
	| listState |
	self flag: #TODO. "Use #outomingState"
	listState := DLMListState items: self originalItems.
	^ ((deltas reject: #isSelect)
		inject: listState
		into: [ :visibleItemsBeingBuilt :delta |
			delta executeOn: visibleItemsBeingBuilt ]) visibleItems
]
