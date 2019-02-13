"
Day 9
"
Class {
	#name : #D9,
	#superclass : #AOC18Base,
	#instVars : [
		'root',
		'marble',
		'count',
		'players',
		'lastMarble',
		'nbPlayers'
	],
	#classVars : [
		'Matcher'
	],
	#category : #'AdventOfCode2018-Day9'
}

{ #category : #initialization }
D9 class >> initialize [
	Matcher := RxMatcher forString: '(\d+) players; last marble is worth (\d+) points'
]

{ #category : #actions }
D9 >> addScore: anInt to: anIndex [
	players at: anIndex put: (players at: anIndex) + anInt
]

{ #category : #accessing }
D9 >> count [
	^ count
]

{ #category : #accessing }
D9 >> count: anObject [
	count := anObject
]

{ #category : #initialization }
D9 >> initFromLines [
	Matcher matches: (lines at: 1).
	self nbPlayers: (Matcher subexpression: 2) asInteger.
	self lastMarble: (Matcher subexpression: 3) asInteger.
	self initPlayers.
]

{ #category : #actions }
D9 >> initPlayers [
	players := (1 to: nbPlayers) collect: [ :i | 0 ]
]

{ #category : #initialization }
D9 >> initialize [
	count := 0.
	marble := Marble new
		value: 0;
		yourself.
	marble previous: marble.
	marble next: marble.
	root := marble.
]

{ #category : #accessing }
D9 >> lastMarble [
	^ lastMarble
]

{ #category : #accessing }
D9 >> lastMarble: anObject [
	lastMarble := anObject
]

{ #category : #accessing }
D9 >> marble [
	^ marble
]

{ #category : #accessing }
D9 >> marble: anObject [
	marble := anObject
]

{ #category : #accessing }
D9 >> nbPlayers [
	^ nbPlayers
]

{ #category : #accessing }
D9 >> nbPlayers: anObject [
	nbPlayers := anObject
]

{ #category : #actions }
D9 >> nextMove [
	| newMarble player old |
	player := count \\ nbPlayers + 1.
	count := count + 1.
	newMarble := Marble new
		value: count;
		yourself.
	count \\ 23 = 0
		ifFalse: [ marble next add: newMarble.
			marble := newMarble ]
		ifTrue: [ old := marble previousAt: 7.
			self addScore: count + old value to: player.
			marble := old next.
			old remove ]
]

{ #category : #parts }
D9 >> part1 [
	self initFromLines.
	self initPlayers.
	[ self count < lastMarble ] whileTrue: [ self nextMove ].
^players max.
]

{ #category : #parts }
D9 >> part2 [
	self initFromLines.
	self initPlayers.
	self lastMarble: (self lastMarble * 100).
	[ self count < lastMarble ] whileTrue: [ self nextMove ].
	^ players max
]

{ #category : #accessing }
D9 >> players [
	^ players
]

{ #category : #accessing }
D9 >> players: anObject [
	players := anObject
]

{ #category : #accessing }
D9 >> root [
	^ root
]

{ #category : #accessing }
D9 >> root: anObject [
	root := anObject
]
