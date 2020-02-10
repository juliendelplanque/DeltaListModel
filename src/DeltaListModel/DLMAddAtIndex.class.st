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
	<generated>
	^ self new
		item: item;
		index: index;
		yourself
]

{ #category : #execution }
DLMAddAtIndex >> executeOn: listState [
	listState items
		add: (DLMListItemWrapper wrap: self item) afterIndex: self index - 1.
	
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
