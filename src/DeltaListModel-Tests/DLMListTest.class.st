"
A DLMListTest is a test class for testing the behavior of DLMList
"
Class {
	#name : #DLMListTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Core'
}

{ #category : #tests }
DLMListTest >> testScenario1 [
	| list |
	list := DLMList new.
	list originalItems: #(1 2 3 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	
	list select: #(2 3).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 3).
	
	list filter: [ :x | x odd ].
	
	self assertCollection: list visibleItems equals: #(1 3).
	self assertCollection: list selectedItems equals: #(3).
	
	list filter: [ :x | true ]. "Filter that accepts everything."
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 3).
]

{ #category : #tests }
DLMListTest >> testScenario2 [
	| list |
	list := DLMList new.
	list originalItems: #(1 2 3 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	
	list select: #(2 3).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 3).
	
	list change: #(5 6).
	
	self assertCollection: list visibleItems equals: #(5 6).
	self assertCollection: list selectedItems equals: #(). "Changing the items reset selectedIndexes."
	
	list select: #(1).
	
	self assertCollection: list visibleItems equals: #(5 6).
	self assertCollection: list selectedItems equals: #(5).
	
	list filter: [ :x | x = 6 ].
	
	self assertCollection: list visibleItems equals: #(6).
	self assertCollection: list selectedItems equals: #().
]