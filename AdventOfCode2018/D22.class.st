"
Day22
"
Class {
	#name : #D22,
	#superclass : #AOC18Base,
	#instVars : [
		'grid',
		'target',
		'depth',
		'open',
		'nodes'
	],
	#category : #'AdventOfCode2018-Day22'
}

{ #category : #initialization }
D22 class >> withDepth: anInt withTarget: aPoint [
	| size |
	size := { aPoint x. aPoint y } max.
	^ D22 new
		depth: anInt;
		target: aPoint;
		grid: (Array2D rows: size + 100 columns: 100 );
		yourself
]

{ #category : #parts }
D22 >> computeTypes [
	1 to: grid numberOfColumns do: [ :i | grid at: 1 at: i put: (((i - 1) * 16807) + depth) % 20183 ].
	1 to: grid numberOfRows do: [ :j | grid at: j at: 1 put: (((j - 1) * 48271) + depth) % 20183 ].
	grid at: 1 at: 1 put: depth % 20183.
	grid at: target y at: target x put: depth % 20183.
	grid
		withIndicesDo: [ :val :j :i | 
			val isNil
				ifTrue: [ grid at: j at: i put: (((grid at: j - 1 at: i) * (grid at: j at: i-1)) + depth) % 20183  ] ].
	grid withIndicesDo: [ :val :j :i | grid at: j at: i put: (val + depth) % 3 ]
]

{ #category : #accessing }
D22 >> depth [
	^ depth
]

{ #category : #accessing }
D22 >> depth: anObject [
	depth := anObject
]

{ #category : #accessing }
D22 >> grid [
	^ grid
]

{ #category : #accessing }
D22 >> grid: anObject [
	grid := anObject
]

{ #category : #parts }
D22 >> initClosedNodes [
	nodes := Dictionary new
]

{ #category : #parts }
D22 >> initOpenNodes [
	| node g h |
	open := Heap sortBlock: #f ascending.
	g := 0.
	h := 1 @ 1 manhattanDist: target.
	node := D22Node
		withPosition: 1 @ 1
		f: g
		h: h
		g: g
		tool: Tool torch.
	nodes at: node tool at: node position put: node.
	open add: node
]

{ #category : #parts }
D22 >> isPositionValid: aPoint [
	^ aPoint x > 0 and: [ aPoint y > 0 and: [ aPoint y <= grid numberOfRows and: [ aPoint x <= grid numberOfColumns ] ] ]
]

{ #category : #parts }
D22 >> part1 [
	| sum |
	self computeTypes.
	sum := 0.
	1 to: target x do: [ :i | 1 to: target y do: [ :j | sum := sum + (grid at: j at: i) ] ].
	^ sum
]

{ #category : #parts }
D22 >> part2 [
	| current |
	self initClosedNodes.
	self initOpenNodes.
	[ open isNotEmpty ]
		whileTrue: [ current := open removeFirst.
			(current position = target and: [ current tool = Tool torch ])
				ifTrue: [ ^ current g ].
			current closed: true.
			self processNeighbors: current ]
]

{ #category : #parts }
D22 >> processNeighbor: aPoint withTool: tool andParent: aNode andCost: anInt [
	| node g h type |
	(self isPositionValid: aPoint)
		ifFalse: [ ^ self ].
	node := nodes at: tool at: aPoint ifAbsent: [ nil ].
	(node isNotNil and: [ node closed ])
		ifTrue: [ ^ self ].
	type := grid at: aPoint y at: aPoint x.
	type = tool
		ifTrue: [ ^ self ].
	g := aNode g + anInt.
	node isNil
		ifTrue: [ h := aPoint manhattanDist: target.
			node := D22Node
				withPosition: aPoint
				f: g
				h: h
				g: g
				tool: tool
				parent: aNode.
			open add: node.
			nodes at: tool at: aPoint put: node ]
		ifFalse: [ g < node g
				ifTrue: [ open remove: node.
					node
						g: g;
						f: g;
						parent: aNode.
					open add: node ] ]
]

{ #category : #parts }
D22 >> processNeighbors: aNode [
	| currentPosition |
	currentPosition := aNode position.
	currentPosition fourNeighbors
		do: [ :position | 
			self
				processNeighbor: position
				withTool: aNode tool
				andParent: aNode
				andCost: 1 ].
	self processTool: aNode
]

{ #category : #parts }
D22 >> processTool: aNode [
	| type tool position |
	tool := aNode tool.
	position := aNode position.
	type := grid at: position y at: position x.
	tool := Tool switch: tool onType: type.
	self processNeighbor: position withTool: tool andParent: aNode andCost: 7.
	
]

{ #category : #accessing }
D22 >> target [
	^ target
]

{ #category : #accessing }
D22 >> target: anObject [
	target := anObject
]
