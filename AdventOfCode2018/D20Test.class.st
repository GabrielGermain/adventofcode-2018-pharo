"
Test
"
Class {
	#name : #D20Test,
	#superclass : #TestCase,
	#instVars : [
		'inst'
	],
	#category : #'AdventOfCode2018-Day20'
}

{ #category : #tests }
D20Test >> test01CheckAssumptions [
	inst := D20 new lines: { '^E(N|S)W$' }; yourself.
	self assert: inst checkAssumptions equals: 7.
]

{ #category : #tests }
D20Test >> test02CheckAssumptions [
	inst := D20 new lines: { '^E(NS|)W$' }; yourself.
	self assert: inst checkAssumptions equals: 0.
]
