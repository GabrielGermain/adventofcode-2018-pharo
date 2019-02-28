"
Day 20

D20 part1: 'E:/Gabriel_2/Work/AOC2018/Day20/input2.txt'
D20 part2: 'E:/Gabriel_2/Work/AOC2018/Day20/input2.txt'
"
Class {
	#name : #D20,
	#superclass : #AOC18Base,
	#instVars : [
		'stack',
		'dict',
		'directions',
		'current'
	],
	#category : #'AdventOfCode2018-Day20'
}

{ #category : #parts }
D20 >> checkAssumptions [
	| line curr prev next |
	"Check that no closing brace is followed by directions excepting when closing an empty alternative"
	line := lines first.
	(3 to: line size - 2) "Skip ^ and $"
		do: [ :i | 
			curr := line at: i.
			curr = $)
				ifTrue: [ prev := line at: i - 1.
					next := line at: i + 1.
					((prev ~= $|) and: [ next ~= $) and: [ next ~= $| ] ])
						ifTrue: [ ^ i ] ] ].
	^ 0
]

{ #category : #parts }
D20 >> computeDist [
]

{ #category : #parts }
D20 >> computeDistances [
	| list dist node children |
	dict valuesDo: [ :each | each visited: false ].
	list := OrderedCollection new.
	current dist: 0.
	list add: current.
	[ list isNotEmpty ]
		whileTrue: [ node := list removeFirst.
			node visited: true.
			children := node children reject: [ :child | child visited ].
			dist := node dist + 1.
			children
				do: [ :each | 
					each dist: dist.
					list add: each ] ]
]

{ #category : #initialization }
D20 >> initialize [
	self reset.
	stack := Stack new.
	dict := Dictionary new.
	directions := Dictionary
		newFrom:
			{($N -> (0 @ 1)).
			($E -> (1 @ 0)).
			($W -> (-1 @ 0)).
			($S -> (0 @ -1))}
]

{ #category : #parts }
D20 >> move: aChar [
	| node position |
	aChar = $^
		ifTrue: [ position := 0 @ 0.
			current := D20Node withPosition: position.
			dict at: position put: current.
			stack push: current.
			^ self ].
	aChar = $$
		ifTrue: [ current := stack pop.
			^ self ].
	(directions includesKey: aChar)
		ifTrue: [ position := current position + (directions at: aChar).
			node := dict at: position ifAbsentPut: [ D20Node withPosition: position ].
			current addChild: node.
			current := node.
			^ self ].
	aChar = $(
		ifTrue: [ stack push: current.
			^ self ].
	aChar = $|
		ifTrue: [ current := stack top.
			^ self ].
	aChar = $)
		ifTrue: [ stack pop.
			^ self ]
]

{ #category : #parts }
D20 >> parseInput [
	| stream |
	stream := ReadStream on: lines first.
	[ stream atEnd ] whileFalse: [ self move: stream next ].
]

{ #category : #parts }
D20 >> part1 [
	self checkAssumptions.
	self parseInput.
	self computeDistances.
	^ dict values max: [ :node | node dist ]

]

{ #category : #parts }
D20 >> part2 [
	self checkAssumptions.
	self parseInput.
	self computeDistances.
	^ (dict values select: [ :node | node dist >= 1000 ]) size
]

{ #category : #initialization }
D20 >> reset [
	stack := Stack new.
	dict := Dictionary new.

]
