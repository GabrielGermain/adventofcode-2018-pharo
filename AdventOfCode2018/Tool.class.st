"
Tool
neither 0
torch 1
climbing gear 2

Types
rocky 0
wet 1
narrow 2

This way, if tool != type, tool is not usable on this square
"
Class {
	#name : #Tool,
	#superclass : #Object,
	#category : #'AdventOfCode2018-Day22'
}

{ #category : #enum }
Tool class >> climb [
	^ 2
]

{ #category : #enum }
Tool class >> neither [
	^ 0
]

{ #category : #operation }
Tool class >> switch: tool onType: type [
	^ (0 to: 2) asOrderedCollection remove: tool; remove: type; first
]

{ #category : #operation }
Tool class >> switchTool: tool onType: type [
	^ (0 to: 2) asOrderedCollection remove: tool; remove: type; first
]

{ #category : #enum }
Tool class >> torch [
	^ 1
]
