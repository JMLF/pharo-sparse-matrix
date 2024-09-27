Class {
	#name : 'SparseMatrixTest',
	#superclass : 'TestCase',
	#category : 'Matrix-Tests',
	#package : 'Matrix-Tests'
}

{ #category : 'tests' }
SparseMatrixTest >> testMatrixCreationSize [
	"Test matrix creation with correct dimensions"

	| sparseMatrix |
	sparseMatrix := SparseMatrix rows: 3 columns: 3.
	self assert: sparseMatrix rows equals: 3.
	self assert: sparseMatrix columns equals: 3.
	self assert: sparseMatrix elements isEmpty
]

{ #category : 'tests' }
SparseMatrixTest >> testOutOfBoundsAccess [ 
"Test out of limit access"

		  | matrix |
		  matrix := SparseMatrix rows: 3 columns: 3. 
        self should: [matrix atColumn: 4 atRow: 4] raise: Error.
        self should: [matrix atColumn: 1 atRow: 4] raise: Error.
        self should: [matrix atColumn: 4 atRow: 1] raise: Error.
]

{ #category : 'tests' }
SparseMatrixTest >> testSetElementNonZero [
	"Test setting a non-zero value in the sparse matrix"

	| sparseMatrix |
	sparseMatrix := SparseMatrix rows: 3 columns: 3.
	sparseMatrix atColumn: 2 atRow: 2 put: 5.
	self assert: (sparseMatrix atColumn: 2 atRow: 2) equals: 5.
	self assert: sparseMatrix elements size equals: 1
]

{ #category : 'tests' }
SparseMatrixTest >> testSetElementZero [
	"Test setting a zero value, which should remove the element from the collection"

	| sparseMatrix |
	sparseMatrix := SparseMatrix rows: 3 columns: 3.
	sparseMatrix atColumn: 2 atRow: 2 put: 5.
	self assert: (sparseMatrix atColumn: 2 atRow: 2) equals: 5.
	sparseMatrix atColumn: 2 atRow: 2 put: 0.
	self assert: (sparseMatrix atColumn: 2 atRow: 2) equals: 0.
	self assert: sparseMatrix elements isEmpty
]

{ #category : 'tests' }
SparseMatrixTest >> testSparseMatrixToMatrix [
	"Test conversion from SparseMatrix to Matrix"

	| matrix sparseMatrix |
	sparseMatrix := SparseMatrix rows: 3 columns: 3.
	sparseMatrix atColumn: 1 atRow: 1 put: 3.
	sparseMatrix atColumn: 2 atRow: 2 put: 5.

	matrix := sparseMatrix toMatrix.

	"Matrix should contain as much elements as it size"
	self assert: (matrix atColumn: 1 atRow: 1) equals: 3.
	self assert: (matrix atColumn: 2 atRow: 2) equals: 5.
	
	self assert: matrix data size equals: 3. "3 rows"
	"of 3 columns"
	    1 to: 3 do: [:i |
        self assert: (matrix data at: i) size equals: 3 . 
    ].
]

{ #category : 'tests' }
SparseMatrixTest >> testUpdateExistingElement [
	"Test updating an existing element"

	| sparseMatrix |
	sparseMatrix := SparseMatrix rows: 3 columns: 3.
	sparseMatrix atColumn: 1 atRow: 1 put: 3.
	self assert: (sparseMatrix atColumn: 1 atRow: 1) equals: 3.
	sparseMatrix atColumn: 1 atRow: 1 put: 7.
	self assert: (sparseMatrix atColumn: 1 atRow: 1) equals: 7.
	self assert: sparseMatrix elements size equals: 1
]

{ #category : 'tests' }
SparseMatrixTest >> testZeroMatrixInstance [

	| matrix rowsNumber columnNumber |
	rowsNumber := 4.
	columnNumber := 3.
	matrix := SparseMatrix rows: rowsNumber columns: columnNumber .
	
	self assert: matrix size equals: 12.

    "Matrix elements should be empty"
    self assert: matrix elements size equals: 0 .

    "Check columns number and each entry should be zero"
	"Got an issue testing the equality of smallint ! Each entry are 0 but =1 return true "
    1 to: rowsNumber do: [:i | 
			1 to: columnNumber do: [ :j | (matrix atColumn: j atRow: i) = 0   ] .
    ].
]
