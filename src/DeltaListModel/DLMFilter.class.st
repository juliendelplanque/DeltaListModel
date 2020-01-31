Class {
	#name : #DLMFilter,
	#superclass : #DLMDelta,
	#instVars : [
		'filter'
	],
	#category : #'DeltaListModel-Deltas'
}

{ #category : #'instance creation' }
DLMFilter class >> filter: filter [
	<generated>
	^ self new
		filter: filter;
		yourself
]

{ #category : #execution }
DLMFilter >> executeOn: listState [
	^ listState
		filter: self filter;
		yourself
]

{ #category : #accessing }
DLMFilter >> filter [
	^ filter
]

{ #category : #accessing }
DLMFilter >> filter: anObject [
	filter := anObject
]
