Class {
	#name : 'RFModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'robots',
		'minerals'
	],
	#classInstVars : [
		'numberOfRows',
		'numberOfColumns',
		'numberOfRobots',
		'numberOfMinerals'
	],
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'initialization' }
RFModel class >> initializeParameters [
	super initializeParameters.
	numberOfRows := 5.
	numberOfColumns := 5.
	numberOfRobots := 2.
	numberOfMinerals := 20
]

{ #category : 'as yet unclassified' }
RFModel class >> modelName [

	^ 'Robot forager'
]

{ #category : 'accessing' }
RFModel class >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'accessing' }
RFModel class >> numberOfColumns: anObject [

	numberOfColumns := anObject
]

{ #category : 'accessing' }
RFModel class >> numberOfMinerals [

	^ numberOfMinerals
]

{ #category : 'accessing' }
RFModel class >> numberOfMinerals: anObject [

	numberOfMinerals := anObject
]

{ #category : 'accessing' }
RFModel class >> numberOfRobots [

	^ numberOfRobots
]

{ #category : 'accessing' }
RFModel class >> numberOfRobots: anObject [

	numberOfRobots := anObject
]

{ #category : 'accessing' }
RFModel class >> numberOfRows [

	^ numberOfRows
]

{ #category : 'accessing' }
RFModel class >> numberOfRows: anObject [

	numberOfRows := anObject
]

{ #category : 'accessing' }
RFModel class >> prefix [

	^ 'RF'
]

{ #category : 'as yet unclassified' }
RFModel >> init [
    <init>
    self initialize
        createGridNumberOfRows: self class numberOfRows
        numberOfColumns: self class numberOfColumns
        neighbourhood: 8
        closed: true.

	self createN: self class numberOfRobots randomlyLocatedAloneEntities: RFRobot.
	self createN: self class numberOfMinerals randomlyLocatedAloneEntities: RFMineral .
	
	robots := (self agents select: [ :each | each isKindOf: RFRobot ]).
	minerals := (self agents select: [ :each | each isKindOf: RFMineral ]).
]

{ #category : 'as yet unclassified' }
RFModel >> initLarge [
	<init>
	self
        createGridNumberOfRows: 27
        numberOfColumns: 27
        neighbourhood: 8
        closed: true.

	self createN: 10 randomlyLocatedAloneEntities: RFRobot.
	self createN: 200 randomlyLocatedAloneEntities: RFMineral .
	
	robots := (self agents select: [ :each | each isKindOf: RFRobot ]).
	minerals := (self agents select: [ :each | each isKindOf: RFMineral ]).


]

{ #category : 'as yet unclassified' }
RFModel >> initSmall [
	<init>
	self
		createGridNumberOfRows: 5
		numberOfColumns: 5
		neighbourhood: 8
		closed: true.
		
	self createN: 2 randomlyLocatedAloneEntities: RFRobot .
	self createN: 20 randomlyLocatedAloneEntities: RFMineral .
	robots := (self agents select: [ :each | each isKindOf: RFRobot ]).
	minerals := (self agents select: [ :each | each isKindOf: RFMineral ]).
]

{ #category : 'accessing' }
RFModel >> minerals [

	^ minerals
]

{ #category : 'accessing' }
RFModel >> minerals: anObject [

	minerals := anObject
]

{ #category : 'as yet unclassified' }
RFModel >> numberOfCollectedMinerals [
	<probeNamed: 'Collected minerals' color: '00B44C'>
	^ robots sum: [ :each | each collectedMinerals size ]
]

{ #category : 'as yet unclassified' }
RFModel >> numberOfRemainingMinerals [
	<probeNamed: 'Remaining minerals' color: 'E5B80B'>
	^ minerals count: [ :each | each cell isNotNil ]
]

{ #category : 'accessing' }
RFModel >> robots [

	^ robots
]

{ #category : 'accessing' }
RFModel >> robots: anObject [

	robots := anObject
]

{ #category : 'as yet unclassified' }
RFModel >> step [
	<control>
	"This method will be executed at every step of the simulation"
	"self askRandom: RFRobot toDo: #step."
	robots do: [ :each | each step ]
]
