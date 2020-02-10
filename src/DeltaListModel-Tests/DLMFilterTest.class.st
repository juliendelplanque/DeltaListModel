"
A DLMFilterTest is a test class for testing the behavior of DLMFilter
"
Class {
	#name : #DLMFilterTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Deltas'
}

{ #category : #test }
DLMFilterTest >> testExecuteOn [
	| delta items filter sorter state |
	delta := DLMFilter filter: [ :x | x even ].
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
	self assert: state filter equals: delta filter.
	self assert: state sorter equals: sorter.
]
