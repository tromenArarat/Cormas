Class {
	#name : 'SFHormiguero',
	#superclass : 'CMAgent',
	#instVars : [
		'reina',
		'colorHormiguero'
	],
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'as yet unclassified' }
SFHormiguero class >> colorPorDefecto [
^ CMColor blue
]

{ #category : 'accessing' }
SFHormiguero >> colorHormiguero [

	^ colorHormiguero
]

{ #category : 'accessing' }
SFHormiguero >> colorHormiguero: anObject [

	colorHormiguero := anObject
]

{ #category : 'as yet unclassified' }
SFHormiguero >> crearReina [
	| reina |
	reina := SFReina new.
	reina miHormiguero: self.
	reina coordinates: self coordinates .
]

{ #category : 'initialization' }
SFHormiguero >> initialize [
	super initialize.
	self crearReina.
]

{ #category : 'accessing' }
SFHormiguero >> pov [
<pov>
^ CMPointOfView
		color: self colorHormiguero
		shape: #hexagon
		size: 0.8
]
