"
Day10

D10 part1: 'E:/Gabriel_2/Work/AOC2018/Day10/input.txt'
D10 part2: 'E:/Gabriel_2/Work/AOC2018/Day10/input.txt'
"
Class {
	#name : #D10,
	#superclass : #AOC18Base,
	#instVars : [
		'stars',
		'time'
	],
	#category : #'AdventOfCode2018-Day10'
}

{ #category : #actions }
D10 >> backward [
	self time: self time - 1.
	stars do: [ :each | each backward ]
]

{ #category : #parts }
D10 >> computeSize [
	| min max |
	min := (stars detectMin: [ :star | star y ]) y.
	max := (stars detectMax: [ :star | star y ]) y.
	^ max - min
]

{ #category : #parts }
D10 >> display [
	| minY maxY minX maxX grid |
	minY := (stars detectMin: [ :star | star y ]) y.
	maxY := (stars detectMax: [ :star | star y ]) y.
	minX := (stars detectMin: [ :star | star x ]) x.
	maxX := (stars detectMax: [ :star | star x ]) x.
	grid := Grid rowsInterval: (minY to: maxY) columnsInterval: (minX to: maxX)  withAll: Character space.
	stars do: [ :each | grid at: each x at: each y put: $* ].
	grid print
]

{ #category : #actions }
D10 >> forward [
	self time: (self time + 1).
	stars do: [ :each | each forward ]
]

{ #category : #initialization }
D10 >> initStars [
	self stars: (lines collect: [ :line | Star new fromString: line ])
]

{ #category : #initialization }
D10 >> initialize [
	self time: 0
]

{ #category : #parts }
D10 >> part1 [
	| size |
	self initStars.
	size := self computeSize.
	[ size >= 10 ]
		whileTrue: [ self forward.
			size := self computeSize ].
	self display
]

{ #category : #parts }
D10 >> part2 [
	self part1.
	^ time

]

{ #category : #actions }
D10 >> plot [
" Roassal needed
	graph := RTDynamicGrapher new.
	graph extent: 600 @ 600.
	graph minX: 0; maxX: 250.
	graph minY: 0; maxY: 250.
	graph x: #x; y: #y.
	graph shape circle color: (Color red alpha: 0.3).
	graph view addMenu: '+1' callback: [ self forward.graph clean; addAll: stars ].
	graph view addMenu: '-1' callback: [ self backward.graph clean; addAll: stars ].
	graph view addMenu: '-100' callback: [ 100 timesRepeat: [self backward].graph clean; addAll: stars ].
	graph view addMenu: '+100' callback: [ 100 timesRepeat: [self forward].graph clean; addAll: stars ].
	graph addAll: stars.
	^ graph
"
]

{ #category : #accessing }
D10 >> stars [
	^ stars
]

{ #category : #accessing }
D10 >> stars: anObject [
	stars := anObject
]

{ #category : #accessing }
D10 >> time [
	^ time
]

{ #category : #accessing }
D10 >> time: anObject [
	time := anObject
]
