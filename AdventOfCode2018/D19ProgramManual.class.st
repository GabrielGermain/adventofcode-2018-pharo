Class {
	#name : #D19ProgramManual,
	#superclass : #Object,
	#instVars : [
		'a',
		'b',
		'c',
		'd',
		'e',
		'f',
		'ip',
		'steps'
	],
	#category : #'AdventOfCode2018-Day19'
}

{ #category : #execution }
D19ProgramManual >> execute [
self initRegisters.
[ ip < steps size ] whileTrue: [self perform: (steps at: ip + 1). ip := ip + 1].
^a
]

{ #category : #initialization }
D19ProgramManual >> initRegisters [
a := 1. b := 0. c := 0. d := 0. e := 0. f := 0. ip := 0
]

{ #category : #initialization }
D19ProgramManual >> initialize [
steps := (0 to: 35) collect: [ :i | ('step', i asString) asSymbol]
]

{ #category : #steps }
D19ProgramManual >> step0 [
ip := ip + 16.

]

{ #category : #steps }
D19ProgramManual >> step1 [
d := 1.

]

{ #category : #steps }
D19ProgramManual >> step10 [
ip := ip + c.

]

{ #category : #steps }
D19ProgramManual >> step11 [
"ip := 2."
ip := 3.
c := b * d.


]

{ #category : #steps }
D19ProgramManual >> step12 [
d := d + 1.
ip := ip + 2 + (d>f) asBit.

]

{ #category : #steps }
D19ProgramManual >> step13 [
c := (d>f) asBit.

]

{ #category : #steps }
D19ProgramManual >> step14 [
ip := c + ip.

]

{ #category : #steps }
D19ProgramManual >> step15 [
ip := 1.

]

{ #category : #steps }
D19ProgramManual >> step16 [
ip := ip * ip.

]

{ #category : #steps }
D19ProgramManual >> step17 [
f := f + 2.

]

{ #category : #steps }
D19ProgramManual >> step18 [
f := f * f.

]

{ #category : #steps }
D19ProgramManual >> step19 [
f := ip * f.

]

{ #category : #steps }
D19ProgramManual >> step2 [
b := 1.

]

{ #category : #steps }
D19ProgramManual >> step20 [
f := f * 11.

]

{ #category : #steps }
D19ProgramManual >> step21 [
c := c + 4.

]

{ #category : #steps }
D19ProgramManual >> step22 [
c := c * ip.

]

{ #category : #steps }
D19ProgramManual >> step23 [
c := c + 5.

]

{ #category : #steps }
D19ProgramManual >> step24 [
f := f + c.

]

{ #category : #steps }
D19ProgramManual >> step25 [
ip := ip + a.

]

{ #category : #steps }
D19ProgramManual >> step26 [
ip := 0.

]

{ #category : #steps }
D19ProgramManual >> step27 [
c := ip.

]

{ #category : #steps }
D19ProgramManual >> step28 [
c := c * ip.

]

{ #category : #steps }
D19ProgramManual >> step29 [
c := ip + c.

]

{ #category : #steps }
D19ProgramManual >> step3 [
c := d * b.

]

{ #category : #steps }
D19ProgramManual >> step30 [
c := ip * c.

]

{ #category : #steps }
D19ProgramManual >> step31 [
c := c * 14.

]

{ #category : #steps }
D19ProgramManual >> step32 [
c := c * ip.

]

{ #category : #steps }
D19ProgramManual >> step33 [
f := f + c.

]

{ #category : #steps }
D19ProgramManual >> step34 [
a := 0.

]

{ #category : #steps }
D19ProgramManual >> step35 [
ip := 0.

]

{ #category : #steps }
D19ProgramManual >> step4 [
	"c := (c=f) asBit."

	"ip := ip + 1 + (c=f) asBit."

	"[ b > f ]
		whileFalse: [ c = f
				ifTrue: [ a := d + a ].
			b := b + 1.
			c := b * d ]."

	f \\ d = 0
		ifTrue: [ a := d + a ].
	ip := 11
	"
	c = f
		ifTrue: [ a := d + a ].
	b := b + 1."
	"ip := 10 + (b>f) asBit."
	"b > f
		ifFalse: [ ip := 3.
			c := b * d ]
		ifTrue: [ ip := 11 ]"
]

{ #category : #steps }
D19ProgramManual >> step5 [
ip := c + ip.

]

{ #category : #steps }
D19ProgramManual >> step6 [
ip := ip + 1.

]

{ #category : #steps }
D19ProgramManual >> step7 [
a := d + a.

]

{ #category : #steps }
D19ProgramManual >> step8 [
b := b + 1.

]

{ #category : #steps }
D19ProgramManual >> step9 [
"c := (b>f) asBit."
ip := ip + 1 + (b>f) asBit.

]
