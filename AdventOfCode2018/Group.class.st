"
A group
"
Class {
	#name : #Group,
	#superclass : #Object,
	#instVars : [
		'id',
		'units',
		'hp',
		'weaknesses',
		'immunities',
		'damage',
		'type',
		'initiative',
		'forecast',
		'target',
		'line'
	],
	#classVars : [
		'LineMatcher',
		'LineMatcherWeakAndImm',
		'WeakImmMatcher'
	],
	#category : #'AdventOfCode2018-Day24'
}

{ #category : #initialization }
Group class >> fromLine [
	| group |
	group := self new.
	group units: (LineMatcher subexpression: 2) asInteger.
	group hp: (LineMatcher subexpression: 3) asInteger.
	group damage: (LineMatcher subexpression: 4) asInteger.
	group type: (LineMatcher subexpression: 5).
	group initiative: (LineMatcher subexpression: 6) asInteger.
	^ group
]

{ #category : #initialization }
Group class >> fromLine: aLine [
	(LineMatcherWeakAndImm matches: aLine) ifTrue: [ ^ self fromLineWeakAndImm ].
	(LineMatcher matches: aLine) ifTrue: [ ^ self fromLine ].
	Error signal: 'Unsupported line: ', aLine
	
	
]

{ #category : #initialization }
Group class >> fromLineWeakAndImm [
	| group type map items |
	group := self new.
	group units: (LineMatcherWeakAndImm subexpression: 2) asInteger.
	group hp: (LineMatcherWeakAndImm subexpression: 3) asInteger.
	group damage: (LineMatcherWeakAndImm subexpression: 5) asInteger.
	group type: (LineMatcherWeakAndImm subexpression: 6).
	group initiative: (LineMatcherWeakAndImm subexpression: 7) asInteger.
	map := Dictionary
		newFromPairs:
			{'weak'.
			group weaknesses.
			'immune'.
			group immunities}.
	(LineMatcherWeakAndImm subexpression: 4)
		splitOn: $;
		do: [ :each | 
			WeakImmMatcher matches: each trim.
			type := WeakImmMatcher subexpression: 2.
			items := (WeakImmMatcher subexpression: 3) splitOn: $,.
			(map at: type) addAll: (items collect: [ :item | item trim ]) ].
	^ group
]

{ #category : #initialization }
Group class >> initialize [
	LineMatcherWeakAndImm := RxMatcher forString: '(\d+) units each with (\d+) hit points \((.*)\) with an attack that does (\d+) (.+) damage at initiative (\d+)'.
	LineMatcher := RxMatcher forString: '(\d+) units each with (\d+) hit points with an attack that does (\d+) (.+) damage at initiative (\d+)'.
	WeakImmMatcher := RxMatcher forString: '(\w+) to (.+)'
]

{ #category : #actions }
Group >> attack [
	(self units = 0 or: [ target isNil ])
		ifTrue: [ ^ self ].
	Transcript show: self line asString, ' attacks ', target line asString; cr.
	target removeUnits: (self effectivePowerAgainst: target) // target hp
]

{ #category : #comparing }
Group >> compareToAttack: other [
	^ self effectivePower > other effectivePower or: [ self effectivePower = other effectivePower and: [ self initiative > other initiative ] ]
]

{ #category : #comparing }
Group >> compareToDefend: other [
	^ self forecast > other forecast
		or: [ self forecast = other forecast
				and: [ self effectivePower > other effectivePower or: [ self effectivePower = other effectivePower and: [ self initiative > other initiative ] ] ] ]
]

{ #category : #accessing }
Group >> damage [
	^ damage
]

{ #category : #accessing }
Group >> damage: anObject [
	damage := anObject
]

{ #category : #accessing }
Group >> effectivePower [
	^ units * damage
]

{ #category : #accessing }
Group >> effectivePowerAgainst: otherGroup [
	(otherGroup weaknesses includes: type) ifTrue: [ ^ self effectivePower * 2 ].
	(otherGroup immunities includes: type) ifTrue: [ ^ 0 ].
	^ self effectivePower.
]

{ #category : #accessing }
Group >> forecast [
	^ forecast
]

{ #category : #accessing }
Group >> forecast: anObject [
	forecast := anObject
]

{ #category : #actions }
Group >> forecastDamage: attacker [
	forecast := attacker effectivePowerAgainst: self
]

{ #category : #accessing }
Group >> hp [
	^ hp
]

{ #category : #accessing }
Group >> hp: anObject [
	hp := anObject
]

{ #category : #accessing }
Group >> id [
	^ id
]

{ #category : #accessing }
Group >> id: anObject [
	id := anObject
]

{ #category : #accessing }
Group >> immunities [
	^ immunities
]

{ #category : #accessing }
Group >> immunities: anObject [
	immunities := anObject
]

{ #category : #initialization }
Group >> initialize [
	weaknesses := OrderedCollection new.
	immunities := OrderedCollection new.
]

{ #category : #accessing }
Group >> initiative [
	^ initiative
]

{ #category : #accessing }
Group >> initiative: anObject [
	initiative := anObject
]

{ #category : #accessing }
Group >> line [
	^ line
]

{ #category : #accessing }
Group >> line: anObject [
	line := anObject
]

{ #category : #actions }
Group >> removeUnits: nbUnits [
	Transcript show: line asString, ' loses ', nbUnits asString, ' units'; cr.
	units := units - (nbUnits min: units)
]

{ #category : #accessing }
Group >> target [
	^ target
]

{ #category : #accessing }
Group >> target: anObject [
	target := anObject
]

{ #category : #accessing }
Group >> type [
	^ type
]

{ #category : #accessing }
Group >> type: anObject [
	type := anObject
]

{ #category : #accessing }
Group >> units [
	^ units
]

{ #category : #accessing }
Group >> units: anObject [
	units := anObject
]

{ #category : #accessing }
Group >> weaknesses [
	^ weaknesses
]

{ #category : #accessing }
Group >> weaknesses: anObject [
	weaknesses := anObject
]
