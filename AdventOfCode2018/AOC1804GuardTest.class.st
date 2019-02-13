"
Test
"
Class {
	#name : #AOC1804GuardTest,
	#superclass : #TestCase,
	#category : #'AdventOfCode2018-Day4'
}

{ #category : #tests }
AOC1804GuardTest >> testCreation [
	| guard events |
	events := { '[1518-11-01 00:00] Guard #10 begins shift' . '[1518-11-01 00:05] falls asleep' . '[1518-11-01 00:25] wakes up'. '[1518-11-01 00:30] falls asleep' .'[1518-11-01 00:55] wakes up' } collect: [ :line | AOC1804Event fromLine: line ].
	guard := AOC1804Guard buildScheduleFrom: events
]
