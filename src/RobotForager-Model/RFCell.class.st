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
	^ CMPointOfView color: Color gray lighter
]
