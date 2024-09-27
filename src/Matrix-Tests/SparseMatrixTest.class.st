Class {
	#name : 'SparseMatrixTest',
	#superclass : 'TestCase',
	#category : 'Matrix-Tests',
	#package : 'Matrix-Tests'
}

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
