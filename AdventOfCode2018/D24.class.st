"
Day 24

D24 part1: 'E:/Gabriel_2/Work/AOC2018/Day24/input3.txt' 
D24 part2: 'E:/Gabriel_2/Work/AOC2018/Day24/input3.txt'
"
Class {
	#name : #D24,
	#superclass : #AOC18Base,
	#instVars : [
		'immune',
		'infection',
		'current',
		'counter',
		'attackers',
		'defenders',
		'totalImmune',
		'totalInfection',
		'stalled'
	],
	#category : #'AdventOfCode2018-Day24'
}

{ #category : #initialization }
D24 class >> initialize [
	Matcher := RxMatcher forString: '(\d+) units each with (\d+) hit points \((.*)\) with an attack that does (\d+) (.+) damage at initiative (\d+)'
]

{ #category : #parts }
D24 >> attack [
	| all |
	all := OrderedCollection new addAll: immune; addAll: infection; yourself.
	all sort: #initiative descending.
	all do: [ :g | g attack ]
]

{ #category : #parts }
D24 >> boostImmune: boost [
	immune do: [ :each | each damage: (each damage + boost) ]
]

{ #category : #parts }
D24 >> handleLine: line [
	| group |
	(line startsWith: 'Immune')
		ifTrue: [ immune := OrderedCollection new.
			current := immune.
			counter := 1.
			^ self ].
	(line startsWith: 'Infection')
		ifTrue: [ infection := OrderedCollection new.
			current := infection.
			counter := 1.
			^ self ].
	line isEmpty
		ifTrue: [ ^ self ].
	group := Group fromLine: line.
	group id: counter.
	counter := counter + 1.
	current add: group
]

{ #category : #parts }
D24 >> handleLine: line withIndex: index [
	| group |
	(line startsWith: 'Immune')
		ifTrue: [ immune := OrderedCollection new.
			current := immune.
			counter := 1.
			^ self ].
	(line startsWith: 'Infection')
		ifTrue: [ infection := OrderedCollection new.
			current := infection.
			counter := 1.
			^ self ].
	line isEmpty
		ifTrue: [ ^ self ].
	group := Group fromLine: line.
	group id: counter.
	group line: index.
	counter := counter + 1.
	current add: group
]

{ #category : #parts }
D24 >> handleSelection [
	| attacker |
	attackers sort: [ :a :b | a compareToAttack: b ].
	[ attackers isNotEmpty ]
		whileTrue: [ attacker := attackers removeFirst.
			self selectTargetFor: attacker ]
]

{ #category : #accessing }
D24 >> immune [
	^ immune
]

{ #category : #accessing }
D24 >> immune: anObject [
	immune := anObject
]

{ #category : #parts }
D24 >> immuneAlive [
	immune isEmpty
		ifTrue: [ ^ 0 ].
	^ immune sum: [ :g | g units ]
]

{ #category : #accessing }
D24 >> infection [
	^ infection
]

{ #category : #accessing }
D24 >> infection: anObject [
	infection := anObject
]

{ #category : #parts }
D24 >> infectionAlive [
	infection isEmpty
		ifTrue: [ ^ 0 ].
	^ infection sum: [ :g | g units ]
]

{ #category : #parts }
D24 >> initGroups [
	| index |
	index := -1.
	lines
		do: [ :line | 
			self handleLine: line withIndex: index.
			index := index + 1 ]
]

{ #category : #parts }
D24 >> initStats [
	totalImmune := 0.
	totalInfection := 0.
	stalled := false
]

{ #category : #parts }
D24 >> isNotStalled [
	| tmpTotalImmune tmpTotalInfection |
	tmpTotalImmune := self immuneAlive.
	tmpTotalInfection := self infectionAlive.
	stalled := tmpTotalImmune = totalImmune and: [ tmpTotalInfection = totalInfection ].
	totalImmune := tmpTotalImmune.
	totalInfection := tmpTotalInfection.
	^ stalled not.
	
]

{ #category : #parts }
D24 >> part1 [
	| round |
	self initGroups.
	round := 1.
	[ immune isNotEmpty and: [ infection isNotEmpty ] ]
		whileTrue: [ 
			Transcript show: 'Round: ', round asString; cr.
			self selection.
			self attack.
			self removeEmptyGroups.
			round := round + 1 ].
	^ self unitsAlive
]

{ #category : #parts }
D24 >> part1: boost [
	self initGroups.
	self boostImmune: boost.
	self initStats.
	[ immune isNotEmpty and: [ infection isNotEmpty and: [ self isNotStalled ] ] ]
		whileTrue: [ self selection.
			self attack.
			self removeEmptyGroups ].
	stalled
		ifTrue: [ ^ -1 ].
	^ self immuneAlive
]

{ #category : #parts }
D24 >> part2 [
	| immuneAlive |
	1 to: 100 do: [ :boost | 
		immuneAlive := self part1: boost.
		immuneAlive > 0
			ifTrue: [ ^ immuneAlive ] ].
	^ immuneAlive
]

{ #category : #parts }
D24 >> removeEmptyGroups [
	immune := immune reject: [ :g | g units = 0 ].
	infection := infection reject: [ :g | g units = 0 ]
]

{ #category : #parts }
D24 >> selectTargetFor: attacker [
	attacker target: nil.
	(attacker units = 0 or: [ defenders isEmpty ])
		ifTrue: [ ^ self ].
	defenders do: [ :d | d forecastDamage: attacker ].
	defenders sort: [ :a :b | a compareToDefend: b ].
	defenders first forecast ~= 0
		ifTrue: [ attacker target: defenders removeFirst ]
]

{ #category : #parts }
D24 >> selection [
	self selectionImmune.
	self selectionInfection.
]

{ #category : #parts }
D24 >> selectionImmune [
	attackers := OrderedCollection newFrom: immune.
	defenders := OrderedCollection newFrom: infection.
	self handleSelection.
]

{ #category : #parts }
D24 >> selectionInfection [
	attackers := OrderedCollection newFrom: infection.
	defenders := OrderedCollection newFrom: immune.
	self handleSelection.
]

{ #category : #parts }
D24 >> unitsAlive [
	current := immune.
	infection isNotEmpty
		ifTrue: [ current := infection ].
	^ current sum: [ :g | g units ]
]
