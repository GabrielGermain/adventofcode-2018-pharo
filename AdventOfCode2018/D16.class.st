"
Day 16
"
Class {
	#name : #D16,
	#superclass : #AOC18Base,
	#instVars : [
		'registers',
		'unknownOpcodes',
		'opcodes'
	],
	#category : #'AdventOfCode2018-Day16'
}

{ #category : #opcodes }
D16 >> addi: regA with: valB with: regC [
	self registerAt: regC put: (self registerAt: regA) + valB
]

{ #category : #opcodes }
D16 >> addr: regA with: regB with: regC [
	self registerAt: regC put: (self registerAt: regA) + (self registerAt: regB)
]

{ #category : #parts }
D16 >> applyCommand: command [
	| opcode args selector |
	args := command allButFirst asArray.
	opcode := command first.
	selector := opcodes at: opcode.
	self perform: selector withArguments: args.
]

{ #category : #opcodes }
D16 >> bani: regA with: valB with: regC [
	self registerAt: regC put: ((self registerAt: regA) bitAnd: valB)
]

{ #category : #opcodes }
D16 >> banr: regA with: regB with: regC [
	self registerAt: regC put: ((self registerAt: regA) bitAnd: (self registerAt: regB))
]

{ #category : #opcodes }
D16 >> bori: regA with: valB with: regC [
	self registerAt: regC put: ((self registerAt: regA) bitOr: valB)
]

{ #category : #opcodes }
D16 >> borr: regA with: regB with: regC [
	self registerAt: regC put: ((self registerAt: regA) bitOr: (self registerAt: regB))
]

{ #category : #opcodes }
D16 >> eqir: valA with: regB with: regC [
	(valA = (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D16 >> eqri: regA with: valB with: regC [
	((self registerAt: regA) = valB) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D16 >> eqrr: regA with: regB with: regC [
	((self registerAt: regA) = (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #parts }
D16 >> executeTestProgram [
	| stream command line |
	stream := ReadStream on: lines.
	self resetRegisters.
	[ stream atEnd ]
		whileFalse: [ line := stream next.
			(line findString: 'Before') > 0
				ifTrue: [ 2 timesRepeat: [ stream next ] ]
				ifFalse: [ line isNotEmpty
						ifTrue: [ command := self parseCommand: line.
							self applyCommand: command ] ] ]
]

{ #category : #opcodes }
D16 >> gtir: valA with: regB with: regC [
	(valA > (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D16 >> gtri: regA with: valB with: regC [
	((self registerAt: regA) > valB) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D16 >> gtrr: regA with: regB with: regC [
	((self registerAt: regA) > (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #initialization }
D16 >> initialize [
	self resetRegisters.
	opcodes := Dictionary new.
	unknownOpcodes := (self class selectorsInProtocol: 'opcodes') asOrderedCollection.
]

{ #category : #opcodes }
D16 >> muli: regA with: valB with: regC [
	self registerAt: regC put: (self registerAt: regA) * valB
]

{ #category : #opcodes }
D16 >> mulr: regA with: regB with: regC [
	self registerAt: regC put: (self registerAt: regA) * (self registerAt: regB)
]

{ #category : #parts }
D16 >> parseCommand: line [
	^ (line splitOn: ' ') collect: [ :each | each asInteger ]
]

{ #category : #parts }
D16 >> parseState: line [
	| start end tmp |
	start := line indexOf: $[.
	end := line indexOf: $].
	tmp := (line copyFrom: start + 1 to: end - 1).
	^ (tmp splitOn: ', ') collect: [ :each | each asInteger ]
]

{ #category : #parts }
D16 >> part1 [
	| stream line initialState command endState count opcodesCount selector opcode |
	stream := ReadStream on: lines.
	selector := nil.
	opcode := nil.
	count := 0.
	[ stream atEnd ]
		whileFalse: [ line := stream next.
			(line findString: 'Before') > 0
				ifTrue: [ initialState := self parseState: line.
					command := self parseCommand: stream next.
					endState := self parseState: stream next.
					opcodesCount := self testOpcodesOn: initialState withCommand: command expecting: endState.
					(opcodesCount at: 1) >= 3
						ifTrue: [ count := count + 1 ].
					(opcodesCount at: 1) = 1 ifTrue: [ selector := opcodesCount at: 2. opcode := opcodesCount at:3 ] ] ].
	^ OrderedCollection with: count with: selector with: opcode.
]

{ #category : #parts }
D16 >> part2 [
	| result |
	unknownOpcodes := (self class selectorsInProtocol: 'opcodes') asOrderedCollection.
	opcodes := Dictionary new.
	[ unknownOpcodes isNotEmpty ]
		whileTrue: [ result := self part1.
			opcodes at: (result at: 3) put: (result at: 2).
			unknownOpcodes remove: (result at: 2) ].
	self executeTestProgram.
]

{ #category : #registers }
D16 >> registerAt: i [
	^ registers at: (i+1)
]

{ #category : #registers }
D16 >> registerAt: i put: aValue [
	registers at: (i+1) put: aValue.
]

{ #category : #registers }
D16 >> registers [
	^ registers clone
]

{ #category : #registers }
D16 >> registers: anArray [
	1 to: 4 do: [ :i | registers at: i put: (anArray at: i) ]
]

{ #category : #registers }
D16 >> resetRegisters [
	registers := OrderedCollection new: 4 withAll: 0.
]

{ #category : #opcodes }
D16 >> seti: valA with: ignored with: regC [
	self registerAt: regC put: valA
]

{ #category : #opcodes }
D16 >> setr: regA with: ignored with: regC [
	self registerAt: regC put: (self registerAt: regA)
]

{ #category : #parts }
D16 >> testOpcodesOn: initialState withCommand: line expecting: result [
	| opcode args count matchingSelector |
	args := line allButFirst asArray.
	opcode := line first.
	(opcodes includesKey: opcode)
		ifTrue: [ ^ OrderedCollection with: 0 ].
	count := 0.
	matchingSelector := nil.
	unknownOpcodes
		do: [ :selector | 
			self registers: initialState.
			self perform: selector withArguments: args.
			self registers = result
				ifTrue: [ matchingSelector := selector.
					count := count + 1 ] ].
	^ OrderedCollection with: count with: matchingSelector with: opcode
]
