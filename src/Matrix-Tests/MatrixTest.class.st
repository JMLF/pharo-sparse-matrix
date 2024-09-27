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
MatrixTest >> testMatrixToSparseMatrix [
	"Test conversion from Matrix to SparseMatrix"

	| matrix sparseMatrix |
	matrix := Matrix rows: 3 columns: 3.
	matrix atColumn: 1 atRow: 1 put: 3.
	matrix atColumn: 2 atRow: 2 put: 5.
	matrix atColumn: 3 atRow: 3 put: 0.

	sparseMatrix := matrix toSparseMatrix.

	"SparseMatrix should contain only non-zero elements"
	self assert: (sparseMatrix atColumn: 1 atRow: 1) equals: 3.
	self assert: (sparseMatrix atColumn: 2 atRow: 2) equals: 5.
	self assert: (sparseMatrix atColumn: 3 atRow: 3) equals: 0.
	self assert: sparseMatrix elements size equals: 2
]

{ #category : 'tests' }
MatrixTest >> testOutOfBoundsAccess [ 
"Test out of limit access"
		  | matrix |
		  matrix := Matrix rows: 3 columns: 3. 
        self should: [matrix atColumn: 4 atRow: 4] raise: Error.
        self should: [matrix atColumn: 1 atRow: 4] raise: Error.
        self should: [matrix atColumn: 4 atRow: 1] raise: Error.
    
]

{ #category : 'tests' }
MatrixTest >> testSetAndGetElement [
	"Test setting and getting a specific element"

	| matrix |
	matrix := Matrix rows: 3 columns: 3.
	matrix atColumn: 2 atRow: 2 put: 10.
	self assert: (matrix atColumn: 2 atRow: 2) equals: 10.
	self assert: (matrix atColumn: 1 atRow: 1) equals: 0.
	self assert: (matrix atColumn: 3 atRow: 3) equals: 0
]

{ #category : 'tests' }
MatrixTest >> testUpdateMultipleElements [
	"Test updating multiple elements in the matrix"

	| matrix |
	matrix := Matrix rows: 3 columns: 3.
	matrix atColumn: 1 atRow: 1 put: 7.
	matrix atColumn: 3 atRow: 2 put: 9.
	self assert: (matrix atColumn: 1 atRow: 1) equals: 7.
	self assert: (matrix atColumn: 3 atRow: 2) equals: 9
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
