"
Day23
Solution for part2 largely inspired by: https://raw.githack.com/ypsu/experiments/master/aoc2018day23/vis.html
"
Class {
	#name : #D23,
	#superclass : #AOC18Base,
	#instVars : [
		'nanobots',
		'queue'
	],
	#classVars : [
		'Matcher'
	],
	#category : #'AdventOfCode2018-Day23'
}

{ #category : #initialize }
D23 class >> initialize [
	Matcher := RxMatcher forString: 'pos=<(-?\d+),(-?\d+),(-?\d+)>, r=(\d+)'
]

{ #category : #parts }
D23 >> findSearchCubeSize [
	| max size |
	max := (nanobots flatCollect: [ :n | OrderedCollection with: n pos x abs with: n pos y abs with: n pos z abs ]) max.
	size := 2.
	[ size < max ] whileTrue: [ size := size * 2 ].
	^ size
]

{ #category : #parts }
D23 >> init [
	nanobots := lines collect: [ :l | self parseLine: l ].
]

{ #category : #parts }
D23 >> initQueue [
	| size cube |
	queue := Heap sortBlock: [ :c1 :c2 | c1 >= c2 ].
	size := self findSearchCubeSize.
	cube := Cube center: (Point3D x: 0 y: 0 z: 0) length: size.
	cube countNanobotsInRange: nanobots.
	queue add: cube
]

{ #category : #parsing }
D23 >> parseLine: aLine [
	| x y z r point |
	Matcher matches: aLine.
	x := (Matcher subexpression: 2) asInteger.
	y := (Matcher subexpression: 3) asInteger.
	z := (Matcher subexpression: 4) asInteger.
	r := (Matcher subexpression: 5) asInteger.
	point := Point3D x: x y: y z: z.
	^ Nanobot pos: point r: r
]

{ #category : #parts }
D23 >> part1 [
	| nanobotMax |
	self init.
	nanobotMax := nanobots detectMax: [ :n | n r ].
	^ nanobots
		count: [ :n | (n pos manhattanDist: nanobotMax pos) <= nanobotMax r ]
]

{ #category : #parts }
D23 >> part2 [
	| current |
	self init.
	self initQueue.
	[ queue isEmpty ]
		whileFalse: [ current := queue removeFirst.
			current length = 0
				ifTrue: [ ^ current center manhattanDist ].
			self splitCube: current ].
	^ nil
]

{ #category : #parts }
D23 >> splitCube: cube [
	| newCubes |
	newCubes := cube split.
	newCubes do: [ :c | c countNanobotsInRange: nanobots ].
	newCubes := newCubes select: [ :c | c nanobotCount > 0 ].
	queue addAll: newCubes
]
