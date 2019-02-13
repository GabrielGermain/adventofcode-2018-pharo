"
Day14
"
Class {
	#name : #D14,
	#superclass : #AOC18Base,
	#instVars : [
		'board',
		'rec1',
		'rec2'
	],
	#category : #'AdventOfCode2018-Day14'
}

{ #category : #accessing }
D14 >> board [
	^ board
]

{ #category : #accessing }
D14 >> board: anObject [
	board := anObject
]

{ #category : #parts }
D14 >> computeFor: anInteger [
	[ board size < (anInteger+10) ] whileTrue: [ self oneStep ]
]

{ #category : #parts }
D14 >> findSequence: aString [
	| boardAsString |
	boardAsString := (board collect: [ :digit | digit asCharacterDigit ]) as:String.
	^  (boardAsString findString: aString) - 1
	
]

{ #category : #initialization }
D14 >> initialize [
	board := OrderedCollection newFrom: { 3. 7 }.
	rec1 := 1.
	rec2 := 2.
]

{ #category : #parts }
D14 >> moveForward [
	rec1 := self normalizeIndex: (rec1 + (board at: rec1) + 1).
	rec2 := self normalizeIndex: (rec2 + (board at: rec2) + 1)
]

{ #category : #parts }
D14 >> normalizeIndex: anInteger [
	^ ((anInteger - 1) \\ board size) + 1
]

{ #category : #parts }
D14 >> oneStep [
	self sumRecipes.
	self moveForward.
]

{ #category : #parts }
D14 >> part1 [
	self computeFor: 306281.
	self scoreFor: 306281
]

{ #category : #parts }
D14 >> part2 [
	self computeFor: 100000000.
	^ self findSequence: '306281'
]

{ #category : #accessing }
D14 >> rec1 [
	^ rec1
]

{ #category : #accessing }
D14 >> rec1: anObject [
	rec1 := anObject
]

{ #category : #accessing }
D14 >> rec2 [
	^ rec2
]

{ #category : #accessing }
D14 >> rec2: anObject [
	rec2 := anObject
]

{ #category : #parts }
D14 >> scoreFor: anInteger [
	^ board copyFrom: anInteger+1 to: anInteger+10
	
]

{ #category : #parts }
D14 >> sumRecipes [
	| sum nbDigits |
	sum := (board at: rec1) + (board at: rec2).
	nbDigits := sum decimalDigitLength.
	(1 to: nbDigits) reverseDo: [ :i | board add: (sum decimalDigitAt: i) ]
]
