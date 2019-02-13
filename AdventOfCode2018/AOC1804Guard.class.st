"
I'm a guard
"
Class {
	#name : #AOC1804Guard,
	#superclass : #Object,
	#instVars : [
		'id',
		'schedule'
	],
	#classVars : [
		'ActionMap',
		'GuardMatcher'
	],
	#category : #'AdventOfCode2018-Day4'
}

{ #category : #initialization }
AOC1804Guard class >> buildScheduleFrom: someEvents [
	| events event guard |
	guard := self new.
	events := someEvents asOrderedCollection.
	event := events first.
	GuardMatcher matches: event actionString.
	guard id: (GuardMatcher subexpression: 2) asInteger.
	event
		actionString: 'wakes up';
		minutes: 0.
	events
		add:
			(AOC1804Event new
				minutes: 59;
				yourself).
	events overlappingPairsDo: [ :val1 :val2 | guard from: val1 minutes to: val2 minutes put: (ActionMap at: val1 actionString) ].
	^ guard
]

{ #category : #'initialization-release' }
AOC1804Guard class >> initialize [
	GuardMatcher := RxMatcher forString: 'Guard #(\d+) begins shift'.
	ActionMap := Dictionary newFromPairs: {'falls asleep' . 1 . 'wakes up' . 0}
]

{ #category : #accessing }
AOC1804Guard >> from: min1 to: min2 put: aValue [
	self schedule from: min1 + 1 to: min2 + 1 put: aValue
]

{ #category : #accessing }
AOC1804Guard >> id [
	^ id
]

{ #category : #accessing }
AOC1804Guard >> id: anObject [
	id := anObject
]

{ #category : #initialization }
AOC1804Guard >> initialize [
	self schedule: (Array new: 60)
]

{ #category : #accessing }
AOC1804Guard >> schedule [
	^ schedule
]

{ #category : #accessing }
AOC1804Guard >> schedule: anObject [
	schedule := anObject
]

{ #category : #accessing }
AOC1804Guard >> sleepTime [
	^ self schedule occurrencesOf: 1
]
