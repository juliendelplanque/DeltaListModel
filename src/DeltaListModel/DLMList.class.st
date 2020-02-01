Class {
	#name : #DLMList,
	#superclass : #Object,
	#instVars : [
		'originalItems',
		'deltas'
	],
	#category : #'DeltaListModel-Core'
}

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
	| listState |
	listState := DLMListState items: self originalItems.
	^ (deltas
		inject: listState
		into: [ :visibleItemsBeingBuilt :delta |
			delta executeOn: visibleItemsBeingBuilt ]) indexesOfVisibleSelectedItems
]

{ #category : #initialization }
DLMList >> initialize [
	super initialize.
	deltas := OrderedCollection new
]

{ #category : #accessing }
DLMList >> originalItems [
	"Items as they were provided initially to myself, without any delta applied."
	^ originalItems
]

{ #category : #api }
DLMList >> originalItems: orderedCollectionOfObjects [
	originalItems := orderedCollectionOfObjects collect: [ :object | DLMListItemWrapper wrap: object ]
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
	| listState |
	listState := DLMListState items: self originalItems.
	^ (deltas
		inject: listState
		into: [ :visibleItemsBeingBuilt :delta |
			delta executeOn: visibleItemsBeingBuilt ]) selectedItems
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
	listState := DLMListState items: self originalItems.
	^ ((deltas reject: #isSelect)
		inject: listState
		into: [ :visibleItemsBeingBuilt :delta |
			delta executeOn: visibleItemsBeingBuilt ]) visibleItems
]
