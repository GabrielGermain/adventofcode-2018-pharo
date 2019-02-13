Extension { #name : #Point }

{ #category : #'*AdventOfCode2018' }
Point >> manhattanDist: aPoint [
	^ (aPoint x - x) abs + (aPoint y - y) abs

]
