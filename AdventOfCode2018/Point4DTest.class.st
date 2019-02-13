"
Test
"
Class {
	#name : #Point4DTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day25'
}

{ #category : #tests }
Point4DTest >> testCreateFromLine [
	| inst |
	inst := Point4D fromLine: '1,2,3,4'.
	self assert: inst x equals: 1.
	self assert: inst y equals: 2.
	self assert: inst z equals: 3.
	self assert: inst t equals: 4.
]
