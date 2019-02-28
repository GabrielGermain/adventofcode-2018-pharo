"
Day 18

D18 part1: 'E:/Gabriel_2/Work/AOC2018/Day18/input2.txt'
D18 part2: 'E:/Gabriel_2/Work/AOC2018/Day18/input2.txt'
"
Class {
	#name : #D18,
	#superclass : #AOC18Base,
	#instVars : [
		'grid',
		'nbRows',
		'nbColumns',
		'lumberyards',
		'trees'
	],
	#category : #'AdventOfCode2018-Day18'
}

{ #category : #parts }
D18 >> buildGrid [
	nbRows := lines size.
	nbColumns := lines first size.
	grid := Grid rows: nbRows + 2 columns: nbColumns + 2 withAll: $..
	lines withIndexDo: [ :line :j | line withIndexDo: [ :val :i | grid at: i + 1 at: j + 1 put: val ] ]
]

{ #category : #parts }
D18 >> countAt: i at: j [
	| val |
	lumberyards := 0.
	trees := 0.
	i - 1 to: i + 1 do: [ :ii | 
		j - 1 to: j + 1 do: [ :jj | 
			val := grid at: ii at: jj.
			val = $#
				ifTrue: [ lumberyards := lumberyards + 1 ].
			val = $|
				ifTrue: [ trees := trees + 1 ] ] ].
	val := grid at: i at: j.
	val = $#
		ifTrue: [ lumberyards := lumberyards - 1 ].
	val = $|
		ifTrue: [ trees := trees - 1 ]
]

{ #category : #parts }
D18 >> nextMinute [
	| newGrid newVal val |
	newGrid := Grid rows: nbRows + 2 columns: nbColumns + 2 withAll: $..
	2 to: nbRows + 1 do: [ :j | 
		2 to: nbColumns + 1 do: [ :i | 
			val := grid at: i at: j.
			newVal := val.
			self countAt: i at: j.
			(val = $. and: [ trees >= 3 ])
				ifTrue: [ newVal := $| ].
			(val = $| and: [ lumberyards >= 3 ])
				ifTrue: [ newVal := $# ].
			val = $# ifTrue: [ (trees >= 1 and: [ lumberyards >= 1 ]) ifFalse: [ newVal := $. ] ].
			newGrid at: i at: j put: newVal ] ].
	grid := newGrid
]

{ #category : #parts }
D18 >> part1 [
	self buildGrid.
	10 timesRepeat: [ self nextMinute ].
	^ self score
]

{ #category : #parts }
D18 >> part2 [
	^ self part2: 1000000000
]

{ #category : #parts }
D18 >> part2: minutes [
	| values score newScore buffer |
	self buildGrid.
	"^ (1 to: 10000) collect: [ :i | self nextMinute. Array with: self score with: trees with: lumberyards  ]"
	999 timesRepeat: [ self nextMinute ].
	values := OrderedCollection new.
	score := self score.
	newScore := 0.
	[ newScore ~= score ] whileTrue: [ self nextMinute. newScore := self score. values add: newScore ].
	buffer := CircularBuffer fromArray: values asArray.
	^ buffer rotate: minutes - 1000.

]

{ #category : #parts }
D18 >> score [
	| val |
	trees := 0.
	lumberyards := 0.
	2 to: nbRows + 1 do: [ :j | 
		2 to: nbColumns + 1 do: [ :i | 
			val := grid at: i at: j.
			val = $|
				ifTrue: [ trees := trees + 1 ].
			val = $#
				ifTrue: [ lumberyards := lumberyards + 1 ] ] ].
	^ trees * lumberyards
]
