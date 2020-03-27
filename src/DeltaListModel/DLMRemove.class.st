Class {
	#name : #DLMRemove,
	#superclass : #DLMDelta,
	#instVars : [
		'item'
	],
	#category : #'DeltaListModel-Deltas'
}

{ #category : #'instance creation' }
DLMRemove class >> item: item [
	<generated>
	^ self new
		item: item;
		yourself
]

{ #category : #execution }
DLMRemove >> executeOn: listState [
	listState items
		remove: (listState items detect: [ :wrapper | wrapper = self item ]).
	
	^ listState
]

{ #category : #accessing }
DLMRemove >> item [
	^ item
]

{ #category : #accessing }
DLMRemove >> item: anObject [
	item := anObject
]
