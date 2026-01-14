Class {
	#name : 'SFHormigueroRojo',
	#superclass : 'SFHormiguero',
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'initialization' }
SFHormigueroRojo >> initialize [
	super initialize.
	colorHormiguero := Color red.
]

{ #category : 'accessing' }
SFHormigueroRojo >> pov [
<pov>
	^ super pov
]
