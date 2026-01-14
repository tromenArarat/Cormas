Class {
	#name : 'SFHormigueroNegro',
	#superclass : 'SFHormiguero',
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'initialization' }
SFHormigueroNegro >> initialize [
	super initialize.
	colorHormiguero := Color black.
]

{ #category : 'accessing' }
SFHormigueroNegro >> pov [
<pov>
	^ super pov
]
