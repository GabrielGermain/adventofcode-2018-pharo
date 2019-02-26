"
Day 13

D13 part1: 'E:/Gabriel_2/Work/AOC2018/Day13/input2.txt'
D13 part2: 'E:/Gabriel_2/Work/AOC2018/Day13/input2.txt'
"
Class {
	#name : #D13,
	#superclass : #AOC18Base,
	#instVars : [
		'carts',
		'collision',
		'id'
	],
	#classVars : [
		'replacements',
		'symbols'
	],
	#category : #'AdventOfCode2018-Day13'
}

{ #category : #initialization }
D13 class >> initialize [
	symbols := {$^ . $> . $v . $<}.
	replacements := Dictionary newFrom: {($^ -> $|).
	($v -> $|).
	($> -> $-).
	($< -> $-)}
]

{ #category : #accessing }
D13 >> carts [
	^ carts
]

{ #category : #accessing }
D13 >> carts: anObject [
	carts := anObject
]

{ #category : #initialization }
D13 >> initialize [ 
	carts := OrderedCollection new.
	id := 0
]

{ #category : #parts }
D13 >> initializeCarts [
	lines
		withIndexDo: [ :line :j | 
			line
				withIndexDo: [ :char :i | 
					(symbols includes: char)
						ifTrue: [ carts add: (Cart withPosition: i @ j andDirection: char andId: (self nextId)).
							line at: i put: (replacements at: char) ] ] ]
]

{ #category : #parts }
D13 >> nextId [
	id := id + 1.
	^id
]

{ #category : #parts }
D13 >> nextStep [
	| nextPosition collidingIndex |
	carts sort.
	carts
		do: [ :cart | 
			nextPosition := cart nextMove.
			cart move: (self valueAt: nextPosition).
			collidingIndex := carts findFirst: [ :each | (cart position = each position) and: [ cart id ~= each id ] ].
			collidingIndex = 0
				ifFalse: [ ^ collision := nextPosition ] ]
]

{ #category : #parts }
D13 >> nextStepWithRemoval [
	| nextPosition cartIndex cart collidingIndex |
	carts sort.
	carts do: [ :each | each moved: false ].
	[ carts anySatisfy: [ :each | each moved not ] ]
		whileTrue: [ cartIndex := carts findFirst: [ :each | each moved not ].
			cart := carts at: cartIndex.
			nextPosition := cart nextMove.
			cart move: (self valueAt: nextPosition).
			cart moved: true.
			collidingIndex := carts findFirst: [ :each | cart position = each position and: [ cart id ~= each id ] ].
			collidingIndex = 0
				ifFalse: [ carts removeAt: collidingIndex.
					carts remove: cart ] ]
]

{ #category : #parts }
D13 >> part1 [
	self initializeCarts.
	[collision isNil] whileTrue: [ self nextStep ].
	^ (collision x - 1) @ (collision y - 1)
]

{ #category : #parts }
D13 >> part2 [
	| lastPosition |
	self initializeCarts.
	[ carts size > 1 ] whileTrue: [ self nextStepWithRemoval ].
	lastPosition := (carts at: 1) position.
	^ (lastPosition x - 1) @ (lastPosition y - 1)
]

{ #category : #parts }
D13 >> valueAt: aPoint [
	^ (lines at: aPoint y) at: aPoint x
]
