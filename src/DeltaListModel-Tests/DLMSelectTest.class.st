"
A DLMSelectTest is a test class for testing the behavior of DLMSelect
"
Class {
	#name : #DLMSelectTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Deltas'
}

{ #category : #test }
DLMSelectTest >> testExecuteOn [
	| delta filter sorter state |
	delta := DLMSelect selectedIndexes: #(1 3).
	filter := [ :x | true ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: (#(4 5 6) asOrderedCollection
									collect: [ :x | DLMListItemWrapper wrap: x ]);
					filter: filter;
					sorter: sorter;
					yourself.
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(4 5 6) asOrderedCollection.
	self assertCollection: state selectedItems equals: #(4 6) asOrderedCollection.
	self assert: state filter equals: filter.
	self assert: state sorter equals: sorter.
]
