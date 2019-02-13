"
I'm a marble
"
Class {
	#name : #Marble,
	#superclass : #Object,
	#instVars : [
		'value',
		'next',
		'previous'
	],
	#category : #'AdventOfCode2018-Day9'
}

{ #category : #actions }
Marble >> add: newMarble [
	| old |
	old := next.
	next := newMarble.
	newMarble previous: self.
	old previous: newMarble.
	newMarble next: old.
]

{ #category : #conversions }
Marble >> asOrderedCollection [
	| coll currentMarble |
	coll := OrderedCollection new.
	coll add: self.
	currentMarble := self.
	[ currentMarble next ~= self ]
		whileTrue: [ currentMarble := currentMarble next.
			coll add: currentMarble ].
	 ^coll
]

{ #category : #accessing }
Marble >> next [
	^ next
]

{ #category : #accessing }
Marble >> next: anObject [
	next := anObject
]

{ #category : #accessing }
Marble >> nextAt: anIndex [
	| currentMarble |
	currentMarble := self.
	(1 to: anIndex) do: [ currentMarble := currentMarble next ].
	^ currentMarble
]

{ #category : #accessing }
Marble >> previous [
	^ previous
]

{ #category : #accessing }
Marble >> previous: anObject [
	previous := anObject
]

{ #category : #accessing }
Marble >> previousAt: anIndex [
	| currentMarble |
	currentMarble := self.
	(1 to: anIndex) do: [ :i | currentMarble := currentMarble previous ].
	^ currentMarble
]

{ #category : #actions }
Marble >> remove [
	next previous: previous.
	previous next: next.
]

{ #category : #accessing }
Marble >> value [
	^ value
]

{ #category : #accessing }
Marble >> value: anObject [
	value := anObject
]
