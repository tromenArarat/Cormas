Class {
	#name : 'BaselineOfSimFourmis',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSimFourmis',
	#package : 'BaselineOfSimFourmis'
}

{ #category : 'as yet unclassified' }
BaselineOfSimFourmis >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			package: 'SimFourmis-Model';
		
			package: 'SimFourmis-Model-Tests'
			with: [ spec requires: #('SimFourmis-Model') ] ].
]
