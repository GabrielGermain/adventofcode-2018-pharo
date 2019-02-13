"
Base class for Advent Of Code.
"
Class {
	#name : #AOC18Base,
	#superclass : #Object,
	#instVars : [
		'lines'
	],
	#category : #'AdventOfCode2018-Base'
}

{ #category : #initialization }
AOC18Base class >> fromFile: filename [
	^ self new lines: filename asFileReference contents lines
]

{ #category : #run }
AOC18Base class >> part1: filename [
	^ (self fromFile: filename) part1
]

{ #category : #run }
AOC18Base class >> part2: filename [
	^ (self fromFile: filename) part2
]

{ #category : #accessing }
AOC18Base >> lines [
	^ lines
]

{ #category : #accessing }
AOC18Base >> lines: anObject [
	lines := anObject
]
