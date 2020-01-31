Class {
	#name : #BaselineOfDeltaListModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfDeltaListModel
}

{ #category : #baselines }
BaselineOfDeltaListModel >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'DeltaListModel';
				package: 'DeltaListModel-Tests' with: [ spec requires: #('DeltaListModel') ] ]
]
