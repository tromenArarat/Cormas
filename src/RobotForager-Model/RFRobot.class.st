Class {
	#name : 'RFRobot',
	#superclass : 'CMAgent',
	#instVars : [
		'collectedMinerals'
	],
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'as yet unclassified' }
RFRobot >> collectMineral [
	<action>
	| mineral |
	self cell hasMineral ifFalse: [ ^ self ]. 
	mineral := self cell getMineral.
	collectedMinerals add: mineral.
	mineral leave
]

{ #category : 'accessing' }
RFRobot >> collectedMinerals [
	^ collectedMinerals
]

{ #category : 'initialization' }
RFRobot >> initialize [
	super initialize.
	collectedMinerals := OrderedCollection new
]

{ #category : 'accessing' }
RFRobot >> move [
	<action>
	self cell neighbourhood
		detect: [ :each | each hasMineral ]
		ifFound: [ :each | self moveTo: each ]
		ifNone: [ self moveRandomly ]
]

{ #category : 'as yet unclassified' }
RFRobot >> moveRandomly [
	<action>
	self randomWalkConstrainedBy: [ :aCell |
		(aCell hasOccupantsOfClass: RFRobot) not ]
]

{ #category : 'accessing' }
RFRobot >> pov [
	<pov>
	^ CMPointOfView
		color: CMColor blue
		shape: #star
		size: 0.6
]

{ #category : 'control' }
RFRobot >> step [
	<action>
	self move.
	self collectMineral
]
