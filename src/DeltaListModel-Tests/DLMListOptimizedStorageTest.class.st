Class {
	#name : #DLMListOptimizedStorageTest,
	#superclass : #DLMListTest,
	#category : #'DeltaListModel-Tests-Core'
}

{ #category : #tests }
DLMListOptimizedStorageTest >> newList [
	^ DLMList new
		deltaStorage: DLMOptimizedDeltaStorage new;
		yourself
]
