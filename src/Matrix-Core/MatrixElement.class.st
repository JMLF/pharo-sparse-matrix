"
Matrix element class. Represent an instance of a matrix element with his row and column id and the value.
"
Class {
	#name : 'MatrixElement',
	#superclass : 'Object',
	#instVars : [
		'row',
		'column',
		'value'
	],
	#category : 'Matrix-Core',
	#package : 'Matrix-Core'
}

{ #category : 'as yet unclassified' }
MatrixElement class >> row: aRow column: aColumn value: aValue [  

	^ self new
			row: aRow;
			column: aColumn;   
			value: aValue;
		  yourself	
]

{ #category : 'accessing' }
MatrixElement >> column [ 
	^column 
]

{ #category : 'accessing' }
MatrixElement >> column: aColumn [ 
	column := aColumn 
]

{ #category : 'accessing' }
MatrixElement >> row [ 
	^row 
]

{ #category : 'accessing' }
MatrixElement >> row: aRow [ 
	row := aRow 
]

{ #category : 'accessing' }
MatrixElement >> value [ 
	^value 
]

{ #category : 'accessing' }
MatrixElement >> value: aValue [ 
	value := aValue. 
]
