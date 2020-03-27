"
I am an abstract class defining the expected API to store deltas.
My subclasses can define concrete strategies to handle the stream of deltas incoming from actions uses do on a list.
"
Class {
	#name : #DLMDeltaStorage,
	#superclass : #Object,
	#category : #'DeltaListModel-Core'
}

{ #category : #adding }
DLMDeltaStorage >> addDelta: aDelta [
	"Adds the delta to the list of delta to be interpreted."
	self subclassResponsibility
]

{ #category : #'state computation' }
DLMDeltaStorage >> outcomingStateFrom: originalItems [
	"Computes the outcoming state from the application of the sequence of delta on the originalItems."
	^ self subclassResponsibility
]
