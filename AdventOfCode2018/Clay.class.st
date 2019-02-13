"
Clay
"
Class {
	#name : #Clay,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#classVars : [
		'Matcher'
	],
	#category : #'AdventOfCode2018-Day17'
}

{ #category : #initialization }
Clay class >> fromLine: line [
	| selector firstParam firstArg secondArg |
	Matcher matches: line.
	selector := (Matcher subexpression: 2),':',(Matcher subexpression: 4),':'.
	firstParam := (Matcher subexpression: 3) asInteger.
	firstArg := firstParam to: firstParam.
	secondArg := (Matcher subexpression: 5) asInteger to: (Matcher subexpression: 6) asInteger.
	^ self perform: selector asSymbol with: firstArg with: secondArg
]

{ #category : #initialization }
Clay class >> initialize [
	Matcher := RxMatcher forString: '(.)=(\d+), (.)=(\d+)\.\.(\d+)'
]

{ #category : #initialization }
Clay class >> x: x y: y [
	^ self new x: x; y: y; yourself
	
]

{ #category : #initialization }
Clay class >> y: y x: x [
	^ self new x: x; y: y; yourself
	
]

{ #category : #API }
Clay >> fillGrid: aGrid [
	x do: [ :i | y do: [ :j | aGrid at: i at: j put: $# ] ]
]

{ #category : #accessing }
Clay >> x [
	^ x
]

{ #category : #accessing }
Clay >> x: anObject [
	x := anObject
]

{ #category : #accessing }
Clay >> y [
	^ y
]

{ #category : #accessing }
Clay >> y: anObject [
	y := anObject
]
