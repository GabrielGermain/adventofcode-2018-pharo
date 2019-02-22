"
Day8

D8 part1: 'E:/Gabriel_2/Work/AOC2018/Day8/input.txt'
D8 part2: 'E:/Gabriel_2/Work/AOC2018/Day8/input.txt'
"
Class {
	#name : #D8,
	#superclass : #AOC18Base,
	#instVars : [
		'stream',
		'root'
	],
	#category : #'AdventOfCode2018-Day8'
}

{ #category : #actions }
D8 >> buildNodes [
	self initStream.
	root := Node new fromStream: stream; yourself.
	stream close.
	
]

{ #category : #accessing }
D8 >> initStream [
	stream := (((lines at: 1) splitOn: Character space) collect: [ :each | each asInteger ]) readStream
]

{ #category : #parts }
D8 >> part1 [
	self buildNodes.
	^ root nbTotalMetadata
]

{ #category : #parts }
D8 >> part2 [
		self buildNodes.
	^ root value
]

{ #category : #accessing }
D8 >> root [
	^ root
]

{ #category : #accessing }
D8 >> root: anObject [
	root := anObject
]

{ #category : #accessing }
D8 >> stream [
	^ stream
]

{ #category : #accessing }
D8 >> stream: anObject [
	stream := anObject
]
