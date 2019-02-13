"
Test
"
Class {
	#name : #D11Test,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day11'
}

{ #category : #tests }
D11Test >> testPart1 [
	|inst|
	inst := D11 new serial: 18; yourself.
	self assert: (inst part1: 3) position equals: 33 @ 45.
	inst := D11 new serial: 42; yourself.
	self assert: (inst part1: 3) position equals: 21 @ 61
]
