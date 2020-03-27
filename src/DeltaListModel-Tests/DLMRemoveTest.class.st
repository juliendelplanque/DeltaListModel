"
A DLMRemoveTest is a test class for testing the behavior of DLMRemove
"
Class {
	#name : #DLMRemoveTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Deltas'
}

{ #category : #test }
DLMRemoveTest >> testExecuteOn [
	| delta filter sorter state |
	filter := [ :x | true ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: (#(4 5 6) asOrderedCollection
									collect: [ :x | DLMListItemWrapper wrap: x ]);
					filter: filter;
					sorter: sorter;
					yourself.
	delta := DLMRemove item: state items first.
	
	state selectedObjects: (state items last: 2).
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(5 6) asOrderedCollection.
	self assertCollection: state selectedItems equals: #(5 6) asOrderedCollection.
	self assert: state filter equals: filter.
	self assert: state sorter equals: sorter.
]

{ #category : #test }
DLMRemoveTest >> testExecuteOn2 [
	| delta filter sorter state |
	filter := [ :x | true ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: (#(4 5 6) asOrderedCollection collect: [ :x | DLMListItemWrapper wrap: x ]);
					filter: filter;
					sorter: sorter;
					yourself.
	state selectedObjects: (state items last: 2).
		
	delta := DLMRemove item: state items second.
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(4 6) asOrderedCollection.
	self assertCollection: state selectedItems equals: #(6) asOrderedCollection.
	self assert: state filter equals: filter.
	self assert: state sorter equals: sorter.
]
