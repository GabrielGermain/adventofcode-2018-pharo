"
Node
"
Class {
	#name : #D20Node,
	#superclass : #Object,
	#instVars : [
		'position',
		'children',
		'dist',
		'visited'
	],
	#category : #'AdventOfCode2018-Day20'
}

{ #category : #initialization }
D20Node class >> withPosition: aPoint [
	^ D20Node new position: aPoint; yourself
]

{ #category : #accessing }
D20Node >> addChild: aNode [
	children add: aNode
]

{ #category : #accessing }
D20Node >> children [
	^ children
]

{ #category : #accessing }
D20Node >> children: anObject [
	children := anObject
]

{ #category : #accessing }
D20Node >> dist [
	^ dist
]

{ #category : #accessing }
D20Node >> dist: anObject [
	dist := anObject
]

{ #category : #initialization }
D20Node >> initialize [
	children := OrderedCollection new
]

{ #category : #accessing }
D20Node >> position [
	^ position
]

{ #category : #accessing }
D20Node >> position: anObject [
	position := anObject
]

{ #category : #accessing }
D20Node >> visited [
	^ visited
]

{ #category : #accessing }
D20Node >> visited: anObject [
	visited := anObject
]
