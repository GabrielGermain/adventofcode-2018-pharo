"
Grid
"
Class {
	#name : #Grid,
	#superclass : #Object,
	#instVars : [
		'lines',
		'xShift',
		'yShift'
	],
	#category : #'AdventOfCode2018-Base'
}

{ #category : #initialization }
Grid class >> lines: lines [
	^ self new lines: lines; xShift: 0; yShift: 0; yourself.
	
]

{ #category : #initialization }
Grid class >> rows: rowCount columns: columnCount withAll: anObject [
	| lines line|
	lines := OrderedCollection new: rowCount.
	1 to: rowCount do: [ :j | line := OrderedCollection new: columnCount withAll: anObject. lines add: line. ].
	^ self new lines: lines; xShift: 0; yShift: 0; yourself.
	
]

{ #category : #initialization }
Grid class >> rowsInterval: rowsInterval columnsInterval: columnsInterval withAll: anObject [
	| lines line |
	lines := OrderedCollection new: rowsInterval size.
	rowsInterval do: [ :j | line := OrderedCollection new: columnsInterval size withAll: anObject. lines add: line. ].
	^ self new lines: lines; xShift: 1 - (columnsInterval first); yShift: 1 - (rowsInterval first); yourself.
	
]

{ #category : #acccessing }
Grid >> at: x at: y [
	^ (lines at: y + yShift) at: x + xShift
]

{ #category : #acccessing }
Grid >> at: x at: y put: anObject [
	(lines at: y + yShift) at: x + xShift put: anObject
]

{ #category : #accessing }
Grid >> lines [
	^ lines
]

{ #category : #accessing }
Grid >> lines: anObject [
	lines := anObject
]

{ #category : #accessing }
Grid >> nativeLineAt: y [
	^ lines at: y + yShift.
]

{ #category : #printing }
Grid >> print [
	lines do: [ :line | Transcript show: ((line collect: [:c | c asCharacter]) as:String); cr ]
]

{ #category : #printing }
Grid >> printGrid [
	lines do: [ :line | Transcript show: ((line collect: [:c | c asCharacter]) as:String); cr ]
]

{ #category : #accessing }
Grid >> xShift [
	^ xShift
]

{ #category : #accessing }
Grid >> xShift: anObject [
	xShift := anObject
]

{ #category : #accessing }
Grid >> yShift [
	^ yShift
]

{ #category : #accessing }
Grid >> yShift: anObject [
	yShift := anObject
]
