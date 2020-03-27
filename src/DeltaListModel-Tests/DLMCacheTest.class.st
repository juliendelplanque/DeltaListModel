"
A DLMCacheTest is a test class for testing the behavior of DLMCache
"
Class {
	#name : #DLMCacheTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Core'
}

{ #category : #tests }
DLMCacheTest >> testCachedObject [
	| computationBlockExecuted cache |
	computationBlockExecuted := false.
	cache := DLMCache computationBlock: [ computationBlockExecuted := true. 42 ].
	self assert: cache cachedObject equals: 42.
	self assert: computationBlockExecuted.
	
	computationBlockExecuted := false.
	self assert: cache cachedObject equals: 42.
	self deny: computationBlockExecuted.

	cache invalidate.
	computationBlockExecuted := false.
	
	self assert: cache cachedObject equals: 42.
	self assert: computationBlockExecuted.
]
