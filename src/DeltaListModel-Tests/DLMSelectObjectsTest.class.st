"
A DLMSelectTest is a test class for testing the behavior of DLMSelect
"
Class {
	#name : #DLMSelectObjectsTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Deltas'
}

{ #category : #test }
DLMSelectObjectsTest >> testExecuteOn [
	| delta filter sorter state |
	filter := [ :x | true ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: (#(4 5 6) asOrderedCollection
									collect: [ :x | DLMListItemWrapper wrap: x ]);
					filter: filter;
					sorter: sorter;
					yourself.
	delta := DLMSelectObjects selectedObjects: {state items first . state items last}.
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(4 5 6) asOrderedCollection.
	self assertCollection: state selectedItems equals: #(4 6) asOrderedCollection.
	self assert: state filter equals: filter.
	self assert: state sorter equals: sorter.
]
