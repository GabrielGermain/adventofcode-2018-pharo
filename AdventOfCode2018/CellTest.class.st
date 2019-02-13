"
Test
"
Class {
	#name : #CellTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day11'
}

{ #category : #tests }
CellTest >> testComputePower [
	| cell |
	cell := Cell withX: 3 withY: 5.
	cell computePower: 8.
	self assert: cell power equals: 4.
	cell := Cell withX: 122 withY: 79.
	cell computePower: 57.
	self assert: cell power equals: -5.
	cell := Cell withX: 217 withY: 196.
	cell computePower: 39.
	self assert: cell power equals: 0.
	cell := Cell withX: 101 withY: 153.
	cell computePower: 71.
	self assert: cell power equals: 4
]
