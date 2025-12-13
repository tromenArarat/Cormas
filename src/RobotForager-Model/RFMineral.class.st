Class {
	#name : 'RFMineral',
	#superclass : 'CMAgent',
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'pov' }
RFMineral >> pov [

	<pov>
		
	^ CMPointOfView
		tile: RFIcons mineral
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
