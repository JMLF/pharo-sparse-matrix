Class {
	#name : 'MatrixTest',
	#superclass : 'TestCase',
	#category : 'Matrix-Tests',
	#package : 'Matrix-Tests'
}

{ #category : 'tests' }
MatrixTest >> testAccessToAnElement [

	| matrix rowsNumber columnNumber |
	rowsNumber := 4.
	columnNumber := 3.
	matrix := Matrix rows: rowsNumber columns: columnNumber .
	  
    self assert: (matrix atColumn: 3 atRow: 1) equals: 0 .

]

{ #category : 'tests' }
MatrixTest >> testChangeAnElement [

	| matrix rowsNumber columnNumber |
	rowsNumber := 4.
	columnNumber := 3.
	matrix := Matrix rows: rowsNumber columns: columnNumber .
	
	matrix atColumn: 2 atRow: 2  put: 42. 
	  
	
    self assert: (matrix atColumn: 2 atRow: 2) equals: 42 .

]

{ #category : 'tests' }
MatrixTest >> testValueMatrixInstance [

	| matrix rowsNumber columnNumber |
	rowsNumber := 3.
	columnNumber := 3.
	matrix := Matrix rows: rowsNumber columns: columnNumber value: 1 .
	
	self assert: matrix size equals: 9.

    "Matrix data should have the right number of rows"
    self assert: matrix data size equals: rowsNumber .

    "Check columns number and each entry should be zero"
    1 to: rowsNumber do: [:i |
        self assert: (matrix data at: i) size equals: columnNumber .
        self assert: ((matrix data at: i) allSatisfy: [:value | value = 1]).
    ].
]

{ #category : 'tests' }
MatrixTest >> testZeroMatrixInstance [

	| matrix rowsNumber columnNumber |
	rowsNumber := 4.
	columnNumber := 3.
	matrix := Matrix rows: rowsNumber columns: columnNumber .
	
	self assert: matrix size equals: 12.

    "Matrix data should have the right number of rows"
    self assert: matrix data size equals: rowsNumber .

    "Check columns number and each entry should be zero"
    1 to: rowsNumber do: [:i |
        self assert: (matrix data at: i) size equals: columnNumber .
        self assert: ((matrix data at: i) allSatisfy: [:value | value = 0]).
    ].
]
