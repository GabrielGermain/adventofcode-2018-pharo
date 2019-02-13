"
Test assumptions about inRange method
"
Class {
	#name : #CubeTest,
	#superclass : #Object,
	#category : #'AdventOfCode2018-Day23'
}

{ #category : #tests }
CubeTest >> allTests [
	0 to: 5 do: [ :range | 
		self testWithLength: 2 range: range space: 10.
		self testWithLength: 4 range: range space: 10 ]
]

{ #category : #tests }
CubeTest >> testWithLength: length range: range space: space [
	| cube nanobot isInRange isInRangeBruteForce |
	cube := Cube center: (Point3D x: 0 y: 0 z: 0) length: length.
	space negated to: space do: [ :x | 
		space negated to: space do: [ :y | 
			space negated to: space do: [ :z | 
				nanobot := Nanobot pos: (Point3D x: x y: y z: z) r: range.
				isInRange := cube isInRange: nanobot.
				isInRangeBruteForce := cube isInRangeBruteForce: nanobot.
				(isInRange xor: [ isInRangeBruteForce ])
					ifTrue: [ self halt ] ] ] ]
]
