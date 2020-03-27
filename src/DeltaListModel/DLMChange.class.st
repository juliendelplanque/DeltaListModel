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
	^ self new
		newItems: (newItems collect: [ :object | DLMListItemWrapper wrap: object ]);
		yourself
]

{ #category : #execution }
DLMChange >> executeOn: listState [
	^ listState
		items: self newItems;
		selectedObjects: #(); "Behavior on items change is to reset selection. Else we need to do a diff of the old and new items which is too complicated..."
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
