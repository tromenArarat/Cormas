Class {
	#name : 'RFCell',
	#superclass : 'CMCell',
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'accessing' }
RFCell >> getMinerals [

	^ self occupantsOfClass: RFMineral
]

{ #category : 'testing' }
RFCell >> hasMineral [

	^ self getMinerals isNotEmpty 
]

{ #category : 'accessing' }
RFCell >> pov [

	<pov>
	| image |
	
	image := (self cormasModel spaceModel numberOfRows < 10)
		ifTrue: [ RFIcons floorLarge ]
		ifFalse: [ RFIcons floor ].
	
	^ CMPointOfView image: image
]

{ #category : 'accessing' }
RFCell >> povSimple [

	<pov>
	^ CMPointOfView color: Color gray lighter
]
