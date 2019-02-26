"
Day 15

D15 part1: 'E:/Gabriel_2/Work/AOC2018/Day15/input2.txt'
D15 part2: 'E:/Gabriel_2/Work/AOC2018/Day15/input2.txt'
"
Class {
	#name : #D15,
	#superclass : #AOC18Base,
	#instVars : [
		'id',
		'position',
		'grid',
		'units',
		'gameOver',
		'round'
	],
	#classVars : [
		'directions',
		'factoryMethods'
	],
	#category : #'AdventOfCode2018-Day15'
}

{ #category : #initialization }
D15 class >> initialize [
	factoryMethods := Dictionary
		newFrom:
			{($# -> #buildWall).
			($. -> #buildCell).
			($E -> #buildElf).
			($G -> #buildGoblin)}.
	directions := {(0 @ 1).
	(0 @ -1).
	(1 @ 0).
	(-1 @ 0)}
]

{ #category : #factory }
D15 >> buildCell [
	^D15Cell new position: position; id: self nextId; yourself
]

{ #category : #factory }
D15 >> buildCellWithType: aChar [
	| unit |
	unit := D15Unit new position: position; id: self nextId; type: aChar; yourself.
	units add: unit.
	^ D15Cell new position: position; id: self nextId; unit: unit; yourself.
]

{ #category : #factory }
D15 >> buildElf [
	^ self buildCellWithType: $E.
]

{ #category : #factory }
D15 >> buildGoblin [
	^ self buildCellWithType: $G
]

{ #category : #parts }
D15 >> buildGrid [
	grid := OrderedCollection new.
	units := OrderedCollection new.
	lines withIndexDo: [ :line :j | grid add: (line asOrderedCollection collectWithIndex: [:char :i | position := i @ j. self perform: (factoryMethods at: char)]) ]
]

{ #category : #factory }
D15 >> buildWall [
	^D15Wall new position: position; id: self nextId; yourself
]

{ #category : #parts }
D15 >> cellAt: aPoint [
	^ self cellAt: aPoint x at: aPoint y
]

{ #category : #parts }
D15 >> cellAt: i at: j [
	^ (grid at: j) at: i
]

{ #category : #parts }
D15 >> cellsAround: aCell [
	^ directions collect: [ :dir | self cellAt: aCell position + dir ].
	
]

{ #category : #parts }
D15 >> computeScore [
	^ round * (units collect: [:unit | unit hp]) sum
]

{ #category : #parts }
D15 >> elvesCount [
	^ (units select: [ :unit | unit type = $E ]) size
]

{ #category : #parts }
D15 >> endGame [
	gameOver := true.
]

{ #category : #parts }
D15 >> findNearestPositionFrom: aCell [
	| cells newCells tempCells |
	cells := OrderedCollection with: aCell.
	aCell target
		ifTrue: [ ^ aCell ].
	aCell dist: 0.
	[ cells isNotEmpty ]
		whileTrue: [ newCells := OrderedCollection new.
			cells
				do: [ :cell | 
					tempCells := self nonVisitedCellsAround: cell.
					tempCells do: [ :each | each dist: cell dist + 1 ].
					newCells addAll: tempCells ].
			tempCells := newCells select: [ :each | each target ].
			tempCells sort.
			tempCells isNotEmpty
				ifTrue: [ ^ tempCells first ].
			cells := newCells ].
	^ nil
]

{ #category : #parts }
D15 >> foeAround: aUnit [
	| cell |
	cell := self cellAt: aUnit position.
	^ (self cellsAround: cell) select: [ :c | c isFoe: aUnit ]
	
]

{ #category : #parts }
D15 >> freeCellsAround: aCell [
	| cells |
	cells := self cellsAround: aCell.
	^ cells select: [ :cell | cell isFree ]
	
]

{ #category : #accessing }
D15 >> grid [
	^ grid
]

{ #category : #accessing }
D15 >> grid: anObject [
	grid := anObject
]

{ #category : #parts }
D15 >> handleAttack: aUnit [
	| foes minHP target |
	foes := (self foeAround: aUnit) collect: [ :cell | cell unit ].
	foes isEmpty
		ifTrue: [ ^ self ].
	minHP := (foes detectMin: [ :unit | unit hp ]) hp.
	foes := foes select: [ :unit | unit hp = minHP ].
	foes sort.
	target := foes first.
	aUnit hit: target.
	target isDead
		ifFalse: [ ^ self ].
	units remove: target.
	(self cellAt: target position) unit: nil
]

{ #category : #initialization }
D15 >> initialize [
	id := 0.
	gameOver := false.
	round := 0.
]

{ #category : #parts }
D15 >> isFoeAround: aUnit [
	| cell |
	cell := self cellAt: aUnit position.
	^ (self cellsAround: cell) anySatisfy: [ :c | c isFoe: aUnit ]
	
]

{ #category : #parts }
D15 >> markCellsAround: someUnits [
	| cells cell |
	someUnits
		do: [ :unit | 
			cell := self cellAt: unit position.
			cells := self freeCellsAround: cell.
			cells do: [ :each | each target: true ] ]
]

{ #category : #parts }
D15 >> move: aUnit to: targets [
	| currentCell targetCell moveCell |
	aUnit moved: true.
	(self isFoeAround: aUnit)
		ifTrue: [ ^ self ].	"If the unit is already in range of a target, it does not move"
	currentCell := self cellAt: aUnit position.
	self resetMarks.
	self markCellsAround: targets.
	targetCell := self findNearestPositionFrom: currentCell.
	targetCell isNil
		ifTrue: [ ^ self ].
	self resetMarks.
	self markCellsAround: (OrderedCollection with: aUnit).
	moveCell := self findNearestPositionFrom: targetCell.
	currentCell unit: nil.
	moveCell unit: aUnit.
	aUnit position: moveCell position
]

{ #category : #factory }
D15 >> nextId [
	id := id + 1.
	^id
]

{ #category : #parts }
D15 >> nextRound [
	| selectedIndex |
	units sort.
	units do: [ :unit | unit moved: false ].
	[ (units anySatisfy: [ :unit | unit moved not ]) and: [ gameOver not ] ] whileTrue: [ selectedIndex := units findFirst: [ :unit | unit moved not ]. self nextRound: (units at: selectedIndex). ].
	(gameOver) ifFalse: [ round := round + 1 ]
	

]

{ #category : #parts }
D15 >> nextRound: aUnit [
	| targets |
	targets := self selectTargets: aUnit.
	targets isEmpty
		ifTrue: [ ^ self endGame ].
	self move: aUnit to: targets.
	self handleAttack: aUnit.
]

{ #category : #parts }
D15 >> nonVisitedCellsAround: aCell [
	| cells |
	cells := self freeCellsAround: aCell.
	^ cells reject: [ :cell | cell visited ]
]

{ #category : #parts }
D15 >> part1 [
	gameOver := false.
	units := OrderedCollection new.
	round := 0.
	self buildGrid.
	[ gameOver ] whileFalse: [ self nextRound ].
	^ self computeScore.

]

{ #category : #parts }
D15 >> part1: power [
	gameOver := false.
	units := OrderedCollection new.
	round := 0.
	self buildGrid.
	self powerUpElves: power.
	[ gameOver ] whileFalse: [ self nextRound ].
	^ self computeScore.

]

{ #category : #parts }
D15 >> part2 [
	| goal elvesCount result power |
	id := 0.
	self buildGrid.
	goal := self elvesCount.
	elvesCount := 0.
	power := 4.
	[ elvesCount < goal ] whileTrue: [ result := self part1: power. elvesCount := self elvesCount. power := power + 1 ].
	^ OrderedCollection with: result with: power

	
	

]

{ #category : #parts }
D15 >> powerUpElves: power [
	^ (units select: [ :unit | unit type = $E ]) do: [ :each | each power: power ]
]

{ #category : #printing }
D15 >> printGrid [
	grid do: [ :line | Transcript show: ((line collect: [:c | c asCharacter]) as:String); cr ]
]

{ #category : #parts }
D15 >> resetMarks [
	grid do: [ :line | line do: [ :cell | cell resetMarking ] ]
]

{ #category : #parts }
D15 >> selectTargets: aUnit [
	^ units select: [ :unit | unit type ~= aUnit type ]
]
