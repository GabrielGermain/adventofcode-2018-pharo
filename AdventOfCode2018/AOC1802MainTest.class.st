"
Test class for AOC1802Main
"
Class {
	#name : #AOC1802MainTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day2'
}

{ #category : #tests }
AOC1802MainTest >> testCountLetters [
	| inst |
	inst := AOC1802Main new.
	self
		assert: (inst countLetters: 'bababc')
		equals:
			(Dictionary
				newFrom:
					{($a -> 2).
					($b -> 3).
					($c -> 1)})
]

{ #category : #tests }
AOC1802MainTest >> testFindMatchingLineFor [
	
	
]

{ #category : #tests }
AOC1802MainTest >> testNbOf2 [
	| inst dict |
	inst := AOC1802Main new.
	dict := Dictionary
		newFrom:
			{($a -> 2).
			($b -> 3).
			($c -> 1)}.
	self assert: (inst nbOf: 2 in: dict) equals: 1.
	dict := Dictionary new.
	self assert: (inst nbOf: 2 in: dict) equals: 0.
	dict := Dictionary
		newFrom:
			{($a -> 2).
			($b -> 2).
			($c -> 2)}.
	self assert: (inst nbOf: 2 in: dict) equals: 1
]

{ #category : #tests }
AOC1802MainTest >> testPart1 [
	| inst |
	inst := AOC1802Main new lines: #('abcdef' 'bababc' 'abbcde' 'abcccd' 'aabcdd' 'abcdee' 'ababab'); yourself.
	self assert: inst part1 equals: 12
	
]

{ #category : #tests }
AOC1802MainTest >> testPart2 [
	| inst |
	inst := AOC1802Main new lines: #('abcde' 'fghij' 'klmno' 'pqrst' 'fguij' 'axcye' 'wvxyz'); yourself.
	self assert: inst part2 equals: 'fgij'
	
]
