"
Test for AOC1801Main
"
Class {
	#name : #AOC1801MainTest,
	#superclass : #TestCase,
	#instVars : [
		'main'
	],
	#category : #'AdventOfCode2018-Day1'
}

{ #category : #'setUp-tearDown' }
AOC1801MainTest >> setUp [
	main := AOC1801Main new
		lines: #('+1' '-1');
		yourself
]

{ #category : #tests }
AOC1801MainTest >> testChanges [
	self assert: main changes equals: #(1 -1)
]

{ #category : #tests }
AOC1801MainTest >> testCreationWithFile [
	self assert: (AOC1801Main fromFile: 'E:/Gabriel_2/Work/AOC2018/Day1/test.txt') lines equals: #('+1' '+2' '-1' '-3')
]

{ #category : #tests }
AOC1801MainTest >> testCreationWithLines [
	self assert: main lines equals: #('+1' '-1')
]

{ #category : #tests }
AOC1801MainTest >> testPart1_1 [
	| main1 |
	main1 := AOC1801Main new lines: #('+1' '+1' '+1').
	self assert: main1 part1 equals: 3
]

{ #category : #tests }
AOC1801MainTest >> testPart2_1 [
	self assert: main part2 equals: 0
]

{ #category : #tests }
AOC1801MainTest >> testPart2_2 [
	| main2 |
	main2 := AOC1801Main new lines: #('+3' '+3' '+4' '-2' '-4').
	self assert: main2 part2 equals: 10
]

{ #category : #tests }
AOC1801MainTest >> testPart2_3 [
	| main2 |
	main2 := AOC1801Main new lines: #('-6' '+3' '+8' '+5' '-6').
	self assert: main2 part2 equals: 5
]
