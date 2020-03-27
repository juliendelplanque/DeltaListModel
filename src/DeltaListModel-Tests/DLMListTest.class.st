"
A DLMListTest is a test class for testing the behavior of DLMList
"
Class {
	#name : #DLMListTest,
	#superclass : #TestCase,
	#category : #'DeltaListModel-Tests-Core'
}

{ #category : #testing }
DLMListTest class >> isAbstract [
	^ self = DLMListTest
]

{ #category : #tests }
DLMListTest >> newList [
	^ self subclassResponsibility
]

{ #category : #tests }
DLMListTest >> testScenario1 [
	| list |
	list := self newList.
	list originalItems: #(1 2 3 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list select: #(2 3).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 3).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2 3).
	
	list filter: [ :x | x odd ].
	
	self assertCollection: list visibleItems equals: #(1 3).
	self assertCollection: list selectedItems equals: #(3).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2).
	
	list filter: [ :x | true ]. "Filter that accepts everything."
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 3).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2 3).
]

{ #category : #tests }
DLMListTest >> testScenario2 [
	| list |
	list := self newList.
	list originalItems: #(1 2 3 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list select: #(2 3).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 3).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2 3).
	
	list change: #(5 6).
	
	self assertCollection: list visibleItems equals: #(5 6).
	self assertCollection: list selectedItems equals: #(). "Changing the items reset selectedIndexes."
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list select: #(1).
	
	self assertCollection: list visibleItems equals: #(5 6).
	self assertCollection: list selectedItems equals: #(5).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(1).
	
	list filter: [ :x | x = 6 ].
	
	self assertCollection: list visibleItems equals: #(6).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
]

{ #category : #tests }
DLMListTest >> testScenario3 [
	| list |
	list := self newList.
	list originalItems: #(1 2 3 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list sort: [ :x :y | x > y ].
	
	self assertCollection: list visibleItems equals: #(4 3 2 1).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list select: #(1 3).
	
	self assertCollection: list visibleItems equals: #(4 3 2 1).
	self assertCollection: list selectedItems equals: #(4 2). "Changing the items reset selectedIndexes."
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(1 3).
	
	list sort: [ :x :y | x < y ].
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 4).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2 4).
]

{ #category : #tests }
DLMListTest >> testScenario4 [
	| list |
	list := self newList.
	list originalItems: #(1 2 3 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list filter: [ :x | #(1 3) includes: x ].
	
	self assertCollection: list visibleItems equals: #(1 3).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list filter: [ :x | #(2 4) includes: x ].
	
	self assertCollection: list visibleItems equals: #(2 4).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list filter: [ :x | true ].
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
]

{ #category : #tests }
DLMListTest >> testScenario5 [
	| list |
	list := self newList.
	list originalItems: #(1 2 3 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list select: #(2 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 4).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2 4).
	
	list filter: [ :x | #(1 2 3) includes: x ].
	
	self assertCollection: list visibleItems equals: #(1 2 3).
	self assertCollection: list selectedItems equals: #(2).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2).
	
	list filter: [ :x | true ].
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(2 4).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2 4).
]

{ #category : #tests }
DLMListTest >> testScenario6 [
	| list |
	list := self newList.
	list originalItems: #(1 2 3 4).
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list filter: [ :x | x odd ].
	
	self assertCollection: list visibleItems equals: #(1 3).
	self assertCollection: list selectedItems equals: #().
	self assertCollection: list indexesOfVisibleSelectedItems equals: #().
	
	list select: #(2).
	
	self assertCollection: list visibleItems equals: #(1 3).
	self assertCollection: list selectedItems equals: #(3).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(2).
	
	list filter: [ :x | true ].
	
	self assertCollection: list visibleItems equals: #(1 2 3 4).
	self assertCollection: list selectedItems equals: #(3).
	self assertCollection: list indexesOfVisibleSelectedItems equals: #(3).
]
