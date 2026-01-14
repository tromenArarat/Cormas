Class {
	#name : 'SFHormiga',
	#superclass : 'CMAgent',
	#instVars : [
		'miHormiguero'
	],
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'accessing' }
SFHormiga >> colorDeHormiguero [
	^ miHormiguero colorHormiguero
]

{ #category : 'accessing' }
SFHormiga >> miHormiguero [

	^ miHormiguero
]

{ #category : 'accessing' }
SFHormiga >> miHormiguero: anObject [

	miHormiguero := anObject
]

{ #category : 'accessing' }
SFHormiga >> pov [
<pov>
^ CMPointOfView
		color: CMColor black
		shape: #circle
		size: 0.4
]
