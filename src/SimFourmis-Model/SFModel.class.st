Class {
	#name : 'SFModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'hormigueros'
	],
	#classInstVars : [
		'numerosDeFilas',
		'numerosDeColumnas',
		'numeroInicialDeHormigueros',
		'numeroInicialDeAlimentos'
	],
	#category : 'SimFourmis-Model',
	#package : 'SimFourmis-Model'
}

{ #category : 'initialization' }
SFModel class >> initializeParameters [ 

super initializeParameters .
numerosDeFilas := 10 .
numerosDeColumnas := 10 .
numeroInicialDeHormigueros := 2 .
numeroInicialDeAlimentos := 15 .
]

{ #category : 'accessing' }
SFModel class >> modelName [

	^ 'SimFourmis'
]

{ #category : 'accessing' }
SFModel class >> numeroInicialDeAlimentos [

	^ numeroInicialDeAlimentos
]

{ #category : 'accessing' }
SFModel class >> numeroInicialDeAlimentos: anObject [

	numeroInicialDeAlimentos := anObject
]

{ #category : 'accessing' }
SFModel class >> numeroInicialDeHormigueros [

	^ numeroInicialDeHormigueros
]

{ #category : 'accessing' }
SFModel class >> numeroInicialDeHormigueros: anObject [

	numeroInicialDeHormigueros := anObject
]

{ #category : 'accessing' }
SFModel class >> numerosDeColumnas [

	^ numerosDeColumnas
]

{ #category : 'accessing' }
SFModel class >> numerosDeColumnas: anObject [

	numerosDeColumnas := anObject
]

{ #category : 'accessing' }
SFModel class >> numerosDeFilas [

	^ numerosDeFilas
]

{ #category : 'accessing' }
SFModel class >> numerosDeFilas: anObject [

	numerosDeFilas := anObject
]

{ #category : 'accessing' }
SFModel class >> prefix [

	^ 'SF'
]

{ #category : 'as yet unclassified' }
SFModel class >> proporcionRojos [
	^ 0.5  "50% rojos, 50% negros"
]

{ #category : 'init' }
SFModel >> ambienteHomogeneo [

<init>
self
createGridNumberOfRows: self class numerosDeFilas 
numberOfColumns: self class numerosDeColumnas 
neighbourhood:  4
closed: true .

"(self @@ SFAlimento) do: [ :each | each initializeWithRandomBiomass ]."
	
self initializeAgents.

hormigueros := (self agents select: [:each|each isKindOf: SFHormiguero ])
]

{ #category : 'accessing' }
SFModel >> hormigueros [

	^ hormigueros
]

{ #category : 'accessing' }
SFModel >> hormigueros: anObject [

	hormigueros := anObject
]

{ #category : 'init' }
SFModel >> init [

	<init>
	self
		createGridNumberOfRows: 4
		numberOfColumns: 4
		neighbourhood: 8
		closed: false
]

{ #category : 'init' }
SFModel >> initializeAgents [

| totalHormigueros rojos negros |
	
	totalHormigueros := self class numeroInicialDeHormigueros.
	rojos := (totalHormigueros * self class proporcionRojos) rounded.
	negros := totalHormigueros - rojos.
	
	"Crear hormigueros rojos"
	self
		createN: rojos
		randomlyLocatedAloneEntities: SFHormigueroRojo.
	
	"Crear hormigueros negros"
	self
		createN: negros
		randomlyLocatedAloneEntities: SFHormigueroNegro.
		
self
		createN: self class numeroInicialDeAlimentos 
		randomlyLocatedAloneEntities: SFAlimento.
]

{ #category : 'stepping and presenter' }
SFModel >> step [

	<control>
	
]
