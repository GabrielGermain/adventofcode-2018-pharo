"
AdventOfCode2018 Day4 Main class

AOC1804Main part1: 'E:/Gabriel_2/Work/AOC2018/Day4/input.txt'
AOC1804Main part2: 'E:/Gabriel_2/Work/AOC2018/Day4/input.txt'
"
Class {
	#name : #AOC1804Main,
	#superclass : #AOC18Base,
	#category : #'AdventOfCode2018-Day4'
}

{ #category : #parts }
AOC1804Main >> part1 [
	| groups guards currentGroup sleepTimes maxSleep maxSchedule minute |
	lines sort.
	groups := OrderedCollection new.
	currentGroup := OrderedCollection new.
	lines
		do: [ :each | 
			(each includesSubstring: 'Guard')
				ifTrue: [ currentGroup ifNotEmpty: [ groups add: currentGroup ].
					currentGroup := OrderedCollection new ].
			currentGroup add: each ].
	currentGroup ifNotEmpty: [ groups add: currentGroup ].
	guards := groups collect: [ :group | AOC1804Guard buildScheduleFrom: (group collect: [ :line | AOC1804Event fromLine: line ]) ].
	groups := guards groupedBy: [ :guard | guard id ].
	sleepTimes := groups collect: [ :group | (group collect: [ :guard| guard sleepTime ]) sum ].
	maxSleep := sleepTimes associations detectMax: [ :pair | pair value ].
	maxSchedule := ((groups at: maxSleep key) collect: [ :guard | guard schedule ]) sum.
	minute := (maxSchedule indexOf: (maxSchedule max)) -1.
	^ minute * maxSleep key
]

{ #category : #parts }
AOC1804Main >> part2 [
	| groups guards currentGroup maxByGuard guardMax minute |
	lines sort.
	groups := OrderedCollection new.
	currentGroup := OrderedCollection new.
	lines
		do: [ :each | 
			(each includesSubstring: 'Guard')
				ifTrue: [ currentGroup ifNotEmpty: [ groups add: currentGroup ].
					currentGroup := OrderedCollection new ].
			currentGroup add: each ].
	currentGroup ifNotEmpty: [ groups add: currentGroup ].
	guards := groups collect: [ :group | AOC1804Guard buildScheduleFrom: (group collect: [ :line | AOC1804Event fromLine: line ]) ].
	groups := guards groupedBy: [ :guard | guard id ].
	groups := groups collect: [ :item | (item collect: [ :guard | guard schedule ]) sum ].
	maxByGuard := groups collect: [ :item | item max ].
	guardMax := maxByGuard associations detectMax: [ :pair | pair value ].
	minute := ((groups at: guardMax key) indexOf: guardMax value) - 1.
	^ minute * guardMax key
]
