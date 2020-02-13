Class {
	#name : #DLMCache,
	#superclass : #Object,
	#instVars : [
		'cachedObject',
		'computationBlock'
	],
	#category : #'DeltaListModel-Core'
}

{ #category : #'instance creation' }
DLMCache class >> computationBlock: computationBlock [
	^ self new
		computationBlock: computationBlock;
		yourself
]

{ #category : #accessing }
DLMCache >> cachedObject [
	^ cachedObject ifNil: [ cachedObject := self computationBlock value ]
]

{ #category : #accessing }
DLMCache >> computationBlock [
	^ computationBlock
]

{ #category : #accessing }
DLMCache >> computationBlock: anObject [
	computationBlock := anObject
]

{ #category : #api }
DLMCache >> invalidate [
	cachedObject := nil
]
