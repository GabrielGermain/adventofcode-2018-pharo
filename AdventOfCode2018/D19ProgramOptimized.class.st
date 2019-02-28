Class {
	#name : #D19ProgramOptimized,
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
D19ProgramOptimized >> execute [
self initRegisters.
[ ip < steps size ] whileTrue: [self perform: (steps at: ip + 1). ip := ip + 1].
^a
]

{ #category : #initialization }
D19ProgramOptimized >> initRegisters [
a := 1. b := 0. c := 0. d := 0. e := 0. f := 0. ip := 0
]

{ #category : #initialization }
D19ProgramOptimized >> initialize [
steps := (0 to: 35) collect: [ :i | ('step', i asString) asSymbol]
]

{ #category : #steps }
D19ProgramOptimized >> step0 [
ip := ip + 16.

]

{ #category : #steps }
D19ProgramOptimized >> step1 [
c := 1.

]

{ #category : #steps }
D19ProgramOptimized >> step10 [
ip := ip + d.

]

{ #category : #steps }
D19ProgramOptimized >> step11 [
ip := 2.

]

{ #category : #steps }
D19ProgramOptimized >> step12 [
c := c + 1.

]

{ #category : #steps }
D19ProgramOptimized >> step13 [
d := (c>f) asBit.

]

{ #category : #steps }
D19ProgramOptimized >> step14 [
ip := d + ip.

]

{ #category : #steps }
D19ProgramOptimized >> step15 [
ip := 1.

]

{ #category : #steps }
D19ProgramOptimized >> step16 [
ip := ip * ip.

]

{ #category : #steps }
D19ProgramOptimized >> step17 [
f := f + 2.

]

{ #category : #steps }
D19ProgramOptimized >> step18 [
f := f * f.

]

{ #category : #steps }
D19ProgramOptimized >> step19 [
f := ip * f.

]

{ #category : #steps }
D19ProgramOptimized >> step2 [
e := 1.

]

{ #category : #steps }
D19ProgramOptimized >> step20 [
f := f * 11.

]

{ #category : #steps }
D19ProgramOptimized >> step21 [
d := d + 5.

]

{ #category : #steps }
D19ProgramOptimized >> step22 [
d := d * ip.

]

{ #category : #steps }
D19ProgramOptimized >> step23 [
d := d + 4.

]

{ #category : #steps }
D19ProgramOptimized >> step24 [
f := f + d.

]

{ #category : #steps }
D19ProgramOptimized >> step25 [
ip := ip + a.

]

{ #category : #steps }
D19ProgramOptimized >> step26 [
ip := 0.

]

{ #category : #steps }
D19ProgramOptimized >> step27 [
d := ip.

]

{ #category : #steps }
D19ProgramOptimized >> step28 [
d := d * ip.

]

{ #category : #steps }
D19ProgramOptimized >> step29 [
d := ip + d.

]

{ #category : #steps }
D19ProgramOptimized >> step3 [
d := c * e.

]

{ #category : #steps }
D19ProgramOptimized >> step30 [
d := ip * d.

]

{ #category : #steps }
D19ProgramOptimized >> step31 [
d := d * 14.

]

{ #category : #steps }
D19ProgramOptimized >> step32 [
d := d * ip.

]

{ #category : #steps }
D19ProgramOptimized >> step33 [
f := f + d.

]

{ #category : #steps }
D19ProgramOptimized >> step34 [
a := 0.

]

{ #category : #steps }
D19ProgramOptimized >> step35 [
ip := 0.

]

{ #category : #steps }
D19ProgramOptimized >> step4 [
"d := (d=f) asBit."
"d = f ifTrue: [ a := c + a ]."
"ip := 7"
"e := e + 1."
"ip := 8"
"e > f ifTrue: [ ip := 11 ] ifFalse: [ ip := 2 ]."
"e > f ifTrue: [ ip := 11 ] ifFalse: [ d := c * e. ip := 3 ]"

"d = f ifTrue: [ a := c + a ].
e := e + 1.
e > f ifTrue: [ ip := 11 ] ifFalse: [ d := c * e. ip := 3 ]"

"[ e > f ] whileFalse: [ d = f ifTrue: [ a := c + a ]. e := e + 1. d := c * e ]."
f \\ c = 0 ifTrue: [ a := c + a ].
ip := 11.


]

{ #category : #steps }
D19ProgramOptimized >> step5 [
ip := d + ip.

]

{ #category : #steps }
D19ProgramOptimized >> step6 [
ip := ip + 1.

]

{ #category : #steps }
D19ProgramOptimized >> step7 [
a := c + a.

]

{ #category : #steps }
D19ProgramOptimized >> step8 [
e := e + 1.

]

{ #category : #steps }
D19ProgramOptimized >> step9 [
d := (e>f) asBit.

]
