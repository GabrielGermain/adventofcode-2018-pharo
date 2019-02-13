"
I'm a cell
"
Class {
	#name : #D15Cell,
	#superclass : #D15Node,
	#instVars : [
		'unit'
	],
	#category : #'AdventOfCode2018-Day15'
}

{ #category : #converting }
D15Cell >> asCharacter [
	(unit isNotNil) ifTrue: [ ^ unit asCharacter ].
	^ $.
]

{ #category : #API }
D15Cell >> isFoe: aUnit [
	^ (unit isNotNil) and: [ unit type ~= aUnit type ]
]

{ #category : #API }
D15Cell >> isFree [
	^ unit isNil.
]

{ #category : #printing }
D15Cell >> printOn: aStream [
	(unit isNotNil) ifTrue: [ unit printOn: aStream ] ifFalse: [ aStream nextPut: $. ]
]

{ #category : #accessing }
D15Cell >> unit [
	^ unit
]

{ #category : #accessing }
D15Cell >> unit: anObject [
	unit := anObject
]
