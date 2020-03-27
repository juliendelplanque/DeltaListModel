Class {
	#name : #DLMListNaiveStorageTest,
	#superclass : #DLMListTest,
	#category : #'DeltaListModel-Tests-Core'
}

{ #category : #tests }
DLMListNaiveStorageTest >> newList [
	^ DLMList new
		deltaStorage: DLMNaiveDeltaStorage new;
		yourself
]
