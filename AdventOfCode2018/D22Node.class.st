"
A node
"
Class {
	#name : #D22Node,
	#superclass : #Object,
	#instVars : [
		'parent',
		'position',
		'g',
		'h',
		'f',
		'tool',
		'closed'
	],
	#category : #'AdventOfCode2018-Day22'
}

{ #category : #initialization }
D22Node class >> withPosition: aPoint f: f h: h g: g [
	^ D22Node new position: aPoint; f: f; h: h; g: g; yourself
]

{ #category : #initialization }
D22Node class >> withPosition: aPoint f: f h: h g: g tool: tool [
	^ D22Node new position: aPoint; f: f; h: h; g: g; tool: tool; yourself
]

{ #category : #initialization }
D22Node class >> withPosition: aPoint f: f h: h g: g tool: tool parent: parent [
	^ D22Node new position: aPoint; f: f; h: h; g: g; tool: tool; parent: parent; yourself
]

{ #category : #accessing }
D22Node >> closed [
	^ closed
]

{ #category : #accessing }
D22Node >> closed: anObject [
	closed := anObject
]

{ #category : #accessing }
D22Node >> f [
	^ f
]

{ #category : #accessing }
D22Node >> f: anObject [
	f := anObject
]

{ #category : #accessing }
D22Node >> g [
	^ g
]

{ #category : #accessing }
D22Node >> g: anObject [
	g := anObject
]

{ #category : #accessing }
D22Node >> h [
	^ h
]

{ #category : #accessing }
D22Node >> h: anObject [
	h := anObject
]

{ #category : #initialize }
D22Node >> initialize [
	closed := false
]

{ #category : #accessing }
D22Node >> parent [
	^ parent
]

{ #category : #accessing }
D22Node >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
D22Node >> position [
	^ position
]

{ #category : #accessing }
D22Node >> position: anObject [
	position := anObject
]

{ #category : #accessing }
D22Node >> tool [
	^ tool
]

{ #category : #accessing }
D22Node >> tool: anObject [
	tool := anObject
]
