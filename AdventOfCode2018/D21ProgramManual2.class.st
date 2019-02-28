Class {
	#name : #D21ProgramManual2,
	#superclass : #Object,
	#instVars : [
		'a',
		'b',
		'c',
		'd',
		'e',
		'f',
		'ip',
		'steps',
		'values'
	],
	#category : #'AdventOfCode2018-Day21'
}

{ #category : #execution }
D21ProgramManual2 >> execute [
self initRegisters.
[ ip < steps size ] whileTrue: [self perform: (steps at: ip + 1). ip := ip + 1].
^a
]

{ #category : #initialization }
D21ProgramManual2 >> initRegisters [
a := 0. b := 0. c := 0. d := 0. e := 0. f := 0. ip := 0
]

{ #category : #initialization }
D21ProgramManual2 >> initialize [
steps := (0 to: 30) collect: [ :i | ('step', i asString) asSymbol].
values := OrderedCollection new.
]

{ #category : #steps }
D21ProgramManual2 >> step0 [
e := 123.

]

{ #category : #steps }
D21ProgramManual2 >> step1 [
e := e bitAnd: 456.

]

{ #category : #steps }
D21ProgramManual2 >> step10 [
e := e bitAnd: 16777215.

]

{ #category : #steps }
D21ProgramManual2 >> step11 [
e := e * 65899.

]

{ #category : #steps }
D21ProgramManual2 >> step12 [
e := e bitAnd: 16777215.

]

{ #category : #steps }
D21ProgramManual2 >> step13 [
f := (256>d) asBit.

]

{ #category : #steps }
D21ProgramManual2 >> step14 [
ip := f + ip.

]

{ #category : #steps }
D21ProgramManual2 >> step15 [
ip := ip + 1.

]

{ #category : #steps }
D21ProgramManual2 >> step16 [
ip := 27.

]

{ #category : #steps }
D21ProgramManual2 >> step17 [
f := 0.

]

{ #category : #steps }
D21ProgramManual2 >> step18 [
c := f + 1.

]

{ #category : #steps }
D21ProgramManual2 >> step19 [
c := c * 256.

]

{ #category : #steps }
D21ProgramManual2 >> step2 [
e := (e=72) asBit.

]

{ #category : #steps }
D21ProgramManual2 >> step20 [
c := (c>d) asBit.

]

{ #category : #steps }
D21ProgramManual2 >> step21 [
ip := c + ip.

]

{ #category : #steps }
D21ProgramManual2 >> step22 [
ip := ip + 1.

]

{ #category : #steps }
D21ProgramManual2 >> step23 [
ip := 25.

]

{ #category : #steps }
D21ProgramManual2 >> step24 [
f := f + 1.

]

{ #category : #steps }
D21ProgramManual2 >> step25 [
ip := 17.

]

{ #category : #steps }
D21ProgramManual2 >> step26 [
d := f.

]

{ #category : #steps }
D21ProgramManual2 >> step27 [
ip := 7.

]

{ #category : #steps }
D21ProgramManual2 >> step28 [
"self halt."
(values includes: e) ifTrue: [ self halt ].
values add: e.
f := (e=a) asBit.

]

{ #category : #steps }
D21ProgramManual2 >> step29 [
ip := f + ip.

]

{ #category : #steps }
D21ProgramManual2 >> step3 [
ip := e + ip.

]

{ #category : #steps }
D21ProgramManual2 >> step30 [
ip := 5.

]

{ #category : #steps }
D21ProgramManual2 >> step4 [
ip := 0.

]

{ #category : #steps }
D21ProgramManual2 >> step5 [
e := 0.

]

{ #category : #steps }
D21ProgramManual2 >> step6 [
d := e bitOr: 65536.

]

{ #category : #steps }
D21ProgramManual2 >> step7 [
e := 10552971.

]

{ #category : #steps }
D21ProgramManual2 >> step8 [
f := d bitAnd: 255.

]

{ #category : #steps }
D21ProgramManual2 >> step9 [
e := e + f.

]
