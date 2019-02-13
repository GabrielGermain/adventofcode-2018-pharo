"
Magic is in step28
"
Class {
	#name : #D21ProgramManual,
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
		'values',
		'lastd'
	],
	#category : #'AdventOfCode2018-Day21'
}

{ #category : #execution }
D21ProgramManual >> execute [
self initRegisters.
[ ip < steps size ] whileTrue: [self perform: (steps at: ip + 1). ip := ip + 1].
^a
]

{ #category : #initialization }
D21ProgramManual >> initRegisters [
a := 0. b := 0. c := 0. d := 0. e := 0. f := 0. ip := 0
]

{ #category : #initialization }
D21ProgramManual >> initialize [
values := Set new.
steps := (0 to: 30) collect: [ :i | ('step', i asString) asSymbol]
]

{ #category : #steps }
D21ProgramManual >> step0 [
d := 123.

]

{ #category : #steps }
D21ProgramManual >> step1 [
d := d bitAnd: 456.

]

{ #category : #steps }
D21ProgramManual >> step10 [
d := d bitAnd: 16777215.

]

{ #category : #steps }
D21ProgramManual >> step11 [
d := d * 65899.

]

{ #category : #steps }
D21ProgramManual >> step12 [
d := d bitAnd: 16777215.

]

{ #category : #steps }
D21ProgramManual >> step13 [
f := (256>e) asBit.

]

{ #category : #steps }
D21ProgramManual >> step14 [
ip := f + ip.

]

{ #category : #steps }
D21ProgramManual >> step15 [
ip := ip + 1.

]

{ #category : #steps }
D21ProgramManual >> step16 [
ip := 27.

]

{ #category : #steps }
D21ProgramManual >> step17 [
f := 0.

]

{ #category : #steps }
D21ProgramManual >> step18 [
b := f + 1.

]

{ #category : #steps }
D21ProgramManual >> step19 [
b := b * 256.

]

{ #category : #steps }
D21ProgramManual >> step2 [
d := (d=72) asBit.

]

{ #category : #steps }
D21ProgramManual >> step20 [
b := (b>e) asBit.

]

{ #category : #steps }
D21ProgramManual >> step21 [
ip := b + ip.

]

{ #category : #steps }
D21ProgramManual >> step22 [
ip := ip + 1.

]

{ #category : #steps }
D21ProgramManual >> step23 [
ip := 25.

]

{ #category : #steps }
D21ProgramManual >> step24 [
f := f + 1.

]

{ #category : #steps }
D21ProgramManual >> step25 [
ip := 17.

]

{ #category : #steps }
D21ProgramManual >> step26 [
e := f.

]

{ #category : #steps }
D21ProgramManual >> step27 [
ip := 7.

]

{ #category : #steps }
D21ProgramManual >> step28 [
(values includes: d) ifTrue: [ self halt ].
values add: d.
lastd := d.
f := (d=a) asBit.

]

{ #category : #steps }
D21ProgramManual >> step29 [
ip := f + ip.

]

{ #category : #steps }
D21ProgramManual >> step3 [
ip := d + ip.

]

{ #category : #steps }
D21ProgramManual >> step30 [
ip := 5.

]

{ #category : #steps }
D21ProgramManual >> step4 [
ip := 0.

]

{ #category : #steps }
D21ProgramManual >> step5 [
d := 0.

]

{ #category : #steps }
D21ProgramManual >> step6 [
e := d bitOr: 65536.

]

{ #category : #steps }
D21ProgramManual >> step7 [
d := 10649702.

]

{ #category : #steps }
D21ProgramManual >> step8 [
f := e bitAnd: 255.

]

{ #category : #steps }
D21ProgramManual >> step9 [
d := d + f.

]
