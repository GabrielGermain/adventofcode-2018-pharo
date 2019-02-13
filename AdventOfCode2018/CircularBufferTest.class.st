"
Test for CircularBuffer
"
Class {
	#name : #CircularBufferTest,
	#superclass : #TestCase,
	#instVars : [
		'inst'
	],
	#category : #'AdventOfCode2018-Base'
}

{ #category : #'setUp-tearDown' }
CircularBufferTest >> setUp [
	inst := CircularBuffer fromArray: (1 to: 4)
]

{ #category : #tests }
CircularBufferTest >> testCreation [
	self assert: inst current equals: 1
]

{ #category : #tests }
CircularBufferTest >> testLeft [
	self assert: inst left equals: 4.
	self assert: inst current equals: 1.
]

{ #category : #tests }
CircularBufferTest >> testRight [
	self assert: inst right equals: 2.
	self assert: inst current equals: 1.
]

{ #category : #tests }
CircularBufferTest >> testRotateLeft [
	self assert: inst rotateLeft equals: 4.
	self assert: inst current equals: 4.
]

{ #category : #tests }
CircularBufferTest >> testRotateRight [
	self assert: inst rotateRight equals: 2.
	self assert: inst current equals: 2.
]

{ #category : #tests }
CircularBufferTest >> testSetAt [
	inst setAt: 3.
	self assert: inst current equals: 3
]
