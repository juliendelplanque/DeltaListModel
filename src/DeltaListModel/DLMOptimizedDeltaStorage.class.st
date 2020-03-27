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
