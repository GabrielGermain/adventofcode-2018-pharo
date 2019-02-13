"
Day10
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

{ #category : #actions }
D10 >> forward [
	self time: (self time + 1).
	stars do: [ :each | each forward ]
]

{ #category : #initialization }
D10 >> initStars [
	self stars: (lines collect: [ :line | Star new fromLine: line ])
]

{ #category : #initialization }
D10 >> initialize [
	self time: 0
]

{ #category : #parts }
D10 >> part1 [

]

{ #category : #parts }
D10 >> part2 [

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
