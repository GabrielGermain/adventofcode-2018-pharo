"
Cell
"
Class {
	#name : #Cell,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'power',
		'total',
		'id',
		'sum'
	],
	#category : #'AdventOfCode2018-Day11'
}

{ #category : #initialization }
Cell class >> withX: x withY: y [
	^ Cell new x: x; y: y; yourself
]

{ #category : #actions }
Cell >> computePower: aSerialNumber [
	|rackID tmp |
	rackID := 10 + x.
	tmp := ((rackID * y) + aSerialNumber) * rackID.
	power := (tmp digitAt: 3 base: 10) - 5
]

{ #category : #accessing }
Cell >> id [
	^ id
]

{ #category : #accessing }
Cell >> id: anObject [
	id := anObject
]

{ #category : #initialization }
Cell >> initialize [ 
	total := 0
]

{ #category : #accessing }
Cell >> position [
	^x @ y
]

{ #category : #accessing }
Cell >> power [
	^ power
]

{ #category : #accessing }
Cell >> power: anObject [
	power := anObject
]

{ #category : #accessing }
Cell >> sum [
	^ sum
]

{ #category : #accessing }
Cell >> sum: anObject [
	sum := anObject
]

{ #category : #accessing }
Cell >> total [
	^ total
]

{ #category : #accessing }
Cell >> total: anObject [
	total := anObject
]

{ #category : #accessing }
Cell >> x [
	^ x
]

{ #category : #accessing }
Cell >> x: anObject [
	x := anObject
]

{ #category : #accessing }
Cell >> y [
	^ y
]

{ #category : #accessing }
Cell >> y: anObject [
	y := anObject
]
