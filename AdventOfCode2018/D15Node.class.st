"
I'm a Node
"
Class {
	#name : #D15Node,
	#superclass : #Object,
	#instVars : [
		'id',
		'position',
		'target',
		'dist'
	],
	#category : #'AdventOfCode2018-Day15'
}

{ #category : #comparing }
D15Node >> <= aNode [
	(position y < aNode position y) ifTrue: [ ^ true ].
	(position y > aNode position y) ifTrue: [ ^ false ].
	^ (position x <= aNode position x)
]

{ #category : #accessing }
D15Node >> dist [
	^ dist
]

{ #category : #accessing }
D15Node >> dist: anObject [
	dist := anObject
]

{ #category : #accessing }
D15Node >> id [
	^ id
]

{ #category : #accessing }
D15Node >> id: anObject [
	id := anObject
]

{ #category : #accessing }
D15Node >> position [
	^ position
]

{ #category : #accessing }
D15Node >> position: anObject [
	position := anObject
]

{ #category : #API }
D15Node >> resetMarking [
	target := false.
	dist := nil
	
]

{ #category : #accessing }
D15Node >> target [
	^ target
]

{ #category : #accessing }
D15Node >> target: anObject [
	target := anObject
]

{ #category : #API }
D15Node >> visited [
	^ dist isNotNil
]
