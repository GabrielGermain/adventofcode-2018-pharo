"
I'm a cube reprensented by my center and the length of my side
"
Class {
	#name : #Cube,
	#superclass : #Object,
	#instVars : [
		'center',
		'length',
		'nanobotCount'
	],
	#classVars : [
		'cubeCenters',
		'pointCenters'
	],
	#category : #'AdventOfCode2018-Day23'
}

{ #category : #initialization }
Cube class >> center: center length: length [
	^ self new center: center; length: length; yourself
]

{ #category : #initialization }
Cube class >> initialize [
	| point |
	cubeCenters := OrderedCollection new.
	#(-1 1)
		do: [ :x | 
			#(-1 1)
				do: [ :y | 
					#(-1 1)
						do: [ :z | 
							point := Point3D x: x y: y z: z.
							cubeCenters add: point ] ] ].
	pointCenters := OrderedCollection new.
	-1 to: 1 do: [ :x | 
		-1 to: 1 do: [ :y | 
			-1 to: 1 do: [ :z | 
				point := Point3D x: x y: y z: z.
				pointCenters add: point ] ] ].
	pointCenters remove: (Point3D x: 0 y: 0 z: 0)
]

{ #category : #comparing }
Cube >> >= other [
	self nanobotCount < other nanobotCount
		ifTrue: [ ^ false ].
	self nanobotCount > other nanobotCount
		ifTrue: [ ^ true ].
	self length > other length
		ifTrue: [ ^ false ].
	self length < other length
		ifTrue: [ ^ true ].
	self center manhattanDist > other center manhattanDist
		ifTrue: [ ^ false ].
	^ true
]

{ #category : #operations }
Cube >> allPoints [
	| halfLength bottom points |
	halfLength := length / 2.
	bottom := center - (Point3D x: halfLength y: halfLength z: halfLength).
	points := OrderedCollection new.
	0 to: length do: [ :x | 0 to: length do: [ :y | 0 to: length do: [ :z | points add: (Point3D x: bottom x + x y: bottom y + y z: bottom z + z) ] ] ].
	^ points
]

{ #category : #accessing }
Cube >> center [
	^ center
]

{ #category : #accessing }
Cube >> center: anObject [
	center := anObject
]

{ #category : #operations }
Cube >> countNanobotsInRange: nanobotList [
	nanobotCount := nanobotList count: [ :n | self isInRange: n ] 
]

{ #category : #operations }
Cube >> isInRange: aNanobot [
	| halfLength rangeDist |
	halfLength := length / 2.
	rangeDist := (self rangeDist: aNanobot pos x lo: center x - halfLength hi: center x + halfLength)
		+ (self rangeDist: aNanobot pos y lo: center y - halfLength hi: center y + halfLength)
		+ (self rangeDist: aNanobot pos z lo: center z - halfLength hi: center z + halfLength).
	^ rangeDist <= aNanobot r
]

{ #category : #operations }
Cube >> isInRangeBruteForce: aNanobot [
	^ self allPoints anySatisfy: [ :point | (point manhattanDist: aNanobot pos) <= aNanobot r  ]
	
]

{ #category : #operations }
Cube >> isInRangeWrong: aNanobot [
	^ (center manhattanDist: aNanobot pos) <= (length + aNanobot r)
]

{ #category : #accessing }
Cube >> length [
	^ length
]

{ #category : #accessing }
Cube >> length: anObject [
	length := anObject
]

{ #category : #accessing }
Cube >> nanobotCount [
	^ nanobotCount
]

{ #category : #accessing }
Cube >> nanobotCount: anObject [
	nanobotCount := anObject
]

{ #category : #operations }
Cube >> rangeDist: val lo: lo hi: hi [
	(val < lo) ifTrue: [ ^ lo - val ].
	(val > hi) ifTrue: [ ^ val - hi ].
	^ 0
]

{ #category : #operations }
Cube >> split [
	length > 2 ifTrue: [ ^self splitToCubes ].
	^ self splitToPoints.
]

{ #category : #operations }
Cube >> splitToCubes [
	| half subCenter |
	half := length / 2.
	^ cubeCenters
		collect: [ :p | 
			subCenter := (p scaleByInt: half) + center.
			Cube center: subCenter length: half ]
]

{ #category : #operations }
Cube >> splitToPoints [
	| subCenter |
	^ pointCenters
		collect: [ :p | 
			subCenter := p + center.
			Cube center: subCenter length: 0 ]
]
