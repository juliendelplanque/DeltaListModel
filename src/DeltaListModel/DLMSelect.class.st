Class {
	#name : #DLMSelect,
	#superclass : #DLMDelta,
	#instVars : [
		'selectedIndexes'
	],
	#category : #'DeltaListModel-Deltas'
}

{ #category : #'instance creation' }
DLMSelect class >> selectedIndexes: selectedIndexes [
	<generated>
	^ self new
		selectedIndexes: selectedIndexes;
		yourself
]

{ #category : #'storage adding' }
DLMSelect >> beAddedToOptimizedStorage: anOptimizedDeltaStorage [
	anOptimizedDeltaStorage selectDelta: self
]

{ #category : #execution }
DLMSelect >> executeOn: listState [
	^ listState
		selectedObjects: (listState visibleWrappedItems withIndexSelect: [ :wrapper :index | self selectedIndexes includes: index ]);
		yourself
]

{ #category : #testing }
DLMSelect >> isSelect [
	^ true
]

{ #category : #accessing }
DLMSelect >> selectedIndexes [
	^ selectedIndexes
]

{ #category : #accessing }
DLMSelect >> selectedIndexes: anObject [
	selectedIndexes := anObject
]
