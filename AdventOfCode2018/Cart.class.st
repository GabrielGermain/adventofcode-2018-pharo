"
A cart
"
Class {
	#name : #Cart,
	#superclass : #Object,
	#instVars : [
		'direction',
		'position',
		'id',
		'interMoves',
		'moved'
	],
	#classVars : [
		'directions',
		'moves'
	],
	#category : #'AdventOfCode2018-Day13'
}

{ #category : #initialization }
Cart class >> initialize [
	directions := Dictionary
		newFrom:
			{($^
				->
					(Dictionary
						newFrom:
							{($| -> 0).
							($/ -> 1).
							($\ -> -1)})).
			($>
				->
					(Dictionary
						newFrom:
							{($/ -> -1).
							($- -> 0).
							($\ -> 1)})).
			($v
				->
					(Dictionary
						newFrom:
							{($| -> 0).
							($\ -> -1).
							($/ -> 1)})).
			($<
				->
					(Dictionary
						newFrom:
							{($/ -> -1).
							($- -> 0).
							($\ -> 1)}))}.
	moves := Dictionary
		newFrom:
			{($^ -> (0 @ -1)).
			($> -> (1 @ 0)).
			($v -> (0 @ 1)).
			($< -> (-1 @ 0))}
]

{ #category : #initialization }
Cart class >> withPosition: aPoint andDirection: aChar andId: anInteger [
	^ self new setDirection: aChar; position: aPoint; id: anInteger; yourself
]

{ #category : #comparing }
Cart >> <= aCart [
	^ position y < aCart position y
		or: [ position y = aCart position y
				and: [ position x <= aCart position x ] ]
]

{ #category : #accessing }
Cart >> currentDirection [
	^ direction current
]

{ #category : #accessing }
Cart >> direction [
	^ direction
]

{ #category : #accessing }
Cart >> direction: anObject [
	direction := anObject
]

{ #category : #accessing }
Cart >> directions [
	^ directions
]

{ #category : #accessing }
Cart >> id [
	^ id
]

{ #category : #accessing }
Cart >> id: anObject [
	id := anObject
]

{ #category : #initialization }
Cart >> initialize [
	direction := CircularBuffer fromArray: {$^ . $> . $v . $<}.
	interMoves := CircularBuffer fromArray: {-1 . 0 . 1}
]

{ #category : #accessing }
Cart >> interMoves [
	^ interMoves
]

{ #category : #accessing }
Cart >> interMoves: anObject [
	interMoves := anObject
]

{ #category : #API }
Cart >> move: nextChar [
	self position: self nextMove.
	nextChar = $+
		ifFalse: [ direction rotate: ((directions at: direction current) at: nextChar) ]
		ifTrue: [ direction rotate: (interMoves current). interMoves rotateRight ]
]

{ #category : #accessing }
Cart >> moved [
	^ moved
]

{ #category : #accessing }
Cart >> moved: anObject [
	moved := anObject
]

{ #category : #API }
Cart >> nextMove [
	^ position + (moves at: direction current)
]

{ #category : #accessing }
Cart >> position [
	^ position
]

{ #category : #accessing }
Cart >> position: anObject [
	position := anObject
]

{ #category : #printing }
Cart >> printOn: aStream [
	aStream
		nextPutAll: 'Cart[';
		nextPut: self currentDirection;
		nextPut: Character space.
		position x printOn: aStream.
		aStream nextPut: $@.
		position y printOn: aStream.
		aStream nextPutAll: ']'
]

{ #category : #initialization }
Cart >> setDirection: aChar [
	direction setAt: aChar
]
