"
Test for Grid
"
Class {
	#name : #GridTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Base'
}

{ #category : #tests }
GridTest >> testCreationWithInterval [
	| inst |
	inst := Grid rowsInterval: (0 to: 4) columnsInterval: (0 to: 4) withAll: 0.
	inst at: 0 at: 0 put: 12.
	self assert: (inst at: 0 at: 0) equals: 12.
	inst at: 4 at: 4 put: 42.
	self assert: (inst at: 4 at: 4) equals: 42
]

{ #category : #tests }
GridTest >> testCreationWithIntervalNegative [
	| inst |
	inst := Grid rowsInterval: (-2 to: 2) columnsInterval: (-2 to: 2) withAll: 0.
	inst at: -2 at: -2 put: 12.
	self assert: (inst at: -2 at: -2) equals: 12.
	inst at: 2 at: 2 put: 42.
	self assert: (inst at: 2 at: 2) equals: 42
]

{ #category : #tests }
GridTest >> testCreationWithSize [
	| inst |
	inst := Grid rows: 5 columns: 5 withAll: 0.
	inst at: 1 at: 1 put: 12.
	self assert: (inst at: 1 at: 1) equals: 12.
	inst at: 5 at: 5 put: 42.
	self assert: (inst at: 5 at: 5) equals: 42
]

{ #category : #tests }
GridTest >> testNativeLineAt [
	| inst line |
	inst := Grid rowsInterval: (-2 to: 2) columnsInterval: (-2 to: 2) withAll: 0.
	inst at: -2 at: -2 put: 12.
	line := inst nativeLineAt: -2.
	self assert: (line at: 1) equals: 12.
]
