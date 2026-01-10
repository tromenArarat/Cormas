Class {
	#name : 'RFCell',
	#superclass : 'CMCell',
	#category : 'RobotForager-Model',
	#package : 'RobotForager-Model'
}

{ #category : 'testing' }
RFCell >> getMineral [
	self hasMineral ifFalse: [ self error: 'This cell has no minerals' ].
	^ (self occupantsOfClass: RFMineral) first
]

{ #category : 'testing' }
RFCell >> hasMineral [
	^ self hasOccupantsOfClass: RFMineral
]
