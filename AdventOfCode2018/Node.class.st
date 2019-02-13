"
I'm a node
"
Class {
	#name : #Node,
	#superclass : #Object,
	#instVars : [
		'nbNodes',
		'nbMetadata',
		'nodes',
		'metadata'
	],
	#category : #'AdventOfCode2018-Day8'
}

{ #category : #initialization }
Node >> fromStream: aStream [
	nbNodes := aStream next.
	nbMetadata := aStream next.
	nodes := (1 to: nbNodes) collect: [ :i | Node new fromStream: aStream; yourself ].
	metadata := (1 to: nbMetadata) collect: [ :i | aStream next ]
]

{ #category : #accessing }
Node >> metadataSum [
	^ metadata isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ metadata sum ]
]

{ #category : #accessing }
Node >> nbTotalMetadata [
	^ (metadata isEmpty ifTrue: [0] ifFalse: [ metadata sum ] )
		+
			(nodes isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ (nodes collect: [ :each | each nbTotalMetadata ]) sum ])
]

{ #category : #accessing }
Node >> value [
	^ nodes isEmpty
		ifTrue: [ self metadataSum ]
		ifFalse: [ (metadata
				collect: [ :datum | 
					datum > 0 & (datum <= nodes size)
						ifTrue: [ (nodes at: datum) value ]
						ifFalse: [ 0 ] ]) sum ]
]
