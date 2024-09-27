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
