Class {
	#name : 'SFExploradora',
	#superclass : 'SFHormiga',
	#instVars : [
		'mochila'
	],
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'action' }
SFExploradora >> collectAlimento [
	<action>
	| alimento |
	self cell tieneAlimento ifFalse: [ ^ self ]. 
	alimento := self cell getAlimento.
	mochila add: alimento.
	alimento leave
]

{ #category : 'initialization' }
SFExploradora >> initialize [
	super initialize.
	mochila := OrderedCollection new
]

{ #category : 'accessing' }
SFExploradora >> mochila [

	^ mochila
]

{ #category : 'move' }
SFExploradora >> move [
	<action>
	self cell neighbourhood
		detect: [ :each | each tieneAlimento ]
		ifFound: [ :each | self moveTo: each ]
		ifNone: [ self moveRandomly ]
]

{ #category : 'move' }
SFExploradora >> moveRandomly [
	<action>
	self randomWalkConstrainedBy: [ :aCell |
		(aCell hasOccupantsOfClass: self class) not ]
]

{ #category : 'action' }
SFExploradora >> reunirAlimento [
	<action>
	| alimento |
	self cell tieneAlimento ifFalse: [ ^ self ]. 
	alimento := self cell getAlimento.
	mochila add: alimento.
	alimento leave
]

{ #category : 'control' }
SFExploradora >> step [
	<action>
	self move.
	self reunirAlimento 
]
