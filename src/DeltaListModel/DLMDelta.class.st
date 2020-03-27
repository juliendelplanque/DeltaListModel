Class {
	#name : #DLMDelta,
	#superclass : #Object,
	#category : #'DeltaListModel-Deltas'
}

{ #category : #'storage adding' }
DLMDelta >> beAddedToOptimizedStorage: anOptimizedDeltaStorage [
	"Adds myself to anOptimizedDeltaStorage."
	self subclassResponsibility
]

{ #category : #execution }
DLMDelta >> executeOn: listState [
	"Apply myself on the listState provided as argument.
	 Returns the listState resulting from my execution.
	"
	^ self subclassResponsibility
]

{ #category : #testing }
DLMDelta >> isSelect [
	^ false
]
