Extension { #name : #Character }

{ #category : #'*AdventOfCode2018' }
Character >> oppositeTo: aCharacter [
	^ (self isLowercase and: [ aCharacter isUppercase ]) or: [ self isUppercase and: [ aCharacter isLowercase ] ]
]
