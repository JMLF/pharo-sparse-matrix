Class {
	#name : 'MatrixElementTest',
	#superclass : 'TestCase',
	#category : 'Matrix-Tests',
	#package : 'Matrix-Tests'
}

{ #category : 'tests' }
MatrixElementTest >> testInstanceCreationWithParameters [

	| element |
	element := MatrixElement row: 1 column: 1 value: 42.
	
	self assert: element row equals: 1.
	self assert: element column equals: 1.
	self assert: element value equals: 42.
]

{ #category : 'tests' }
MatrixElementTest >> testNewlyCreatedElementColumnShouldBeNil [

	self assert: MatrixElement new column isNil. 
]

{ #category : 'tests' }
MatrixElementTest >> testNewlyCreatedElementRowShouldBeNil [

	self assert: MatrixElement new row isNil. 
]

{ #category : 'tests' }
MatrixElementTest >> testNewlyCreatedElementValueShouldBeNil [

	self assert: MatrixElement new value isNil. 
]

{ #category : 'tests' }
MatrixElementTest >> testValueSetter [

	| element |
	element := MatrixElement new.
	element value: 42.
	
	self assert: element value equals: 42.
]
