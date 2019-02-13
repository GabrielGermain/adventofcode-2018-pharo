"
AdventOfCode2018 Day2 Main class

AOC1802Main part1: 'E:/Gabriel_2/Work/AOC2018/Day2/input.txt'
AOC1802Main part2: 'E:/Gabriel_2/Work/AOC2018/Day2/input.txt'
"
Class {
	#name : #AOC1802Main,
	#superclass : #AOC18Base,
	#category : #'AdventOfCode2018-Day2'
}

{ #category : #private }
AOC1802Main >> computeDiffBetween: aLine and: anOtherLine [
	| diff |
	diff := 0.
	1 to: aLine size do: [ :i | 
		(aLine at: i) ~= (anOtherLine at: i)
			ifTrue: [ diff := diff + 1 ] ].
	^ diff
]

{ #category : #private }
AOC1802Main >> computeDiffIndexBetween: aLine and: anOtherLine [
	1 to: aLine size do: [ :i | 
		(aLine at: i) ~= (anOtherLine at: i)
			ifTrue: [ ^ i ] ].
	^ 0
]

{ #category : #private }
AOC1802Main >> countLetters: aLine [
	| dict |
	dict := Dictionary new.
	aLine asArray do: [ :each | dict at: each ifPresent: [ :count | dict at: each put: count + 1 ]  ifAbsentPut: [ 1 ]  ].
	^ dict
]

{ #category : #private }
AOC1802Main >> findMatchingLineFor: aLine [
	| index |
	index := lines findFirst: [ :otherLine | (self computeDiffBetween: aLine and: otherLine ) = 1 ].
	index = 0
		ifTrue: [ ^ nil ]
		ifFalse: [ ^ lines at: index ]
]

{ #category : #private }
AOC1802Main >> nbOf: aValue in: aDict [
	^ aDict values detect: [ :each | each = aValue ] ifFound: [ ^ 1 ] ifNone: [ ^ 0 ]
]

{ #category : #parts }
AOC1802Main >> part1 [
	| nb2 nb3 dict |
	nb2 := 0.
	nb3 := 0.
	lines
		do: [ :each | 
			dict := self countLetters: each.
			nb2 := nb2 + (self nbOf: 2 in: dict).
			nb3 := nb3 + (self nbOf: 3 in: dict) ].
	^ nb2 * nb3
]

{ #category : #parts }
AOC1802Main >> part2 [
	| line matchingLine index |
	lines := lines collect: [ :each | each asArray ].
	[ lines size > 1 ]
		whileTrue: [ line := lines first asOrderedCollection.
			lines := lines allButFirst.
			matchingLine := self findMatchingLineFor: line.
			matchingLine isNotNil
				ifTrue: [ index := self computeDiffIndexBetween: line and: matchingLine.
					line removeAt: index.
					^ line as: String ] ].
	^ nil
]
