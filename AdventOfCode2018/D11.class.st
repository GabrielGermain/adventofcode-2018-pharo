"
Day11
"
Class {
	#name : #D11,
	#superclass : #AOC18Base,
	#instVars : [
		'grid',
		'serial'
	],
	#category : #'AdventOfCode2018-Day11'
}

{ #category : #summedArea }
D11 >> computeSum [
	1 to: 300 do: [ :i | 1 to: 300 do: [ :j | self computeSumAt: i at: j] ]
]

{ #category : #summedArea }
D11 >> computeSumAt: i at: j [
	| cell sum |
	cell := grid at: i at: j.
	sum :=  cell power + (self getSumAt: i at: (j-1)) + (self getSumAt: (i-1) at: j) - (self getSumAt: (i-1) at: (j-1) ).
	cell sum: sum
]

{ #category : #summedArea }
D11 >> computeTotalAt: i at: j withSize: size [
	| x0 x1 y0 y1 total |
	x0 := i - 1.
	y0 := j - 1.
	x1 := x0 + size.
	y1 := y0 + size.
	total := (self getSumAt: x1 at: y1) + (self getSumAt: x0 at: y0 ) - (self getSumAt: x0 at: y1 ) - (self getSumAt: x1 at: y0).
	(grid at: i at: j) total: total 
	
]

{ #category : #summedArea }
D11 >> getSumAt: i at: j [
	(i < 1 or: [ j < 1 ]) ifTrue: [ ^0 ] ifFalse: [ ^(grid at: i at: j) sum ]
]

{ #category : #accessing }
D11 >> grid [
	^ grid
]

{ #category : #accessing }
D11 >> grid: anObject [
	grid := anObject
]

{ #category : #initialization }
D11 >> initialize [
	grid := Array2D new: 300.
	1 to: 300 do: [ :i | 1 to: 300 do: [ :j | grid at: i at: j put: (Cell withX: i withY: j) ] ]
]

{ #category : #parts }
D11 >> part1: size [
	| tmpCell "total" |
	grid do: [ :cell | cell computePower: serial; total: 0 ].
	self computeSum.
	1 to: (300-size+1) do: [ :i | 
		1 to: 300-size+1 do: [ :j | 
			self computeTotalAt: i at: j withSize: size 
			"tmpCell := grid at: i at: j.
			total := 0.
			0 to: size-1 do: [ :ii | 0 to: size-1 do: [ :jj | total := total + (grid at: i + ii at: j + jj) power ] ].
			tmpCell total: total" ] ].
	tmpCell := grid detectMax: [ :cell | cell total ].
	^ tmpCell
]

{ #category : #parts }
D11 >> part2 [
	| results cell result |
	results := OrderedCollection new.
	1 to: 300 do: [ :size | 
		cell := self part1: size.
		result := Cell withX: cell x withY: cell y.
		result total: cell total.
		result id: size.
		results add: result.
		Transcript show: size; cr ].
	^ results detectMax: [ :each | each total ]
]

{ #category : #accessing }
D11 >> serial [
	^ serial
]

{ #category : #accessing }
D11 >> serial: anObject [
	serial := anObject
]
