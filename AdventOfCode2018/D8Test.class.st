"
Test
"
Class {
	#name : #D8Test,
	#superclass : #TestCase,
	#instVars : [
		'inst'
	],
	#category : #'AdventOfCode2018-Day8'
}

{ #category : #tests }
D8Test >> setUp [
	inst := D8 new
		lines: {'2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2'};
		buildNodes;
		yourself.
]

{ #category : #tests }
D8Test >> testBuildNodes [
	self assert: inst root isNotNil
]

{ #category : #tests }
D8Test >> testPart1 [
	self assert: inst part1 equals: 138
]

{ #category : #tests }
D8Test >> testPart2 [
	self assert: inst part2 equals: 66
]
