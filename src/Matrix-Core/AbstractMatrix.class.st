"
Abstract Matrix class
"
Class {
	#name : 'AbstractMatrix',
	#superclass : 'Object',
	#instVars : [
		'rows',
		'columns'
	],
	#category : 'Matrix-Core',
	#package : 'Matrix-Core'
}

{ #category : 'accessing' }
AbstractMatrix >> atColumn: aColumn atRow: aRow [
	"Return the matrix element or a value stored in a specific row & column "
	self subclassResponsibility .
]

{ #category : 'accessing' }
AbstractMatrix >> atColumn: aColumn atRow: aRow put: aValue [
	"Store a matrix element or a value  in a specific row & column "
	self subclassResponsibility .
]

{ #category : 'accessing' }
AbstractMatrix >> columns [ 
	^columns
]

{ #category : 'accessing' }
AbstractMatrix >> columns: aColumnNumber [ 
	columns := aColumnNumber .
]

{ #category : 'printing' }
AbstractMatrix >> printOn: aStream [ 
"Pretty print the Matrix"
	self subclassResponsibility .
]

{ #category : 'accessing' }
AbstractMatrix >> rows [ 
	^rows
]

{ #category : 'accessing' }
AbstractMatrix >> rows: aRowNumber [ 
	rows := aRowNumber .
]

{ #category : 'accessing' }
AbstractMatrix >> size [ 
	^rows*columns 
]

{ #category : 'as yet unclassified' }
AbstractMatrix >> validateRow: rowIndex column: columnIndex [
"Check if the row and column index are in limits"
	(rowIndex between: 1 and: rows) ifFalse: [
		self error: 'Row index out of limit' ].
	(columnIndex between: 1 and: columns) ifFalse: [
		self error: 'Column index out of limit' ]
]
