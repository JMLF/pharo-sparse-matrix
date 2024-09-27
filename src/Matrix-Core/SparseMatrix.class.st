"
MatrixElement based matrix representation
"
Class {
	#name : 'SparseMatrix',
	#superclass : 'AbstractMatrix',
	#instVars : [
		'elements'
	],
	#category : 'Matrix-Core',
	#package : 'Matrix-Core'
}

{ #category : 'instance creation' }
SparseMatrix class >> rows: aRowsNumber columns: aColumnNumber [

	^super new
	initializeWithRows: aRowsNumber columns: aColumnNumber;
	yourself 
]

{ #category : 'accessing' }
SparseMatrix >> atColumn: columnIndex  atRow: rowIndex [ 
"Return the value of an element at column & row index if element doesn't exist return 0"
    | element |
	self validateRow: rowIndex column: columnIndex.
    
    element := self elementAtColumn: columnIndex atRow: rowIndex.
    ^element ifNil: [0] ifNotNil: [element value]
]

{ #category : 'accessing' }
SparseMatrix >> atColumn: columnIndex atRow: rowIndex put: value [
"Set an elements at column & row index, if the value is 0 doesn't store anything"
    | element |
self validateRow: rowIndex column: columnIndex.

    element := self elementAtColumn: columnIndex atRow: rowIndex.
    value ~= 0 ifTrue: [
        element ifNil: [
            "create a MatrixElement"
            element := MatrixElement row: rowIndex column: columnIndex value: value.
            elements add: element.
        ] ifNotNil: [
            "Update existing element"
            element value: value.
        ].
    ] ifFalse: [
        "If the value is 0 we shoul either not store the element or delete the existaing one"
        element ifNotNil: [
            elements remove: element.
        ].
    ].
]

{ #category : 'as yet unclassified' }
SparseMatrix >> elementAtColumn: columnIndex atRow: rowIndex [
    ^elements detect: [:e | e row = rowIndex and: [e column = columnIndex]] ifNone: [nil]
]

{ #category : 'accessing' }
SparseMatrix >> elements [ 
	^elements
]

{ #category : 'initialization' }
SparseMatrix >> initializeWithRows: rowCount columns: columnCount [
    rows := rowCount.
    columns := columnCount.
    elements := OrderedCollection new.
    
]

{ #category : 'printing' }
SparseMatrix >> printOn: aStream [
    "Print the matrix"
    1 to: rows do: [:i |
        1 to: columns do: [:j |
            aStream nextPutAll: (self atColumn: j atRow: i) asString.
            j < columns ifTrue: [aStream nextPutAll: ' ']. 
        ].
        aStream cr. 
    ].
]
