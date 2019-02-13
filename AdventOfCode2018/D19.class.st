"
Day 19
"
Class {
	#name : #D19,
	#superclass : #AOC18Base,
	#instVars : [
		'registers',
		'ip',
		'ipRegister',
		'instructions'
	],
	#category : #'AdventOfCode2018-Day19'
}

{ #category : #opcodes }
D19 >> addi: regA with: valB with: regC [
	self registerAt: regC put: (self registerAt: regA) + valB
]

{ #category : #opcodes }
D19 >> addr: regA with: regB with: regC [
	self registerAt: regC put: (self registerAt: regA) + (self registerAt: regB)
]

{ #category : #parts }
D19 >> applyCommand: command [
	| opcode args selector |
	args := command splitOn: Character space.
	opcode := args at: 1.
	args := (args allButFirst collect: [ :each | each asInteger ]) asArray.
	selector := (opcode, ':with:with:') asSymbol.
	self perform: selector withArguments: args.
]

{ #category : #opcodes }
D19 >> bani: regA with: valB with: regC [
	self registerAt: regC put: ((self registerAt: regA) bitAnd: valB)
]

{ #category : #opcodes }
D19 >> banr: regA with: regB with: regC [
	self registerAt: regC put: ((self registerAt: regA) bitAnd: (self registerAt: regB))
]

{ #category : #opcodes }
D19 >> bori: regA with: valB with: regC [
	self registerAt: regC put: ((self registerAt: regA) bitOr: valB)
]

{ #category : #opcodes }
D19 >> borr: regA with: regB with: regC [
	self registerAt: regC put: ((self registerAt: regA) bitOr: (self registerAt: regB))
]

{ #category : #opcodes }
D19 >> eqir: valA with: regB with: regC [
	(valA = (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D19 >> eqri: regA with: valB with: regC [
	((self registerAt: regA) = valB) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D19 >> eqrr: regA with: regB with: regC [
	((self registerAt: regA) = (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #parts }
D19 >> executeNext [
	(ipRegister isNotNil) ifTrue: [ self registerAt: ipRegister put: ip ].
	self applyCommand: (instructions at: ip).
	(ipRegister isNotNil) ifTrue: [ ip := self registerAt: ipRegister ].
	ip := ip + 1
	
]

{ #category : #opcodes }
D19 >> gtir: valA with: regB with: regC [
	(valA > (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D19 >> gtri: regA with: valB with: regC [
	((self registerAt: regA) > valB) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D19 >> gtrr: regA with: regB with: regC [
	((self registerAt: regA) > (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #parts }
D19 >> initProgram [
	| prologue listing |
	prologue := lines first.
	listing := lines.
	prologue first = $#
		ifTrue: [ ipRegister := (prologue at: 5) digitValue.
			listing := lines allButFirst ].
	instructions := ShiftList withList: listing andShift: 1
]

{ #category : #initialization }
D19 >> initialize [
	ip := 0.
	ipRegister := nil.
	self resetRegisters
]

{ #category : #opcodes }
D19 >> muli: regA with: valB with: regC [
	self registerAt: regC put: (self registerAt: regA) * valB
]

{ #category : #opcodes }
D19 >> mulr: regA with: regB with: regC [
	self registerAt: regC put: (self registerAt: regA) * (self registerAt: regB)
]

{ #category : #parts }
D19 >> part1 [
	self initProgram.
	[ ip < instructions size ] whileTrue: [ self executeNext ].
	^ self registerAt: 0
	
]

{ #category : #parts }
D19 >> part2 [

]

{ #category : #registers }
D19 >> registerAt: i [
	^ registers at: (i+1)
]

{ #category : #registers }
D19 >> registerAt: i put: aValue [
	registers at: (i+1) put: aValue.
]

{ #category : #registers }
D19 >> registers [
	^ registers clone
]

{ #category : #registers }
D19 >> registers: anArray [
	1 to: registers size do: [ :i | registers at: i put: (anArray at: i) ]
]

{ #category : #registers }
D19 >> resetRegisters [
	registers := OrderedCollection new: 6 withAll: 0.
]

{ #category : #opcodes }
D19 >> seti: valA with: ignored with: regC [
	self registerAt: regC put: valA
]

{ #category : #opcodes }
D19 >> setr: regA with: ignored with: regC [
	self registerAt: regC put: (self registerAt: regA)
]
