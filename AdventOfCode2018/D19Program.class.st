Class {
	#name : #D19Program,
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
D19Program >> execute [
self initRegisters.
[ ip < steps size ] whileTrue: [self perform: (steps at: ip + 1). ip := ip + 1].
^a
]

{ #category : #initialization }
D19Program >> initRegisters [
a := 0. b := 0. c := 0. d := 0. e := 0. f := 0. ip := 0
]

{ #category : #initialization }
D19Program >> initialize [
steps := (0 to: 35) collect: [ :i | ('step', i asString) asSymbol]
]

{ #category : #steps }
D19Program >> step0 [
ip := ip + 16.

]

{ #category : #steps }
D19Program >> step1 [
c := 1.

]

{ #category : #steps }
D19Program >> step10 [
ip := ip + d.

]

{ #category : #steps }
D19Program >> step11 [
ip := 2.

]

{ #category : #steps }
D19Program >> step12 [
c := c + 1.

]

{ #category : #steps }
D19Program >> step13 [
d := (c>f) asBit.

]

{ #category : #steps }
D19Program >> step14 [
ip := d + ip.

]

{ #category : #steps }
D19Program >> step15 [
ip := 1.

]

{ #category : #steps }
D19Program >> step16 [
ip := ip * ip.

]

{ #category : #steps }
D19Program >> step17 [
f := f + 2.

]

{ #category : #steps }
D19Program >> step18 [
f := f * f.

]

{ #category : #steps }
D19Program >> step19 [
f := ip * f.

]

{ #category : #steps }
D19Program >> step2 [
e := 1.

]

{ #category : #steps }
D19Program >> step20 [
f := f * 11.

]

{ #category : #steps }
D19Program >> step21 [
d := d + 5.

]

{ #category : #steps }
D19Program >> step22 [
d := d * ip.

]

{ #category : #steps }
D19Program >> step23 [
d := d + 4.

]

{ #category : #steps }
D19Program >> step24 [
f := f + d.

]

{ #category : #steps }
D19Program >> step25 [
ip := ip + a.

]

{ #category : #steps }
D19Program >> step26 [
ip := 0.

]

{ #category : #steps }
D19Program >> step27 [
d := ip.

]

{ #category : #steps }
D19Program >> step28 [
d := d * ip.

]

{ #category : #steps }
D19Program >> step29 [
d := ip + d.

]

{ #category : #steps }
D19Program >> step3 [
d := c * e.

]

{ #category : #steps }
D19Program >> step30 [
d := ip * d.

]

{ #category : #steps }
D19Program >> step31 [
d := d * 14.

]

{ #category : #steps }
D19Program >> step32 [
d := d * ip.

]

{ #category : #steps }
D19Program >> step33 [
f := f + d.

]

{ #category : #steps }
D19Program >> step34 [
a := 0.

]

{ #category : #steps }
D19Program >> step35 [
ip := 0.

]

{ #category : #steps }
D19Program >> step4 [
d := (d=f) asBit.

]

{ #category : #steps }
D19Program >> step5 [
ip := d + ip.

]

{ #category : #steps }
D19Program >> step6 [
ip := ip + 1.

]

{ #category : #steps }
D19Program >> step7 [
a := c + a.

]

{ #category : #steps }
D19Program >> step8 [
e := e + 1.

]

{ #category : #steps }
D19Program >> step9 [
d := (e>f) asBit.

]
