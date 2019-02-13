"
AdventOfCode2018 Day3 Main class

AOC1803Main part1: 'E:/Gabriel_2/Work/AOC2018/Day3/input.txt'
AOC1803Main part2: 'E:/Gabriel_2/Work/AOC2018/Day3/input.txt'
"
Class {
	#name : #AOC1803Main,
	#superclass : #AOC18Base,
	#category : #'AdventOfCode2018-Day3'
}

{ #category : #parts }
AOC1803Main >> part1 [
	| rectangles fabric |
	rectangles := lines collect: [ :each | AOC1803Rectangle fromLine: each ].
	fabric := AOC1803Fabric new.
	rectangles do: [ :each | fabric claim: each ].
	^ fabric overlap
]

{ #category : #parts }
AOC1803Main >> part2 [
	| rectangles rectangle |
	rectangles := lines collect: [ :each | AOC1803Rectangle fromLine: each ].
	rectangles size
		timesRepeat: [ rectangle := rectangles first.
			rectangles := rectangles allButFirst asOrderedCollection.
			(rectangle anyCollides: rectangles)
				ifFalse: [ ^ rectangle id ].
			rectangles add: rectangle ].
	^ nil
]
