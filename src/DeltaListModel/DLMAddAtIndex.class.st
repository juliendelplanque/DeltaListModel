Class {
	#name : #DLMAddAtIndex,
	#superclass : #DLMDelta,
	#instVars : [
		'item',
		'index'
	],
	#category : #'DeltaListModel-Deltas'
}

{ #category : #'instance creation' }
DLMAddAtIndex class >> item: item index: index [
	^ self new
		item: (DLMListItemWrapper wrap: item);
		index: index;
		yourself
]

{ #category : #execution }
DLMAddAtIndex >> executeOn: listState [
	listState items
		add: self item afterIndex: self index - 1.
	
	^ listState
]

{ #category : #accessing }
DLMAddAtIndex >> index [
	^ index
]

{ #category : #accessing }
DLMAddAtIndex >> index: anObject [
	index := anObject
]

{ #category : #accessing }
DLMAddAtIndex >> item [
	^ item
]

{ #category : #accessing }
DLMAddAtIndex >> item: anObject [
	item := anObject
]
