"
I'm a ShiftList
"
Class {
	#name : #ShiftList,
	#superclass : #Object,
	#instVars : [
		'shift',
		'list'
	],
	#category : #'AdventOfCode2018-Base'
}

{ #category : #initialization }
ShiftList class >> withList: aCollection andShift: anInteger [
	^ ShiftList new list: aCollection; shift: anInteger; yourself
	
]

{ #category : #API }
ShiftList >> at: anIndex [
	^ list at: anIndex + shift.
]

{ #category : #accessing }
ShiftList >> list [
	^ list
]

{ #category : #accessing }
ShiftList >> list: anObject [
	list := anObject
]

{ #category : #accessing }
ShiftList >> shift [
	^ shift
]

{ #category : #accessing }
ShiftList >> shift: anObject [
	shift := anObject
]

{ #category : #API }
ShiftList >> size [
	^ list size
]
