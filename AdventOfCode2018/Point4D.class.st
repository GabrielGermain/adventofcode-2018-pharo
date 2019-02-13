"
4D point
"
Class {
	#name : #Point4D,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z',
		't'
	],
	#category : #'AdventOfCode2018-Day25'
}

{ #category : #initialization }
Point4D class >> fromLine: aLine [
	| array |
	array := (aLine splitOn: $,) collect: [ :each | each asInteger ].
	^ self
		x: (array at: 1)
		y: (array at: 2)
		z: (array at: 3)
		t: (array at: 4)
]

{ #category : #initialization }
Point4D class >> x: x y: y z: z t: t [
	^ self new x: x; y: y; z: z; t: t; yourself
	
]

{ #category : #comparing }
Point4D >> = other [
	^ x = other x
		and: [ y = other y and: [ z = other z and: [ t = other t ] ] ]
]

{ #category : #operations }
Point4D >> manhattanDist: aPoint [
	^ (x - aPoint x) abs + (y - aPoint y) abs + (z - aPoint z) abs + (t - aPoint t) abs
]

{ #category : #accessing }
Point4D >> t [
	^ t
]

{ #category : #accessing }
Point4D >> t: anObject [
	t := anObject
]

{ #category : #accessing }
Point4D >> x [
	^ x
]

{ #category : #accessing }
Point4D >> x: anObject [
	x := anObject
]

{ #category : #accessing }
Point4D >> y [
	^ y
]

{ #category : #accessing }
Point4D >> y: anObject [
	y := anObject
]

{ #category : #accessing }
Point4D >> z [
	^ z
]

{ #category : #accessing }
Point4D >> z: anObject [
	z := anObject
]
