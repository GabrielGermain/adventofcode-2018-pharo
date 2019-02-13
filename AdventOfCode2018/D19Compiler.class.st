"
D19 compiler
"
Class {
	#name : #D19Compiler,
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
	#category : #'AdventOfCode2018-Day19'
}

{ #category : #opcodes }
D19Compiler >> addi: regA with: valB with: regC [
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
D19Compiler >> addr: regA with: regB with: regC [
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
D19Compiler >> bani: regA with: valB with: regC [
	self shouldBeImplemented.
	self registerAt: regC put: ((self registerAt: regA) bitAnd: valB)
]

{ #category : #opcodes }
D19Compiler >> banr: regA with: regB with: regC [
	self shouldBeImplemented.
	self registerAt: regC put: ((self registerAt: regA) bitAnd: (self registerAt: regB))
]

{ #category : #opcodes }
D19Compiler >> bori: regA with: valB with: regC [
	self shouldBeImplemented.
	self registerAt: regC put: ((self registerAt: regA) bitOr: valB)
]

{ #category : #opcodes }
D19Compiler >> borr: regA with: regB with: regC [
	self shouldBeImplemented.
	self registerAt: regC put: ((self registerAt: regA) bitOr: (self registerAt: regB))
]

{ #category : #compilation }
D19Compiler >> compileCommand: command [
	| opcode args selector useIp |
	args := command splitOn: Character space.
	opcode := args at: 1.
	args := (args allButFirst collect: [ :each | each asInteger ]) asArray.
	currentCode := WriteStream on: String new.
	currentCode
		nextPutAll: 'step';
		nextPutAll: currentIndex asString;
		cr.
	"useIp := args anySatisfy: [ :val | val = ipRegister ].
	useIp
		ifTrue: [ currentCode
				nextPutAll: (registers at: ipRegister);
				nextPutAll: ' := ip.';
				cr ]."
	selector := (opcode , ':with:with:') asSymbol.
	self perform: selector withArguments: args.
	"useIp
		ifTrue: [ currentCode
				nextPutAll: 'ip := ';
				nextPutAll: (registers at: ipRegister);
				nextPutAll: '.';
				cr ]."
	D19Program compile: currentCode contents classified: 'steps'
]

{ #category : #compilation }
D19Compiler >> compileProgram [
	self initProgram.
	self createProgram.
	self initRegisters.
	self createSteps.
	self createInitialization.
	self createExecution.
	
]

{ #category : #compilation }
D19Compiler >> createExecution [
	| code |
	code := 'execute', String cr, 'self initRegisters.', String cr, '[ ip < steps size ] whileTrue: [self perform: (steps at: ip + 1). ip := ip + 1].', String cr, '^a'.
	D19Program compile: code classified: 'execution'
	
]

{ #category : #compilation }
D19Compiler >> createInitialization [
	| code |
	code := 'initialize', String cr, 'steps := (0 to: ', (instructions size - 1) asString, ') collect: [ :i | (''step'', i asString) asSymbol]'.
	D19Program compile: code classified: 'initialization'	
]

{ #category : #compilation }
D19Compiler >> createProgram [
	Smalltalk removeClassNamed: #D19Program.
	Object subclass: #D19Program
	slots: {#a. #b. #c. #d. #e. #f. #ip. #steps}
	classVariables: {}
	package: 'AdventOfCode2018-Day19'
]

{ #category : #compilation }
D19Compiler >> createSteps [
	instructions withIndexDo: [ :val :index | currentIndex := index - 1. self compileCommand: val ]
	
]

{ #category : #opcodes }
D19Compiler >> eqir: valA with: regB with: regC [
	self shouldBeImplemented.
	(valA = (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D19Compiler >> eqri: regA with: valB with: regC [
	self shouldBeImplemented.
	((self registerAt: regA) = valB) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D19Compiler >> eqrr: regA with: regB with: regC [
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
D19Compiler >> gtir: valA with: regB with: regC [
	self shouldBeImplemented.
	(valA > (self registerAt: regB)) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D19Compiler >> gtri: regA with: valB with: regC [
	self shouldBeImplemented.
	((self registerAt: regA) > valB) ifTrue: [ self registerAt: regC put: 1 ] ifFalse: [ self registerAt: regC put: 0 ]
]

{ #category : #opcodes }
D19Compiler >> gtrr: regA with: regB with: regC [
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
D19Compiler >> initProgram [
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
D19Compiler >> initRegisters [
	|code|
	code := 'initRegisters', String cr, 'a := 0. b := 0. c := 0. d := 0. e := 0. f := 0. ip := 0'.
	D19Program compile: code classified: 'initialization'
]

{ #category : #initialization }
D19Compiler >> initialize [
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
D19Compiler >> muli: regA with: valB with: regC [
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
D19Compiler >> mulr: regA with: regB with: regC [
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
D19Compiler >> seti: valA with: ignored with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: valA asString;
		nextPutAll: '.';
		cr
]

{ #category : #opcodes }
D19Compiler >> setr: regA with: ignored with: regC [
	currentCode
		nextPutAll: (registers at: regC);
		nextPutAll: ' := ';
		nextPutAll: (registers at: regA);
		nextPutAll: '.';
		cr
]
