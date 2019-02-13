"
I'm a wall
"
Class {
	#name : #D15Wall,
	#superclass : #D15Node,
	#category : #'AdventOfCode2018-Day15'
}

{ #category : #converting }
D15Wall >> asCharacter [
	^ $#
]

{ #category : #API }
D15Wall >> isFoe: aUnit [
	^ false
]

{ #category : #API }
D15Wall >> isFree [
	^ false
]

{ #category : #printing }
D15Wall >> printOn: aStream [
	aStream nextPut: $#
]
