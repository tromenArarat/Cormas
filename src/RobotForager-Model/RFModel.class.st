Class {
	#name : 'RFModel',
	#superclass : 'CMAbstractModel',
	#classInstVars : [
		'numberOfMinerals'
	],
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'accessing' }
RFModel class >> aboutThisModel [ 

	^ 'RobotForager — Inspired by Steels (1989), this model simulates autonomous robots cooperating to collect scattered mineral resources on a grid. Robots move asynchronously, scanning neighboring cells for minerals and collecting them when found; otherwise, they explore randomly. The environment is a square grid with mutually exclusive placement of robots and minerals at initialization. Two scenarios are provided: a small 5×5 grid with 2 robots and 20 minerals, and a large 27×27 grid with 10 robots and 200 minerals. The model illustrates decentralized coordination in distributed agent systems, applicable to tasks such as planetary exploration, waste cleanup, or resource harvesting.'
]

{ #category : 'initialization' }
RFModel class >> initializeParameters [

	super initializeParameters.
	numberOfMinerals := 10
]

{ #category : 'accessing' }
RFModel class >> modelName [

	^ 'Robot Forager'
]

{ #category : 'accessing' }
RFModel class >> numberOfMinerals [

	^ numberOfMinerals
]

{ #category : 'accessing' }
RFModel class >> numberOfMinerals: aNumber [

	numberOfMinerals := aNumber
]

{ #category : 'tests - printing' }
RFModel class >> prefix [
	
	^ 'RF'
]

{ #category : 'initialization' }
RFModel >> initLarge [

	<init>
	self
		createGridNumberOfRows: 27
		numberOfColumns: 27
		neighbourhood: 8
		closed: true.
		
	self class numberOfMinerals: 400.
		
	self createN: 10 randomlyLocatedAloneEntities: RFRobot. 
	self createN: self class numberOfMinerals randomlyLocatedAloneEntities: RFMineral.
	
	(self @@ RFRobot) do: [ :each | each allRobots: (self @@ RFRobot) ]
]

{ #category : 'initialization' }
RFModel >> initSmall [

	<init>
	self
		createGridNumberOfRows: 5
		numberOfColumns: 5
		neighbourhood: 8
		closed: true.
		
	self class numberOfMinerals: 20.
		
	self createN: 2 randomlyLocatedAloneEntities: RFRobot. 
	self createN: self class numberOfMinerals randomlyLocatedAloneEntities: RFMineral.
	
	(self @@ RFRobot) do: [ :each | each allRobots: (self @@ RFRobot) ]
]

{ #category : 'probes' }
RFModel >> nbAvailableMinerals [

	<probeNamed: 'Number of available minerals' color: 'E5B80B'>
	^ (self @@ RFCell) count: [ :cell | cell hasMineral ]
]

{ #category : 'probes' }
RFModel >> nbCollectedMinerals [

	<probeNamed: 'Number of collected minerals' color: '5579C6'>
	^ (self @@ RFRobot) sum: [ :robot | robot minerals size ]
]

{ #category : 'stepping' }
RFModel >> step [
	
	<control>
	"self askRandom: RFRobot toDo: #step."
	(self shuffled: (self @@ RFRobot)) do: #step.
]

{ #category : 'stepping' }
RFModel >> stepCollaboratively [
	
	<control>
	self askRandom: RFRobot toDo: #stepCollaboratively 
]
