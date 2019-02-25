"
Day 12

D12 part1: 'E:/Gabriel_2/Work/AOC2018/Day12/input2.txt'
D12 part2: 'E:/Gabriel_2/Work/AOC2018/Day12/input2.txt'
"
Class {
	#name : #D12,
	#superclass : #AOC18Base,
	#instVars : [
		'origState',
		'rules',
		'state',
		'indexZero',
		'sums'
	],
	#category : #'AdventOfCode2018-Day12'
}

{ #category : #parts }
D12 >> computeSum [
	| sum |
	sum := 0.
	state withIndexDo: [ :elt :i | elt = $# ifTrue: [ sum := sum + i - indexZero  ] ].
	^sum
]

{ #category : #accessing }
D12 >> indexZero [
	^ indexZero
]

{ #category : #accessing }
D12 >> indexZero: anObject [
	indexZero := anObject
]

{ #category : #initialization }
D12 >> initFromLines [
	| line ruleLines |
	line := lines at: 1.
	origState := line copyFrom: (line lastIndexOf: Character space) + 1 to: line size.
	ruleLines := lines copyFrom: 2 to: lines size.
	ruleLines := ruleLines select: [ :l | l endsWith: '#' ].
	rules := ruleLines collect: [ :l | l first: (l indexOf: Character space) - 1 ]
]

{ #category : #initialization }
D12 >> initState: nbGeneration [
	indexZero := nbGeneration + 3.
	state := OrderedCollection new.
	nbGeneration + 2 timesRepeat: [ state add: $. ].
	state addAll: origState.
	nbGeneration + 2 timesRepeat: [ state add: $. ].
]

{ #category : #parts }
D12 >> nextState [
	| newState str |
	newState := OrderedCollection new: state size withAll: $..
	1 to: state size - 4 do: [ :i | str := (state copyFrom: i to: i + 4) as:String. (rules includes: str) ifTrue: [newState at: i + 2 put: $#]].
	state := newState.
	
]

{ #category : #accessing }
D12 >> origState [
	^ origState
]

{ #category : #accessing }
D12 >> origState: anObject [
	origState := anObject
]

{ #category : #parts }
D12 >> part1 [
	self initFromLines.
	self initState: 20.
	20 timesRepeat: [ self nextState ].
	^ self computeSum
]

{ #category : #parts }
D12 >> part1: nbGeneration [
	self initFromLines.
	sums := OrderedCollection new.
	self initState: nbGeneration.
	nbGeneration
		timesRepeat: [ self nextState.
			sums add: self computeSum ].
	^ sums
]

{ #category : #parts }
D12 >> part2 [
	| last beforeLast interval |
	sums := self part1: 1000.
	last := sums removeLast.
	beforeLast := sums removeLast.
	interval := last - beforeLast.
	^ last + ((50000000000 - 1000) * interval)
]

{ #category : #accessing }
D12 >> rules [
	^ rules
]

{ #category : #accessing }
D12 >> rules: anObject [
	rules := anObject
]

{ #category : #accessing }
D12 >> state [
	^ state
]

{ #category : #accessing }
D12 >> state: anObject [
	state := anObject
]
