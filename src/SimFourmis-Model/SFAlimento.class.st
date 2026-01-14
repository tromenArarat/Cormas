Class {
	#name : 'SFAlimento',
	#superclass : 'CMAgent',
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'accessing' }
SFAlimento >> pov [
<pov>
^ CMPointOfView
		color: CMColor tangerine
		shape: #circle
		size: 0.6
]
