"
I am an implementation of the delta storage that do not store multiple select/sort/filter deltas.
I only keep the last one for these delta as each new delta of these kind discard the previous of the same kind.

For example, if you get a filter delta and then another filter delta, only the last one is relevant to keep.
Ideed, if you replay the two deltas to get the outcoming state, only the last one matters.
"
Class {
	#name : #DLMOptimizedDeltaStorage,
	#superclass : #DLMDeltaStorage,
	#instVars : [
		'deltas',
		'filterDelta',
		'sortDelta',
		'selectDelta'
	],
	#category : #'DeltaListModel-Core'
}

{ #category : #adding }
DLMOptimizedDeltaStorage >> addDelta: aDelta [
	aDelta beAddedToOptimizedStorage: self
]

{ #category : #accessing }
DLMOptimizedDeltaStorage >> deltas [
	^ deltas
]

{ #category : #accessing }
DLMOptimizedDeltaStorage >> deltas: anObject [
	deltas := anObject
]

{ #category : #accessing }
DLMOptimizedDeltaStorage >> filterDelta [
	^ filterDelta
]

{ #category : #accessing }
DLMOptimizedDeltaStorage >> filterDelta: anObject [
	filterDelta := anObject
]

{ #category : #initialization }
DLMOptimizedDeltaStorage >> initialize [
	super initialize.
	deltas := OrderedCollection new.
	self filterDelta: DLMNullDelta new.
	self sortDelta: DLMNullDelta new.
	self selectDelta: DLMNullDelta new.
]

{ #category : #'state computation' }
DLMOptimizedDeltaStorage >> outcomingStateFrom: originalItems [
	^ (self deltas
		inject: (DLMListState items: originalItems)
		into: [ :visibleItemsBeingBuilt :delta |
			delta executeOn: visibleItemsBeingBuilt ]) ~> self filterDelta ~> self sortDelta ~> self selectDelta
]

{ #category : #adding }
DLMOptimizedDeltaStorage >> privateAddDelta: aDelta [
	self deltas add: aDelta
]

{ #category : #accessing }
DLMOptimizedDeltaStorage >> selectDelta [
	^ selectDelta
]

{ #category : #accessing }
DLMOptimizedDeltaStorage >> selectDelta: anObject [
	selectDelta := anObject
]

{ #category : #accessing }
DLMOptimizedDeltaStorage >> sortDelta [
	^ sortDelta
]

{ #category : #accessing }
DLMOptimizedDeltaStorage >> sortDelta: anObject [
	sortDelta := anObject
]
