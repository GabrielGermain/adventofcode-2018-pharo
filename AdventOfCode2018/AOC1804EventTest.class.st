"
Test for AOC1804Event
"
Class {
	#name : #AOC1804EventTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day4'
}

{ #category : #tests }
AOC1804EventTest >> testCreation [ 
	| inst |
	inst := AOC1804Event fromLine: '[1518-03-15 23:50] Guard #1811 begins shift'.
	self assert: inst date equals: '1518-03-15'.
	self assert: inst minutes equals: 50.
	self assert: inst actionString equals: 'Guard #1811 begins shift'
]
