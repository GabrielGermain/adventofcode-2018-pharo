"
AdventOfCode2018 Day1 Main class

AOC1801Main part1: 'E:/Gabriel_2/Work/AOC2018/Day1/input.txt'
AOC1801Main part2: 'E:/Gabriel_2/Work/AOC2018/Day1/input.txt'
"
Class {
	#name : #AOC1801Main,
	#superclass : #AOC18Base,
	#category : #'AdventOfCode2018-Day1'
}

{ #category : #actions }
AOC1801Main >> changes [
	^ self lines collect: [ :change | change asInteger ]
]

{ #category : #parts }
AOC1801Main >> part1 [
	^ self changes reduce: [ :a :b | a + b ]
]

{ #category : #parts }
AOC1801Main >> part2 [
	| changes frequencies frequency result |
	changes := self changes.
	frequencies := SortedCollection sortBlock: [ :a :b | a < b ].
	"frequencies := Set new."
	frequencies add: 0.
	frequency := 0.
	result := nil.
	[ result isNil ]
		whileTrue: [ changes
				do: [ :change | 
					frequency := frequency + change.
					"(frequencies includes: frequency)
						ifTrue: [ result := frequency.
							^ result ].
					frequencies add: frequency"
					frequencies
						findBinary: [ :arg | frequency - arg ]
						do: [ :found | result := frequency.
							^ result ]
						ifNone: [ :a :b | frequencies add: frequency ] ] ].
	^ nil
]
