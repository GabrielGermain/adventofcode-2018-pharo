"
I'm a the fabric
"
Class {
	#name : #AOC1803Fabric,
	#superclass : #Object,
	#instVars : [
		'grid'
	],
	#category : #'AdventOfCode2018-Day3'
}

{ #category : #initialization }
AOC1803Fabric >> claim: aRectangle [
	| val |
	aRectangle minX to: aRectangle maxX do: [ :i | 
		aRectangle minY to: aRectangle maxY do: [ :j | 
			val := self grid at: i at: j.
			self grid at: i at: j put: val + 1 ] ]
]

{ #category : #accessing }
AOC1803Fabric >> grid [
	^ grid
]

{ #category : #accessing }
AOC1803Fabric >> grid: anObject [
	grid := anObject
]

{ #category : #initialization }
AOC1803Fabric >> initialize [
	grid := Array2D zeros: 1000
	
]

{ #category : #actions }
AOC1803Fabric >> overlap [
	| count |
	count := 0.
	self grid
		do: [ :elt | 
			elt > 1
				ifTrue: [ count := count + 1 ] ].
	^ count
]
