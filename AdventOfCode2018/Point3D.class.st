"
Point3D
"
Class {
	#name : #Point3D,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : #'AdventOfCode2018-Day23'
}

{ #category : #initialization }
Point3D class >> x: x y: y z: z [
	^ self new
		x: x;
		y: y;
		z: z;
		yourself
]

{ #category : #arithmetic }
Point3D >> + arg [
	^ Point3D x: x + arg x y: y + arg y z: z + arg z
]

{ #category : #arithmetic }
Point3D >> - arg [
	^ Point3D x: x - arg x y: y - arg y z: z - arg z
]

{ #category : #arithmetic }
Point3D >> = other [
	^ x = other x and: [ y = other y and: [ z = other z ] ]
]

{ #category : #operations }
Point3D >> manhattanDist [
	"Manhattan distance from origin"
	^ x abs + y abs + z abs
]

{ #category : #operations }
Point3D >> manhattanDist: aPoint [
	^ (x - aPoint x) abs + (y - aPoint y) abs + (z - aPoint z) abs
]

{ #category : #printing }
Point3D >> printOn: aStream [
	aStream nextPut: $(.
	x printOn: aStream.
	aStream nextPut: $,.
	y printOn: aStream.
	aStream nextPut: $,.
	z printOn: aStream.
	aStream nextPut: $)
]

{ #category : #arithmetic }
Point3D >> scaleByInt: aScalar [
	^ self class x: x * aScalar y: y * aScalar z: z * aScalar
]

{ #category : #accessing }
Point3D >> x [
	^ x
]

{ #category : #accessing }
Point3D >> x: anObject [
	x := anObject
]

{ #category : #accessing }
Point3D >> y [
	^ y
]

{ #category : #accessing }
Point3D >> y: anObject [
	y := anObject
]

{ #category : #accessing }
Point3D >> z [
	^ z
]

{ #category : #accessing }
Point3D >> z: anObject [
	z := anObject
]
