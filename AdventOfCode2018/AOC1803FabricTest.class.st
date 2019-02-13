"
I'm a test for AOC1803Fabric
"
Class {
	#name : #AOC1803FabricTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day3'
}

{ #category : #tests }
AOC1803FabricTest >> testOverlap [
	| fabric |
	fabric := AOC1803Fabric new.
	fabric claim: (AOC1803Rectangle fromLine: '#1 @ 1,3: 4x4').
	fabric claim: (AOC1803Rectangle fromLine: '#2 @ 3,1: 4x4').
	fabric claim: (AOC1803Rectangle fromLine: '#3 @ 5,5: 2x2').
	self assert: fabric overlap equals: 4.
]
