"
I'm a star
"
Class {
	#name : #Star,
	#superclass : #Object,
	#instVars : [
		'position',
		'velocity'
	],
	#classVars : [
		'Matcher'
	],
	#category : #'AdventOfCode2018-Day10'
}

{ #category : #initialization }
Star class >> initialize [
	Matcher := RxMatcher forString: 'position=<\s?(-?\d+), \s?(-?\d+)> velocity=<\s?(-?\d+), \s?(-?\d+)>'
]

{ #category : #actions }
Star >> backward [
	self position: self position - self velocity
]

{ #category : #actions }
Star >> forward [
	self position: (self position + self velocity)
]

{ #category : #initialization }
Star >> fromString: aLine [
	Matcher matches: aLine.
	self position: (Matcher subexpression: 2) asInteger @ (Matcher subexpression: 3) asInteger.
	self velocity: (Matcher subexpression: 4) asInteger @ (Matcher subexpression: 5) asInteger
]

{ #category : #accessing }
Star >> position [
	^ position
]

{ #category : #accessing }
Star >> position: anObject [
	position := anObject
]

{ #category : #accessing }
Star >> velocity [
	^ velocity
]

{ #category : #accessing }
Star >> velocity: anObject [
	velocity := anObject
]

{ #category : #accessing }
Star >> x [
	^ position x
]

{ #category : #accessing }
Star >> y [
	^ position y
]
