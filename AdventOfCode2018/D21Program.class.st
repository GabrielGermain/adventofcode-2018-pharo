Class {
	#name : #D21Program,
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
	#category : #'AdventOfCode2018-Day21'
}

{ #category : #execution }
D21Program >> execute [
self initRegisters.
[ ip < steps size ] whileTrue: [self perform: (steps at: ip + 1). ip := ip + 1].
^a
]

{ #category : #initialization }
D21Program >> initRegisters [
a := 0. b := 0. c := 0. d := 0. e := 0. f := 0. ip := 0
]

{ #category : #initialization }
D21Program >> initialize [
steps := (0 to: 30) collect: [ :i | ('step', i asString) asSymbol]
]

{ #category : #steps }
D21Program >> step0 [
e := 123.

]

{ #category : #steps }
D21Program >> step1 [
e := e bitAnd: 456.

]

{ #category : #steps }
D21Program >> step10 [
e := e bitAnd: 16777215.

]

{ #category : #steps }
D21Program >> step11 [
e := e * 65899.

]

{ #category : #steps }
D21Program >> step12 [
e := e bitAnd: 16777215.

]

{ #category : #steps }
D21Program >> step13 [
f := (256>d) asBit.

]

{ #category : #steps }
D21Program >> step14 [
ip := f + ip.

]

{ #category : #steps }
D21Program >> step15 [
ip := ip + 1.

]

{ #category : #steps }
D21Program >> step16 [
ip := 27.

]

{ #category : #steps }
D21Program >> step17 [
f := 0.

]

{ #category : #steps }
D21Program >> step18 [
c := f + 1.

]

{ #category : #steps }
D21Program >> step19 [
c := c * 256.

]

{ #category : #steps }
D21Program >> step2 [
e := (e=72) asBit.

]

{ #category : #steps }
D21Program >> step20 [
c := (c>d) asBit.

]

{ #category : #steps }
D21Program >> step21 [
ip := c + ip.

]

{ #category : #steps }
D21Program >> step22 [
ip := ip + 1.

]

{ #category : #steps }
D21Program >> step23 [
ip := 25.

]

{ #category : #steps }
D21Program >> step24 [
f := f + 1.

]

{ #category : #steps }
D21Program >> step25 [
ip := 17.

]

{ #category : #steps }
D21Program >> step26 [
d := f.

]

{ #category : #steps }
D21Program >> step27 [
ip := 7.

]

{ #category : #steps }
D21Program >> step28 [
f := (e=a) asBit.

]

{ #category : #steps }
D21Program >> step29 [
ip := f + ip.

]

{ #category : #steps }
D21Program >> step3 [
ip := e + ip.

]

{ #category : #steps }
D21Program >> step30 [
ip := 5.

]

{ #category : #steps }
D21Program >> step4 [
ip := 0.

]

{ #category : #steps }
D21Program >> step5 [
e := 0.

]

{ #category : #steps }
D21Program >> step6 [
d := e bitOr: 65536.

]

{ #category : #steps }
D21Program >> step7 [
e := 10552971.

]

{ #category : #steps }
D21Program >> step8 [
f := d bitAnd: 255.

]

{ #category : #steps }
D21Program >> step9 [
e := e + f.

]
