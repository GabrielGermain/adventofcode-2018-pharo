Extension { #name : #String }

{ #category : #'*AdventOfCode2018' }
String >> startsWith: substring [
	^ (self findString: substring) = 1
]
