"
Implementation of the null object design pattern for a delta.

I do nothing on the list state.
"
Class {
	#name : #DLMNullDelta,
	#superclass : #DLMDelta,
	#category : #'DeltaListModel-Deltas'
}

{ #category : #execution }
DLMNullDelta >> executeOn: listState [
	"Null object design pattern, does nothing on purpose."
	^ listState
]
