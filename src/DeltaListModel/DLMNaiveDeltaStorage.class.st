Class {
	#name : #DLMNaiveDeltaStorage,
	#superclass : #DLMDeltaStorage,
	#instVars : [
		'deltas'
	],
	#category : #'DeltaListModel-Core'
}

{ #category : #adding }
DLMNaiveDeltaStorage >> addDelta: aDelta [
	self deltas add: aDelta
]

{ #category : #accessing }
DLMNaiveDeltaStorage >> deltas [
	^ deltas
]

{ #category : #accessing }
DLMNaiveDeltaStorage >> deltas: anObject [
	deltas := anObject
]

{ #category : #initialization }
DLMNaiveDeltaStorage >> initialize [
	super initialize.
	deltas := OrderedCollection new
]

{ #category : #'state computation' }
DLMNaiveDeltaStorage >> outcomingStateFrom: originalItems [
	^ (self deltas
		inject: (DLMListState items: originalItems)
		into: [ :visibleItemsBeingBuilt :delta |
			delta executeOn: visibleItemsBeingBuilt ])
]
