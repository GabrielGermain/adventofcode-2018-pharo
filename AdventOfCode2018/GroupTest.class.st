"
Test
"
Class {
	#name : #GroupTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day24'
}

{ #category : #tests }
GroupTest >> testFromLine [
	| line group |
	line := '864 units each with 38189 hit points with an attack that does 72 slashing damage at initiative 6'.
	group := Group fromLine: line.
	self assert: group units equals: 864.
	self assert: group hp equals: 38189.
	self assert: group damage equals: 72.
	self assert: group type equals: 'slashing'.
	self assert: group initiative equals: 6.
	self assert: group weaknesses isEmpty.
	self assert: group immunities isEmpty
]

{ #category : #tests }
GroupTest >> testFromLineWeakAndImm [
	| line group |
	line := '18 units each with 729 hit points (weak to fire; immune to cold, slashing) with an attack that does 8 radiation damage at initiative 10'.
	group := Group fromLine: line.
	self assert: group units equals: 18.
	self assert: group hp equals: 729.
	self assert: group damage equals: 8.
	self assert: group type equals: 'radiation'.
	self assert: group initiative equals: 10.
	self assert: group weaknesses equals: (OrderedCollection newFrom: {'fire'}).
	self assert: group immunities equals: (OrderedCollection newFrom: {'cold'. 'slashing'})
]
