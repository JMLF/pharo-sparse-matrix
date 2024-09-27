"
Array based matrix class.
"
Class {
	#name : 'Matrix',
	#superclass : 'AbstractMatrix',
	#instVars : [
		'data'
	],
	#category : 'Matrix-Core',
	#package : 'Matrix-Core'
}

{ #category : 'instance creation' }
Matrix class >> rows: aRowsNumber columns: aColumnNumber [

	^super new
	initializeZeroMatrixRows: aRowsNumber columns: aColumnNumber;
	yourself 
]

{ #category : 'instance creation' }
Matrix class >> rows: aRowsNumber columns: aColumnNumber value: aValue [

	^super new
	initializeValue: aValue rows: aRowsNumber columns: aColumnNumber;
	yourself 
]

{ #category : 'initialization' }
Matrix >> atColumn: columnIndex atRow: rowIndex [
"Access an element of the matrix"

	"We check if the requested element is in limit"
    self validateRow: rowIndex column: columnIndex.
    ^(data at: rowIndex) at: columnIndex
]

{ #category : 'initialization' }
Matrix >> atColumn: columnIndex atRow: rowIndex  put: value [ 
"Put a new value on a row & a column"
    self validateRow: rowIndex column: columnIndex.
    (data at: rowIndex) at: columnIndex put: value.
]

{ #category : 'accessing' }
Matrix >> data [ 

	^data
]

{ #category : 'initialization' }
Matrix >> initializeValue: aValue rows: rowsNumber columns: columnsNumber [ 

	rows := rowsNumber .
	columns := columnsNumber .
   data := Array new: rows.
    1 to: rows do: [:i |
        data at: i put: (Array new: columns withAll: aValue ).
    ].
    ^self
]

{ #category : 'initialization' }
Matrix >> initializeZeroMatrixRows: rowsNumber columns: columnsNumber [ 

	rows := rowsNumber .
	columns := columnsNumber .
   data := Array new: rows.
    1 to: rows do: [:i |
        data at: i put: (Array new: columns withAll: 0).
    ].
    ^self
]

{ #category : 'printing' }
Matrix >> printOn: aStream [
    "Print the matrix"
    1 to: rows do: [:i |
        1 to: columns do: [:j |
            aStream nextPutAll: (self atColumn: j atRow: i) asString.
            j < columns ifTrue: [aStream nextPutAll: ' ']. 
        ].
        aStream cr. 
    ].
]

{ #category : 'as yet unclassified' }
Matrix >> toSparseMatrix [
"Convert a matrix to a sparse matix"
    | sparseMatrix |
    sparseMatrix := SparseMatrix rows: rows columns: columns.
    1 to: rows do: [:i |
        1 to: columns do: [:j |
            | value |
            value := self atColumn: j atRow: i.
            value ~= 0 ifTrue: [
                sparseMatrix atColumn: j atRow: i put: value. 
            ].
        ].
    ].
    ^sparseMatrix
]
