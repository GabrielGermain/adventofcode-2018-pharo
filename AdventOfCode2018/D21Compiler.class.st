"
D21Compiler

Transpile the instructions:
(D21Compiler fromFile: 'E:\Gabriel_2\Work\AOC2018\Day21\input2.txt') compileProgram.
One comparison with register 0 is done in step 28.
Add a breakpoint here to check value to answer part1.
D21ProgramManual2 new execute
To answer part2, we need to find the first repeating value.
Add a collection of values to program attributes and to step28 (the value to check depends on your input, d in my case):
(values includes: d) ifTrue: [ self halt ].
values add: d.
The answer is: values last
"
Class {
	#name : #D21Compiler,
	#superclass : #AOC18Base,
	#instVars : [
		'registers',
		'ip',
		'ipRegister',
		'instructions',
		'program',
		'currentIndex',
		'currentCode'
	],
	#category : #'AdventOfCode2018-Day21'
}

{ #category : #opcodes }
D21Compiler >> addi: regA with: valB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: (registers at: regA);
		nextPutAll: ' + ';
		nextPutAll: valB asString;
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> addr: regA with: regB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: (registers at: regA);
		nextPutAll: ' + ';
		nextPutAll: (registers at: regB) asString;
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> bani: regA with: valB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: (registers at: regA);
		nextPutAll: ' bitAnd: ';
		nextPutAll: valB asString;
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> banr: regA with: regB with: regC [
	self shouldBeImplemented.
	self registerAt: regC put: ((self registerAt: regA) bitAnd: (self registerAt: regB))
]

{ #category : #opcodes }
D21Compiler >> bori: regA with: valB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: (registers at: regA);
		nextPutAll: ' bitOr: ';
		nextPutAll: valB asString;
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> borr: regA with: regB with: regC [
	self shouldBeImplemented.
	self registerAt: regC put: ((self registerAt: regA) bitOr: (self registerAt: regB))
]

{ #category : #compilation }
D21Compiler >> compileCommand: command [
	| opcode args selector |
	args := command splitOn: Character space.
	opcode := args at: 1.
	args := (args allButFirst collect: [ :each | each asInteger ]) asArray.
	currentCode := WriteStream on: String new.
	currentCode
		nextPutAll: 'step';
		nextPutAll: currentIndex asString;
		cr.
	selector := (opcode , ':with:with:') asSymbol.
	self perform: selector withArguments: args.
	D21Program compile: currentCode contents classified: 'steps'
]

{ #category : #compilation }
D21Compiler >> compileProgram [
	self initProgram.
	self createProgram.
	self initRegisters.
	self createSteps.
	self createInitialization.
	self createExecution.
	
]

{ #category : #compilation }
D21Compiler >> createExecution [
	| code |
	code := 'execute', String cr, 'self initRegisters.', String cr, '[ ip < steps size ] whileTrue: [self perform: (steps at: ip + 1). ip := ip + 1].', String cr, '^a'.
	D21Program compile: code classified: 'execution'
	
]

{ #category : #compilation }
D21Compiler >> createInitialization [
	| code |
	code := 'initialize', String cr, 'steps := (0 to: ', (instructions size - 1) asString, ') collect: [ :i | (''step'', i asString) asSymbol]'.
	D21Program compile: code classified: 'initialization'	
]

{ #category : #compilation }
D21Compiler >> createProgram [
	Smalltalk removeClassNamed: #D21Program.
	Object subclass: #D21Program
	slots: {#a. #b. #c. #d. #e. #f. #ip. #steps}
	classVariables: {}
	package: 'AdventOfCode2018-Day21'
]

{ #category : #compilation }
D21Compiler >> createSteps [
	instructions withIndexDo: [ :val :index | currentIndex := index - 1. self compileCommand: val ]
	
]

{ #category : #opcodes }
D21Compiler >> eqir: valA with: regB with: regC [
	self shouldBeImplemented.
	(valA = (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D21Compiler >> eqri: regA with: valB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: '(';
		nextPutAll: (registers at: regA);
		nextPutAll: '=';
		nextPutAll: valB asString;
		nextPutAll: ') asBit';
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> eqrr: regA with: regB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: '(';
		nextPutAll: (registers at: regA);
		nextPutAll: '=';
		nextPutAll: (registers at: regB);
		nextPutAll: ') asBit';
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> gtir: valA with: regB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: '(';
		nextPutAll: valA asString;
		nextPutAll: '>';
		nextPutAll: (registers at: regB);
		nextPutAll: ') asBit';
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> gtri: regA with: valB with: regC [
	self shouldBeImplemented.
	((self registerAt: regA) > valB) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D21Compiler >> gtrr: regA with: regB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: '(';
		nextPutAll: (registers at: regA);
		nextPutAll: '>';
		nextPutAll: (registers at: regB);
		nextPutAll: ') asBit';
		nextPutAll: '.';
		cr
]

{ #category : #compilation }
D21Compiler >> initProgram [
	| prologue listing |
	prologue := lines first.
	listing := lines.
	prologue first = $#
		ifTrue: [ ipRegister := (prologue at: 5) digitValue.
			listing := lines allButFirst ].
	registers at: ipRegister put: 'ip'.
	instructions := listing.
	
]

{ #category : #compilation }
D21Compiler >> initRegisters [
	|code|
	code := 'initRegisters', String cr, 'a := 0. b := 0. c := 0. d := 0. e := 0. f := 0. ip := 0'.
	D21Program compile: code classified: 'initialization'
]

{ #category : #initialization }
D21Compiler >> initialize [
	ip := 0.
	ipRegister := nil.
	registers := Dictionary
		newFrom:
			{(0 -> 'a').
			(1 -> 'b').
			(2 -> 'c').
			(3 -> 'd').
			(4 -> 'e').
			(5 -> 'f')}
]

{ #category : #opcodes }
D21Compiler >> muli: regA with: valB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: (registers at: regA);
		nextPutAll: ' * ';
		nextPutAll: valB asString;
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> mulr: regA with: regB with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: (registers at: regA);
		nextPutAll: ' * ';
		nextPutAll: (registers at: regB);
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> seti: valA with: ignored with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: valA asString;
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D21Compiler >> setr: regA with: ignored with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: (registers at: regA);
		nextPutAll: '.';
		cr
]
