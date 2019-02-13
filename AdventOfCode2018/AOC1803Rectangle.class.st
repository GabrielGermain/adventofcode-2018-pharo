"
I'm a piece of fabric.
"
Class {
	#name : #AOC1803Rectangle,
	#superclass : #Object,
	#instVars : [
		'id',
		'edge',
		'width',
		'height',
		'points'
	],
	#classVars : [
		'Matcher'
	],
	#category : #'AdventOfCode2018-Day3'
}

{ #category : #'instance creation' }
AOC1803Rectangle class >> fromLine: aString [
	Matcher matches: aString.
	^ AOC1803Rectangle new
		id: (Matcher subexpression: 2) asInteger;
		edge: (Matcher subexpression: 3) asInteger @ (Matcher subexpression: 4) asInteger;
		width: (Matcher subexpression: 5) asInteger;
		height: (Matcher subexpression: 6) asInteger;
		createPoints;
		yourself
]

{ #category : #'initialize - release' }
AOC1803Rectangle class >> initialize [
	Matcher := RxMatcher forString: '#(\d+) @ (\d+),(\d+)\: (\d+)x(\d+)'
]

{ #category : #actions }
AOC1803Rectangle >> anyCollides: aCollection [
	^ aCollection detect: [ :each | self collides: each ] ifFound: [ :elt | true ] ifNone: [ false ]
]

{ #category : #actions }
AOC1803Rectangle >> collides: anOtherRectangle [
	^ (self points intersection: anOtherRectangle points) isNotEmpty
]

{ #category : #actions }
AOC1803Rectangle >> collidesWithAny: aCollection [
	^ aCollection detect: [ :each | self collides: each ] ifFound: [ :elt | true ] ifNone: [ false ]
]

{ #category : #actions }
AOC1803Rectangle >> createPoints [
	points := Set new.
	self minX to: self maxX do: [ :i | self minY to: self maxY do: [ :j | points add: i @ j ] ].
]

{ #category : #accessing }
AOC1803Rectangle >> edge [
	^ edge
]

{ #category : #accessing }
AOC1803Rectangle >> edge: anObject [
	edge := anObject
]

{ #category : #accessing }
AOC1803Rectangle >> height [
	^ height
]

{ #category : #accessing }
AOC1803Rectangle >> height: anObject [
	height := anObject
]

{ #category : #accessing }
AOC1803Rectangle >> id [
	^ id
]

{ #category : #accessing }
AOC1803Rectangle >> id: anObject [
	id := anObject
]

{ #category : #accessing }
AOC1803Rectangle >> maxX [
	^ self edge x + width
]

{ #category : #accessing }
AOC1803Rectangle >> maxY [
	^ self edge y + height
]

{ #category : #accessing }
AOC1803Rectangle >> minX [
	^ self edge x + 1
]

{ #category : #accessing }
AOC1803Rectangle >> minY [
	^ self edge y + 1
]

{ #category : #actions }
AOC1803Rectangle >> points [
	^ points
]

{ #category : #accessing }
AOC1803Rectangle >> width [
	^ width
]

{ #category : #accessing }
AOC1803Rectangle >> width: anObject [
	width := anObject
]
