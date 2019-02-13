"
Day 25
"
Class {
	#name : #D25,
	#superclass : #AOC18Base,
	#instVars : [
		'stars'
	],
	#category : #'AdventOfCode2018-Day25'
}

{ #category : #parts }
D25 >> part1 [
	| constellationNumber currentStars current newStars |
	stars := (lines collect: [ :each | Point4D fromLine: each ]) asOrderedCollection.
	constellationNumber := 0.
	[ stars isNotEmpty ]
		whileTrue: [ constellationNumber := constellationNumber + 1.
			currentStars := OrderedCollection new.
			currentStars add: stars removeFirst.
			[ currentStars isNotEmpty ]
				whileTrue: [ current := currentStars removeFirst.
					newStars := stars
						select: [ :each | (current manhattanDist: each) <= 3 ].
					currentStars addAll: newStars.
					stars removeAll: newStars ] ].
	^ constellationNumber
]

{ #category : #parts }
D25 >> part2 [

]

{ #category : #accessing }
D25 >> stars [
	^ stars
]

{ #category : #accessing }
D25 >> stars: anObject [
	stars := anObject
]
