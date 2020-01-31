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

{ #category : #accessing }
DLMListItemWrapper >> wrappedObject [
	^ wrappedObject
]

{ #category : #accessing }
DLMListItemWrapper >> wrappedObject: anObject [
	wrappedObject := anObject
]
