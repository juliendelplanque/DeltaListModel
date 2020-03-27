"
I implement a cache simple mechanism.

One can specify how to compute the object I store via #computationBlock: method.
I will automatically recompute the object when my #cachedObject instance variable is nil.

To invalidate myself (i.e. set my #cachedObject instance variable to nil), use my #invalidate method.

Example:

cache := DLMCache computationBlock: [ 1 second wait. 42 ].
cache cachedObject. ""42"" ""This takes 1 second to compute.""
cache cachedObject. ""42"" ""Instantly returned.""

cache invalidate.
cache cachedObject. ""42"" ""This takes 1 second to compute.""
"
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
