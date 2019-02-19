"
Day 5

AOC1805Main part1: 'E:/Gabriel_2/Work/AOC2018/Day5/input.txt'
AOC1805Main part2: 'E:/Gabriel_2/Work/AOC2018/Day5/input.txt'
"
Class {
	#name : #AOC1805Main,
	#superclass : #AOC18Base,
	#category : #'AdventOfCode2018-Day5'
}

{ #category : #parts }
AOC1805Main >> part1 [
	^ self reduce: (lines at: 1)
]

{ #category : #parts }
AOC1805Main >> part2 [
	| line chars count |
	line := lines at: 1.
	chars := (line collect: [ :each | each asLowercase ]) asSet.
	count := self reduce: line.
	chars
		do: [ :each | 
			line := lines at: 1.
			line := line reject: [ :c | c sameAs: each ].
			count := count min: (self reduce: line) ].
	^ count
]

{ #category : #parts }
AOC1805Main >> reduce: aLine [
	| i c1 c2 line |
	line := aLine asOrderedCollection.
	i := 1.
	[ i < line size ]
		whileTrue: [ c1 := line at: i.
			c2 := line at: i + 1.
			((c1 sameAs: c2) and: [ c1 oppositeTo: c2 ])
				ifTrue: [ line removeAt: i.
					line removeAt: i.
					i > 1
						ifTrue: [ i := i - 1 ] ]
				ifFalse: [ i := i + 1 ] ].
	^ line size
]
