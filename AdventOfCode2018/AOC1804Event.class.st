"
I'm an event
"
Class {
	#name : #AOC1804Event,
	#superclass : #Object,
	#instVars : [
		'date',
		'minutes',
		'actionString'
	],
	#classVars : [
		'Matcher'
	],
	#category : #'AdventOfCode2018-Day4'
}

{ #category : #initialization }
AOC1804Event class >> fromLine: aLine [
	Matcher matches: aLine.
	^ self new
		date: (Matcher subexpression: 2);
		minutes: (Matcher subexpression: 3) asInteger;
		actionString: (Matcher subexpression:4 );
		yourself
]

{ #category : #'initialize-release' }
AOC1804Event class >> initialize [
	Matcher := RxMatcher forString: '\[(\d+\-\d+\-\d+) \d+\:(\d+)\] (.*)'
]

{ #category : #accessing }
AOC1804Event >> actionString [
	^ actionString
]

{ #category : #accessing }
AOC1804Event >> actionString: anObject [
	actionString := anObject
]

{ #category : #accessing }
AOC1804Event >> date [
	^ date
]

{ #category : #accessing }
AOC1804Event >> date: anObject [
	date := anObject
]

{ #category : #accessing }
AOC1804Event >> minutes [
	^ minutes
]

{ #category : #accessing }
AOC1804Event >> minutes: anObject [
	minutes := anObject
]
