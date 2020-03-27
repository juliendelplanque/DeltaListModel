Class {
	#name : #DLMSort,
	#superclass : #DLMDelta,
	#instVars : [
		'sorter'
	],
	#category : #'DeltaListModel-Deltas'
}

{ #category : #'instance creation' }
DLMSort class >> sorter: sorter [
	<generated>
	^ self new
		sorter: sorter;
		yourself
]

{ #category : #'storage adding' }
DLMSort >> beAddedToOptimizedStorage: anOptimizedDeltaStorage [
	anOptimizedDeltaStorage sortDelta: self
]

{ #category : #execution }
DLMSort >> executeOn: listState [
	^ listState
		sorter: self sorter;
		yourself
]

{ #category : #accessing }
DLMSort >> sorter [
	^ sorter
]

{ #category : #accessing }
DLMSort >> sorter: anObject [
	sorter := anObject
]
