"
Nanobot
"
Class {
	#name : #Nanobot,
	#superclass : #Object,
	#instVars : [
		'pos',
		'r'
	],
	#category : #'AdventOfCode2018-Day23'
}

{ #category : #initialization }
Nanobot class >> pos: pos r: r [
	^ Nanobot new
		pos: pos;
		r: r;
		yourself
]

{ #category : #accessing }
Nanobot >> pos [
	^ pos
]

{ #category : #accessing }
Nanobot >> pos: anObject [
	pos := anObject
]

{ #category : #accessing }
Nanobot >> r [
	^ r
]

{ #category : #accessing }
Nanobot >> r: anObject [
	r := anObject
]
