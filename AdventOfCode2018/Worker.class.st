"
I'm a worker
"
Class {
	#name : #Worker,
	#superclass : #Object,
	#instVars : [
		'currentWork',
		'timeToDeliver'
	],
	#category : #'AdventOfCode2018-Day7'
}

{ #category : #acccessing }
Worker >> finishedWork [
	| tempWork |
	(currentWork isNotNil and: [timeToDeliver = 0]) ifTrue: [ tempWork := currentWork. currentWork := nil. ^ tempWork ] ifFalse: [ ^nil ]
]

{ #category : #initialization }
Worker >> initialize [
	currentWork := nil.
	timeToDeliver := 0.
]

{ #category : #acccessing }
Worker >> isAvailable [
	^ currentWork isNil
]

{ #category : #actions }
Worker >> nextSecond [
	(timeToDeliver > 0) ifTrue: [ timeToDeliver := timeToDeliver -1 ]
]

{ #category : #actions }
Worker >> startWorkOn: aChar for: aTime [
	currentWork := aChar.
	timeToDeliver := aTime.
	
]
