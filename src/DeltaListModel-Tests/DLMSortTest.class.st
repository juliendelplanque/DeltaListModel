"
A DLMSortTest is a test class for testing the behavior of DLMSort
"
Class {
	#name : #DLMSortTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Deltas'
}

{ #category : #test }
DLMSortTest >> testExecuteOn [
	| delta items filter sorter state |
	delta := DLMSort sorter: [ :x :y | x > y ].
	items := #(4 5 6) collect: [ :x | DLMListItemWrapper wrap: x ].
	filter := [ :x | x odd ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: items;
					selectedObjects: (items last: 2);
					filter: filter;
					sorter: sorter;
					yourself.
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(4 5 6).
	self assert: (state selectedObjects collect: #wrappedObject) equals: #(5 6).
	self assert: state filter equals: filter.
	self assert: state sorter equals: delta sorter.
]
