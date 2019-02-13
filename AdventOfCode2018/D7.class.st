"
Day 7
"
Class {
	#name : #D7,
	#superclass : #AOC18Base,
	#instVars : [
		'grid',
		'letters',
		'workers',
		'stepTime',
		'nbWorkers',
		'chrono',
		'nbLetters',
		'nbFinishedLetters'
	],
	#classVars : [
		'Letters',
		'Matcher'
	],
	#category : #'AdventOfCode2018-Day7'
}

{ #category : #'class initialization' }
D7 class >> initialize [
	Matcher := RxMatcher forString: 'Step (.) must be finished before step (.) can begin\.'.
	Letters := $A to: $Z
]

{ #category : #accessing }
D7 >> chrono [
	^ chrono
]

{ #category : #accessing }
D7 >> chrono: anObject [
	chrono := anObject
]

{ #category : #private }
D7 >> cleanDependencyOn: aChar [
	| index |
	index := Letters indexOf: aChar.
	(1 to: 26) do: [ :j | grid at: index at: j put: 0 ]	
]

{ #category : #'as yet unclassified' }
D7 >> collectWork [
	| work |
	workers
		do: [ :each | 
			each nextSecond.
			work := each finishedWork.
			(work isNotNil) ifTrue: [ nbFinishedLetters := nbFinishedLetters + 1. self cleanDependencyOn: work ] ]
]

{ #category : #private }
D7 >> dispatchWork [
	| availableLetters |
	availableLetters := letters select: [ :letter | self hasNoDependency: letter ].
	availableLetters
		do: [ :letter | 
			workers
				detect: [ :worker | worker isAvailable ]
				ifFound: [ :worker | 
					letters remove: letter.
					worker startWorkOn: letter for: (Letters indexOf: letter) + stepTime ] ifNone: [  ] ]
]

{ #category : #accessing }
D7 >> grid [
	^ grid
]

{ #category : #accessing }
D7 >> grid: anObject [
	grid := anObject
]

{ #category : #private }
D7 >> hasDependency: aChar [
	| index |
	index := Letters indexOf: aChar.
	^ ((1 to: 26) collect: [ :i | grid at: i at: index ]) anySatisfy: [ :elt | elt = 1 ]
]

{ #category : #private }
D7 >> hasNoDependency: aChar [
	| index |
	index := Letters indexOf: aChar.
	^ ((1 to: 26) collect: [ :i | grid at: i at: index ]) noneSatisfy: [ :elt | elt = 1 ]
]

{ #category : #private }
D7 >> initGrid [
	| step dependency |
	grid := Array2D zeros: 26.
	letters := Set new.
	lines
		do: [ :each | 
			Matcher matches: each.
			step := (Matcher subexpression: 3) at: 1.
			dependency := (Matcher subexpression: 2) at: 1.
			letters add: step.
			letters add: dependency.
			grid at: (Letters indexOf: dependency) at: (Letters indexOf: step) put: 1 ].
		nbLetters := letters size.
		nbFinishedLetters := 0.
	letters := letters asOrderedCollection
		sort;
		yourself
]

{ #category : #private }
D7 >> initWorkers [
	self workers: ((1 to: nbWorkers) collect: [ :i | Worker new ])
]

{ #category : #initialization }
D7 >> initialize [
	chrono := -1.
	nbWorkers := 5.
	stepTime := 60
]

{ #category : #accessing }
D7 >> letters [
	^ letters
]

{ #category : #accessing }
D7 >> letters: anObject [
	letters := anObject
]

{ #category : #accessing }
D7 >> nbWorkers [
	^ nbWorkers
]

{ #category : #accessing }
D7 >> nbWorkers: anObject [
	nbWorkers := anObject
]

{ #category : #private }
D7 >> nextSecond [
	chrono := chrono + 1.
	self collectWork.
	self dispatchWork.
]

{ #category : #parts }
D7 >> part1 [
	| index nextLetter stream |
	self initGrid.
	stream := WriteStream on: (String new: letters size).
	[ letters notEmpty ]
		whileTrue: [ index := letters findFirst: [ :letter | self hasNoDependency: letter ].
			nextLetter := letters at: index.
			letters remove: nextLetter.
			self cleanDependencyOn: nextLetter.
			stream nextPut: nextLetter ].
	^ stream contents
]

{ #category : #parts }
D7 >> part2 [
	self initGrid.
	self initWorkers.
	[ nbFinishedLetters < nbLetters ] whileTrue: [ self nextSecond ].
	^ chrono
]

{ #category : #accessing }
D7 >> stepTime1 [
	^ stepTime
]

{ #category : #accessing }
D7 >> stepTime: anObject [
	stepTime := anObject
]

{ #category : #accessing }
D7 >> workers [
	^ workers
]

{ #category : #accessing }
D7 >> workers: anObject [
	workers := anObject
]
