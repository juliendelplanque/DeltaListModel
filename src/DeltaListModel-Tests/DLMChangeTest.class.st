"
A DLMChangeTest is a test class for testing the behavior of DLMChange
"
Class {
	#name : #DLMChangeTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Deltas'
}

{ #category : #test }
DLMChangeTest >> testExecuteOn [
	| delta filter sorter state |
	delta := DLMChange newItems: #(1 2 3).
	filter := [ :x | x odd ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: #(4 5 6);
					selectedObjects: #(5 6);
					filter: filter;
					sorter: sorter;
					yourself.
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(1 2 3).
	self assert: state selectedObjects isEmpty.
	self assert: state filter equals: filter.
	self assert: state sorter equals: sorter.
]
