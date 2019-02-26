"
Day 17

D17 part1: 'E:/Gabriel_2/Work/AOC2018/Day17/input2.txt'
D17 part2: 'E:/Gabriel_2/Work/AOC2018/Day17/input2.txt'
"
Class {
	#name : #D17,
	#superclass : #AOC18Base,
	#instVars : [
		'grid',
		'walls',
		'lowerBound',
		'upperBound',
		'lineIndex',
		'leftIndex',
		'rightIndex'
	],
	#category : #'AdventOfCode2018-Day17'
}

{ #category : #parts }
D17 >> buildGrid [
	| xInterval yInterval |
	walls := lines collect: [ :line | Clay fromLine: line ].
	self findLimits.
	xInterval := lowerBound x - 1 to: upperBound x + 1.
	yInterval := 1 to: upperBound y + 1.
	grid := Grid rowsInterval: yInterval columnsInterval: xInterval withAll: $..
	walls do: [ :each | each fillGrid: grid ]
]

{ #category : #parts }
D17 >> count [
	| count line |
	count := 0.
	lowerBound y to: upperBound y do: [ :j | 
		line := grid nativeLineAt: j.
		count := count + (line select: [ :val | val = $| or: [ val = $~ ] ]) size ].
	^ count
]

{ #category : #parts }
D17 >> countRetained [
	| count line |
	count := 0.
	lowerBound y to: upperBound y do: [ :j | 
		line := grid nativeLineAt: j.
		count := count + (line select: [ :val | val = $~ ]) size ].
	^ count
]

{ #category : #parts }
D17 >> fillClosedEnd [
	| line |
	line := grid nativeLineAt: lineIndex.
	leftIndex + 1 to: rightIndex - 1 do: [ :i | line at: i put: $~ ]
]

{ #category : #parts }
D17 >> fillLineFrom: index [
	| line nextLine |
	line := grid nativeLineAt: lineIndex.
	nextLine := grid nativeLineAt: lineIndex + 1.
	((line at: index + 1) = $| or: (nextLine at: index) = $|) ifTrue: [ ^self ].
	self findBoundaries: index.
	(self isClosedEnd) ifTrue: [ self fillClosedEnd. lineIndex := lineIndex - 2 ] ifFalse: [ self fillOpenEnd ]
	
	
	
]

{ #category : #parts }
D17 >> fillOpenEnd [
	| line nextLine |
	line := grid nativeLineAt: lineIndex.
	nextLine := grid nativeLineAt: lineIndex + 1.
	leftIndex + 1 to: rightIndex - 1 do: [ :i | line at: i put: $| ].
	(line at: leftIndex) = $# ifFalse: [ line at: leftIndex put: $|. nextLine at: leftIndex put: $| ].
	(line at: rightIndex) = $# ifFalse: [ line at: rightIndex put: $|. nextLine at: rightIndex put: $| ]
	
]

{ #category : #parts }
D17 >> findBoundaries: index [
	| line nextLine |
	line := grid nativeLineAt: lineIndex.
	nextLine := grid nativeLineAt: lineIndex + 1.
	leftIndex := index - 1.
	[ ((nextLine at: leftIndex) = $# or: [ (nextLine at: leftIndex) = $~ ]) and: [ (line at: leftIndex) ~= $# ] ] whileTrue: [ leftIndex := leftIndex - 1 ].
	rightIndex := index + 1.
	[ ((nextLine at: rightIndex) = $# or: [ (nextLine at: rightIndex) = $~ ]) and: [ (line at: rightIndex) ~= $# ] ] whileTrue: [ rightIndex := rightIndex + 1 ]
]

{ #category : #parts }
D17 >> findLimits [
	| xmin xmax ymin ymax |
	xmin := (walls collect: [ :wall | wall x first ]) min.
	xmax := (walls collect: [ :wall | wall x last ]) max.
	ymin := (walls collect: [ :wall | wall y first ]) min.
	ymax := (walls collect: [ :wall | wall y last ]) max.
	lowerBound := xmin @ ymin.
	upperBound := xmax @ ymax.
	
]

{ #category : #parts }
D17 >> flowToNextLine [
	| line nextLine |
	line := grid nativeLineAt: lineIndex.
	nextLine := grid nativeLineAt: lineIndex + 1.
	line
		withIndexDo: [ :val :i | 
			val = $|
				ifTrue: [ (nextLine at: i) = $.
						ifTrue: [ nextLine at: i put: $|]
						ifFalse: [ self fillLineFrom: i ] ] ].
				lineIndex := lineIndex + 1
]

{ #category : #parts }
D17 >> initWater [
	grid at: 500 at: 1 put: $|.
	lineIndex := 1.
]

{ #category : #parts }
D17 >> isClosedEnd [
	| line |
	line := grid nativeLineAt: lineIndex.
	^ (line at: leftIndex) = $# and: [ (line at: rightIndex) = $# ] 
]

{ #category : #parts }
D17 >> part1 [
	self buildGrid.
	self initWater.
]

{ #category : #parts }
D17 >> part2 [

]
