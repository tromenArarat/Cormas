Class {
	#name : 'SFReina',
	#superclass : 'SFHormiga',
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'accessing' }
SFReina >> pov [
<pov>
	^ CMPointOfView
		color: self colorDeHormiguero 
		shape: #circle
		size: 0.6
]
