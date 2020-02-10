"
A DLMAddAtIndexTest is a test class for testing the behavior of DLMAddAtIndex
"
Class {
	#name : #DLMAddAtIndexTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Deltas'
}

{ #category : #test }
DLMAddAtIndexTest >> testExecuteOn [
	| delta filter sorter state |
	delta := DLMAddAtIndex item: 3 index: 1.
	filter := [ :x | true ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: (#(4 5 6) asOrderedCollection collect: [ :x | DLMListItemWrapper wrap: x ]);
					selectedObjects: #(5 6);
					filter: filter;
					sorter: sorter;
					yourself.
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(3 4 5 6) asOrderedCollection.
	self assertCollection: state selectedObjects equals: #(5 6).
	self assert: state filter equals: filter.
	self assert: state sorter equals: sorter.
]

{ #category : #test }
DLMAddAtIndexTest >> testExecuteOn2 [
	| delta filter sorter state |
	delta := DLMAddAtIndex item: 3 index: 2.
	filter := [ :x | true ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: (#(4 5 6) asOrderedCollection collect: [ :x | DLMListItemWrapper wrap: x ]);
					selectedObjects: #(5 6);
					filter: filter;
					sorter: sorter;
					yourself.
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(4 3 5 6) asOrderedCollection.
	self assertCollection: state selectedObjects equals: #(5 6).
	self assert: state filter equals: filter.
	self assert: state sorter equals: sorter.
]

{ #category : #test }
DLMAddAtIndexTest >> testExecuteOn3 [
	| delta filter sorter state |
	delta := DLMAddAtIndex item: 3 index: 3.
	filter := [ :x | true ].
	sorter := [ :x :y | x < y ].
	state := DLMListState new
					items: (#(4 5 6) asOrderedCollection collect: [ :x | DLMListItemWrapper wrap: x ]);
					selectedObjects: #(5 6);
					filter: filter;
					sorter: sorter;
					yourself.
					
	delta executeOn: state.
	self assertCollection: state unwrappedItems equals: #(4 5 3 6) asOrderedCollection.
	self assertCollection: state selectedObjects equals: #(5 6).
	self assert: state filter equals: filter.
	self assert: state sorter equals: sorter.
]
