Class {
	#name : 'RFMineral',
	#superclass : 'CMAgent',
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'pov' }
RFMineral >> pov [

	<pov>
	| image |
	
	image := (self cormasModel spaceModel numberOfRows < 10)
		ifTrue: [ RFIcons mineralLarge ]
		ifFalse: [ RFIcons mineral ].
		
	^ CMPointOfView
		image: image
		size: 0.9
]

{ #category : 'pov' }
RFMineral >> povSimple [

	<pov>
	^ CMPointOfView
		color: CMColor gold
		shape: #diamond
		size: 0.4
]
