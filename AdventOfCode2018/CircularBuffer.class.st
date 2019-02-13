"
I'm a circular buffer
"
Class {
	#name : #CircularBuffer,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'currentIndex'
	],
	#category : #'AdventOfCode2018-Base'
}

{ #category : #initialization }
CircularBuffer class >> fromArray: anArray [
	^ self new buffer: anArray; yourself
]

{ #category : #private }
CircularBuffer >> at: anIndex [
	(anIndex = 0) ifTrue: [ ^ nil ] ifFalse: [ ^ buffer at: anIndex ]
]

{ #category : #accessing }
CircularBuffer >> buffer [
	^ buffer
]

{ #category : #accessing }
CircularBuffer >> buffer: anObject [
	buffer := anObject.
	((buffer isNotNil) and: [ buffer isNotEmpty ]) ifTrue: [ currentIndex := 1 ]
]

{ #category : #API }
CircularBuffer >> current [
	^ self at: currentIndex
]

{ #category : #accessing }
CircularBuffer >> currentIndex [
	^ currentIndex
]

{ #category : #accessing }
CircularBuffer >> currentIndex: anObject [
	currentIndex := anObject
]

{ #category : #API }
CircularBuffer >> left [
 ^self at: self leftIndex
]

{ #category : #private }
CircularBuffer >> leftIndex [
	(currentIndex = 0) ifTrue: [ ^ 0 ] ifFalse: [ (currentIndex=1) ifTrue: [ ^ buffer size ] ifFalse: [ ^ currentIndex - 1 ] ]
]

{ #category : #API }
CircularBuffer >> right [
 ^self at: self rightIndex
]

{ #category : #private }
CircularBuffer >> rightIndex [
	(currentIndex = 0) ifTrue: [ ^ 0 ] ifFalse: [ (currentIndex= buffer size) ifTrue: [ ^ 1 ] ifFalse: [ ^ currentIndex + 1 ] ]
]

{ #category : #API }
CircularBuffer >> rotate: anInteger [
	currentIndex := (((currentIndex + anInteger) - 1 )\\buffer size) + 1.
	^ self at: currentIndex.
	
]

{ #category : #API }
CircularBuffer >> rotateLeft [
	self rotate: -1.
	^ self at: currentIndex.
	
]

{ #category : #API }
CircularBuffer >> rotateRight [
	self rotate: 1.
	^ self at: currentIndex.
	
]

{ #category : #API }
CircularBuffer >> setAt: anObject [
	currentIndex := buffer indexOf: anObject 
]
