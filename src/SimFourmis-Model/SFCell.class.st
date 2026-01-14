Class {
	#name : 'SFCell',
	#superclass : 'CMCell',
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'as yet unclassified' }
SFCell >> getAlimento [
	self tieneAlimento ifFalse: [ self error: 'Esta celda no tiene alimento' ].
	^ (self occupantsOfClass: SFAlimento ) first
]

{ #category : 'as yet unclassified' }
SFCell >> tieneAlimento [
	^ self hasOccupantsOfClass: SFAlimento
]
