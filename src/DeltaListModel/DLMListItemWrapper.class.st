"
I wrap objects that are stored in the DLMList.

I wrap objects to be able to identify them uniquely (in case the wrapped object can not be distinguished via #== e.g. Integer).
"
Class {
	#name : #DLMListItemWrapper,
	#superclass : #Object,
	#instVars : [
		'wrappedObject'
	],
	#category : #'DeltaListModel-Core'
}

{ #category : #'instance creation' }
DLMListItemWrapper class >> wrap: wrappedObject [
	^ self new
		wrappedObject: wrappedObject;
		yourself
]

{ #category : #printing }
DLMListItemWrapper >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self wrappedObject printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
DLMListItemWrapper >> wrappedObject [
	^ wrappedObject
]

{ #category : #accessing }
DLMListItemWrapper >> wrappedObject: anObject [
	wrappedObject := anObject
]
