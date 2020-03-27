Class {
	#name : #DLMSelectObjects,
	#superclass : #DLMDelta,
	#instVars : [
		'selectedObjects'
	],
	#category : #'DeltaListModel-Deltas'
}

{ #category : #'instance creation' }
DLMSelectObjects class >> selectedObjects: selectedObjects [
	<generated>
	^ self new
		selectedObjects: selectedObjects;
		yourself
]

{ #category : #'storage adding' }
DLMSelectObjects >> beAddedToOptimizedStorage: anOptimizedDeltaStorage [
	anOptimizedDeltaStorage selectDelta: self
]

{ #category : #execution }
DLMSelectObjects >> executeOn: listState [
	^ listState
		selectedObjects: (listState visibleWrappedItems select: [ :wrapper | self selectedObjects includes: wrapper ]);
		yourself
]

{ #category : #testing }
DLMSelectObjects >> isSelect [
	^ true
]

{ #category : #accessing }
DLMSelectObjects >> selectedObjects [
	^ selectedObjects
]

{ #category : #accessing }
DLMSelectObjects >> selectedObjects: anObject [
	selectedObjects := anObject
]
