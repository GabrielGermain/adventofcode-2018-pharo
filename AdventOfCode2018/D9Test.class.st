"
Test
"
Class {
	#name : #D9Test,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day9'
}

{ #category : #tests }
D9Test >> testPart1_1 [
	| inst |
	inst := D9 new
		lines: {'10 players; last marble is worth 1618 points'};
		yourself.
		self assert: inst part1 equals: 8317
]
