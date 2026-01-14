Class {
	#name : 'SFHormiguero',
	#superclass : 'CMAgentGroup',
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

{ #category : 'initialization' }
SFHormiguero >> crearReina [
	reina := SFReina new . 
	reina miHormiguero: self.
	self addChild: reina .
	reina cell: self cell.
	"reina := SFReina new.
	reina miHormiguero: self.
	modelo:= self getModel .
	modelo addAgent: reina.
	reina coordinates: self coordinates ."
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
