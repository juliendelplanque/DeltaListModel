Class {
	#name : #DeltaListPresenterDemo,
	#superclass : #SpPresenter,
	#instVars : [
		'deltaListPresenter',
		'visibleItemsListPresenter',
		'selectedItemsListPresenter',
		'visibleSelectedItemsListPresenter',
		'ascendingSortRadioButton',
		'descendingSortRadioButton'
	],
	#category : #'DeltaListModel-Spec-Demo'
}

{ #category : #specs }
DeltaListPresenterDemo class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: (
			SpBoxLayout newVertical
				add: 'DeltaListPresenter:'
				withConstraints: [ :constraint | constraint height: self labelHeight ];
				add: #deltaListPresenter;
				add: #ascendingSortRadioButton
				withConstraints: [ :constraint | constraint height: self labelHeight ];
				add: #descendingSortRadioButton
				withConstraints: [ :constraint | constraint height: self labelHeight ];
				yourself);
		add: (
			SpBoxLayout newVertical
				add: 'Visible items:'
				withConstraints: [ :constraint | constraint height: self labelHeight ];
				add: #visibleItemsListPresenter;
				add: 'Visible selected items:'
				withConstraints: [ :constraint | constraint height: self labelHeight ];
				add: #visibleSelectedItemsListPresenter;
				add: 'All selected items (including ones hidden by filter):'
				withConstraints: [ :constraint | constraint height: self labelHeight ];
				add: #selectedItemsListPresenter;
				yourself );
		yourself
]

{ #category : #'instance creation' }
DeltaListPresenterDemo class >> open [
	<script>
	^ self new openWithSpec; yourself
]

{ #category : #initialization }
DeltaListPresenterDemo >> initializePresenters [
	deltaListPresenter := DeltaListPresenter
		withAll: (1 to: 100) asOrderedCollection.
		
	deltaListPresenter beMultipleSelection.
	
	visibleItemsListPresenter := self newList.
	selectedItemsListPresenter := self newList.
	visibleSelectedItemsListPresenter := self newList.
	deltaListPresenter
		whenFilterAppliedDo: [ self updateListsShowingDeltaListProperties ];
		whenSelectionChangedDo: [ self updateListsShowingDeltaListProperties ];
		whenItemsChangedDo: [ self updateListsShowingDeltaListProperties ].
	
	ascendingSortRadioButton := self newRadioButton.
	ascendingSortRadioButton
		label: 'Sort ascending';
		whenActivatedDo: [ deltaListPresenter sort: [ :x :y | x < y ] ].
	descendingSortRadioButton := self newRadioButton.
	descendingSortRadioButton
		label: 'Sort descending';
		whenActivatedDo: [ deltaListPresenter sort: [ :x :y | x > y ] ].
	ascendingSortRadioButton
		associatedRadioButtons: { descendingSortRadioButton };
		state: true.
	
	self updateListsShowingDeltaListProperties
]

{ #category : #private }
DeltaListPresenterDemo >> updateListsShowingDeltaListProperties [
	visibleItemsListPresenter
		items: deltaListPresenter deltaList visibleItems.
	selectedItemsListPresenter
		items: (deltaListPresenter deltaList outcomingState selectedObjects collect: #wrappedObject).
	visibleSelectedItemsListPresenter
		items: deltaListPresenter deltaList selectedItems
]
