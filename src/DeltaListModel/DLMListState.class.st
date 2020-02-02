Class {
	#name : #DLMListState,
	#superclass : #Object,
	#instVars : [
		'items',
		'selectedObjects',
		'filter',
		'sorter'
	],
	#category : #'DeltaListModel-Core'
}

{ #category : #'instance creation' }
DLMListState class >> items: items [
	<generated>
	^ self new
		items: items;
		yourself
]

{ #category : #accessing }
DLMListState >> filter [
	^ filter
]

{ #category : #accessing }
DLMListState >> filter: anObject [
	filter := anObject
]

{ #category : #accessing }
DLMListState >> indexesOfVisibleSelectedItems [
	^ self visibleWrappedItems
		select: [ :objectWrapper | self selectedObjects includes: objectWrapper ]
		thenCollect: [ :objectWrapper | self visibleWrappedItems indexOf: objectWrapper ]
]

{ #category : #initialization }
DLMListState >> initialize [
	super initialize.
	self selectedObjects: #().
	self filter: [ :x | true ].
	self sorter: [ :x :y | true ]
]

{ #category : #accessing }
DLMListState >> items [
	^ items
]

{ #category : #accessing }
DLMListState >> items: anObject [
	items := anObject
]

{ #category : #accessing }
DLMListState >> selectedItems [
	^ self visibleWrappedItems
		select: [ :objectWrapper | self selectedObjects includes: objectWrapper ]
		thenCollect: #wrappedObject
]

{ #category : #accessing }
DLMListState >> selectedObjects [
	^ selectedObjects
]

{ #category : #accessing }
DLMListState >> selectedObjects: anObject [
	selectedObjects := anObject
]

{ #category : #accessing }
DLMListState >> sortedItems [
	^ self items
			sort: [ :wraper1 :wraper2 |
				self sorter
					value: wraper1 wrappedObject
					value: wraper2 wrappedObject ]
]

{ #category : #accessing }
DLMListState >> sorter [
	^ sorter
]

{ #category : #accessing }
DLMListState >> sorter: anObject [
	sorter := anObject
]

{ #category : #accessing }
DLMListState >> visibleItems [
	^ self visibleWrappedItems
		collect: #wrappedObject
]

{ #category : #accessing }
DLMListState >> visibleWrappedItems [
	^ (self items select: [ :wraper | self filter value: wraper wrappedObject ])
			sort: [ :wraper1 :wraper2 |
				self sorter
					value: wraper1 wrappedObject
					value: wraper2 wrappedObject ]
]
