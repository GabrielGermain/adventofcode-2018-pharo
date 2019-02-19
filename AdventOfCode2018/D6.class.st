"
Day 6

D6 part1: 'E:/Gabriel_2/Work/AOC2018/Day6/input.txt'
D6 part2: 'E:/Gabriel_2/Work/AOC2018/Day6/input.txt'
"
Class {
	#name : #D6,
	#superclass : #AOC18Base,
	#instVars : [
		'grid',
		'points'
	],
	#category : #'AdventOfCode2018-Day6'
}

{ #category : #accessing }
D6 >> grid [
	^ grid
]

{ #category : #accessing }
D6 >> grid: anObject [
	grid := anObject
]

{ #category : #parts }
D6 >> part1 [
	| max tempPoint dists min nbMin indices |
	points := lines collect: [ :line | self pointFromLine: line ].
	max := (points
		flatCollect: [ :p | 
			{p x.
			p y} ]) max.
	grid := Array2D zeros: max.
	grid := grid
		indicesCollect: [ :i :j | 
			tempPoint := i @ j.
			dists := points collect: [ :p | tempPoint manhattanDist: p ].
			min := dists min.
			nbMin := dists occurrencesOf: min.
			nbMin = 1
				ifTrue: [ dists indexOf: min ]
				ifFalse: [ 0 ] ].
	indices := (1 to: points size) asSet.
	" Remove boudaries "
	1 to: max do: [ :i | 
		indices remove: (grid at: 1 at: i) ifAbsent: [  ].
		indices remove: (grid at: i at: 1) ifAbsent: [  ].
		indices remove: (grid at: i at: max) ifAbsent: [  ].
		indices remove: (grid at: max at: i) ifAbsent: [  ] ].
	^ (indices collect: [ :i | grid occurrencesOf: i ]) max
]

{ #category : #parts }
D6 >> part2 [
	| max tempPoint dists sum |
	points := lines collect: [ :line | self pointFromLine: line ].
	max := (points
		flatCollect: [ :p | 
			{p x.
			p y} ]) max.
	grid := Array2D zeros: max.
	grid := grid
		indicesCollect: [ :i :j | 
			tempPoint := i @ j.
			dists := points collect: [ :p | tempPoint manhattanDist: p ].
			sum := dists sum.
			sum < 10000
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ].
	^ grid occurrencesOf: 1
]

{ #category : #private }
D6 >> pointFromLine: aLine [
	| coll |
	coll := aLine splitOn: $,.
	^ (coll at: 1) asInteger @ (coll at: 2) asInteger
]

{ #category : #accessing }
D6 >> points [
	^ points
]

{ #category : #accessing }
D6 >> points: anObject [
	points := anObject
]
