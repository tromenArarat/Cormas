Class {
	#name : 'RFRobot',
	#superclass : 'CMAgent',
	#instVars : [
		'minerals',
		'allRobots'
	],
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'accessing' }
RFRobot >> allRobots: aCollection [

	allRobots := aCollection
]

{ #category : 'as yet unclassified' }
RFRobot >> collectMineral [
	<action>
	minerals addAll:
		((self cell getMinerals) do: [ :mineral |
			 mineral leave.
			 mineral ])
]

{ #category : 'testing' }
RFRobot >> hasNeighbourWithMineral [

	^ self cell neighbourhood anySatisfy: [ :each | each hasMineral ]
]

{ #category : 'initialization' }
RFRobot >> initialize [

	super initialize.
	minerals := OrderedCollection new.
	allRobots := OrderedCollection new
]

{ #category : 'accessing' }
RFRobot >> minerals [

	^ minerals
]

{ #category : 'as yet unclassified' }
RFRobot >> move [
	<action>
	self cell neighbourhood
		detect: [ :each | each hasMineral ]
		ifFound: [ :each | self moveTo: each ]
		ifNone: [ self randomWalk ]
]

{ #category : 'as yet unclassified' }
RFRobot >> moveCollaboratively [

	self cell neighbourhood
		detect: [ :each | each hasMineral ]
		ifFound: [ :each | self moveTo: each ]
		ifNone: [ 
			allRobots
				detect: [ :robot | robot hasNeighbourWithMineral ]
				ifFound: [ :robot | self moveTowards: robot neighbourWithMineral ]
				ifNone: [ self randomWalk ] ]
]

{ #category : 'testing' }
RFRobot >> neighbourWithMineral [

	^ self cell neighbourhood detect: [ :each | each hasMineral ]
]

{ #category : 'pov' }
RFRobot >> pov [

	<pov>
	| image |
	
	image := (self cormasModel spaceModel numberOfRows < 10)
		ifTrue: [ RFIcons robotLarge ]
		ifFalse: [ RFIcons robot ].
		
	^ CMPointOfView
		image: image
		size: 0.9
]

{ #category : 'pov' }
RFRobot >> povSimple [

	<pov>
	^ CMPointOfView
		color: CMColor blue
		shape: #star
		size:  0.7
]

{ #category : 'control' }
RFRobot >> step [
	<action>
	self move.
	self collectMineral.
]

{ #category : 'control' }
RFRobot >> stepCollaboratively [

	self moveCollaboratively.
	self collectMineral.
]
