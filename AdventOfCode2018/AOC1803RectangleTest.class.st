"
Test for AOC1803Rectangle.
"
Class {
	#name : #AOC1803RectangleTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day3'
}

{ #category : #tests }
AOC1803RectangleTest >> testCollide [
	| rect1 rect2 rect3 |
	rect1 := AOC1803Rectangle fromLine: '#1 @ 1,3: 4x4'.
	rect2 := AOC1803Rectangle fromLine: '#2 @ 3,1: 4x4'.
	rect3 := AOC1803Rectangle fromLine: '#3 @ 5,5: 2x2'.
	self assert: (rect1 collides: rect2) equals: true.
	self assert: (rect1 collides: rect3) equals: false.
	self assert: (rect2 collides: rect3) equals: false
]

{ #category : #tests }
AOC1803RectangleTest >> testCreation [
	| rect |
	rect := AOC1803Rectangle fromLine: '#123 @ 3,2: 5x4'.
	self assert: rect id equals: 123.
	self assert: rect edge equals: 3 @ 2.
	self assert: rect width equals: 5.
	self assert: rect height equals: 4
]
