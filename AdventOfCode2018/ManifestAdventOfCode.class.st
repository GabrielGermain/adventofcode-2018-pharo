"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAdventOfCode,
	#superclass : #PackageManifest,
	#category : #'AdventOfCode2018-Manifest'
}

{ #category : #'code-critics' }
ManifestAdventOfCode class >> ruleRBCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#D7 #initGrid #false)) #'2018-12-09T15:01:28.677412+01:00') )
]
