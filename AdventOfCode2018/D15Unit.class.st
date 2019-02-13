"
I'm a Unit
"
Class {
	#name : #D15Unit,
	#superclass : #Object,
	#instVars : [
		'id',
		'type',
		'position',
		'moved',
		'power',
		'hp'
	],
	#category : #'AdventOfCode2018-Day15'
}

{ #category : #comparing }
D15Unit >> <= aUnit [
	(position y < aUnit position y) ifTrue: [ ^ true ].
	(position y > aUnit position y) ifTrue: [ ^ false ].
	^ (position x <= aUnit position x)
	
]

{ #category : #converting }
D15Unit >> asCharacter [
	^ type
]

{ #category : #API }
D15Unit >> hit: aUnit [
	aUnit hp: (aUnit hp - power)
]

{ #category : #accessing }
D15Unit >> hp [
	^ hp
]

{ #category : #accessing }
D15Unit >> hp: anObject [
	hp := anObject
]

{ #category : #accessing }
D15Unit >> id [
	^ id
]

{ #category : #accessing }
D15Unit >> id: anObject [
	id := anObject
]

{ #category : #initialization }
D15Unit >> initialization [
	hp := 200.
	power := 3.
]

{ #category : #initialization }
D15Unit >> initialize [
	hp := 200.
	power := 3.
]

{ #category : #API }
D15Unit >> isDead [
	^ hp <= 0
]

{ #category : #accessing }
D15Unit >> moved [
	^ moved
]

{ #category : #accessing }
D15Unit >> moved: anObject [
	moved := anObject
]

{ #category : #accessing }
D15Unit >> position [
	^ position
]

{ #category : #accessing }
D15Unit >> position: anObject [
	position := anObject
]

{ #category : #accessing }
D15Unit >> power [
	^ power
]

{ #category : #accessing }
D15Unit >> power: anObject [
	power := anObject
]

{ #category : #printing }
D15Unit >> printOn: aStream [
	aStream nextPut: type;  nextPut: $-; nextPutAll: id asString 
]

{ #category : #accessing }
D15Unit >> type [
	^ type
]

{ #category : #accessing }
D15Unit >> type: anObject [
	type := anObject
]
