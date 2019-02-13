"
Tests
"
Class {
	#name : #D7Test,
	#superclass : #TestCase,
	#instVars : [
		'inst'
	],
	#category : #'AdventOfCode2018-Day7'
}

{ #category : #'setUp-tearDown' }
D7Test >> setUp [
	| lines |
	lines := {'Step C must be finished before step A can begin.' . 'Step C must be finished before step F can begin.' . 'Step A must be finished before step B can begin.'.
	'Step A must be finished before step D can begin.' . 'Step B must be finished before step E can begin.' . 'Step D must be finished before step E can begin.'.
	'Step F must be finished before step E can begin.'}.
	inst := D7 new
		lines: lines;
		stepTime: 0;
		nbWorkers: 2;
		yourself
]

{ #category : #tests }
D7Test >> testInitGrid [
	inst initGrid.
	self assert: inst letters asArray equals: ($A to: $F)
]

{ #category : #tests }
D7Test >> testPart1 [
	self assert: inst part1 equals: 'CABDFE'
]

{ #category : #tests }
D7Test >> testPart2 [
	self assert: inst part2 equals:  15
]
