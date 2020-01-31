Class {
	#name : #DLMChange,
	#superclass : #DLMDelta,
	#instVars : [
		'newItems'
	],
	#category : #'DeltaListModel-Deltas'
}

{ #category : #'instance creation' }
DLMChange class >> newItems: newItems [
	<generated>
	^ self new
		newItems: newItems;
		yourself
]

{ #category : #execution }
DLMChange >> executeOn: listState [
	^ listState
		items: (self newItems collect: [ :object | DLMListItemWrapper wrap: object ]);
		selectedObjects: #();
		yourself
]

{ #category : #accessing }
DLMChange >> newItems [
	^ newItems
]

{ #category : #accessing }
DLMChange >> newItems: anObject [
	newItems := anObject
]
