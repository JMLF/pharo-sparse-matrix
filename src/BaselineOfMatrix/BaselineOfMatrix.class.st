Class {
	#name : 'BaselineOfMatrix',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMatrix',
	#package : 'BaselineOfMatrix'
}

{ #category : 'baselines' }
BaselineOfMatrix >> baseline: spec [

	<baseline>

	spec
		package: 'Matrix-Core';
		package: 'Matrix-Tests'
		with: [ spec requires: #( 'Matrix-Core' ) ]
]
