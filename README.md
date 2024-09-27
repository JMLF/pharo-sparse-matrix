# pharo-sparse-matrix
Pharo matrix package

## Getting the baseline :

```smalltalk
Metacello new
	repository: 'github://JMLF/pharo-sparse-matrix:main';
	baseline: 'Matrix';
	onConflictUseLoaded;
	load.
```


## Usage : 

Can either be SparseMatrix or Matric instance.
```smalltalk
matrix := Matrix rows: 3 columns: 3.
matrix atColumn: 1 atRow: 1  put: 1. 
matrix atColumn: 2 atRow: 1  put: 2.
matrix atColumn: 3 atRow: 1  put: 3.
matrix atColumn: 1 atRow: 2  put: 4.
matrix atColumn: 2 atRow: 2  put: 5.
matrix atColumn: 3 atRow: 2  put: 6.
matrix atColumn: 1 atRow: 3  put: 7.
matrix atColumn: 2 atRow: 3  put: 8.
matrix atColumn: 3 atRow: 3  put: 9.  

Transcript show: matrix; cr.
```

Convertion example :
```smalltalk
matrix := Matrix rows: 3 columns: 3.
matrix atColumn: 1 atRow: 1  put: 1. 
matrix atColumn: 2 atRow: 1  put: 2.
matrix atColumn: 3 atRow: 1  put: 3.
matrix atColumn: 1 atRow: 2  put: 4.
matrix atColumn: 2 atRow: 2  put: 5.
matrix atColumn: 3 atRow: 2  put: 6.
matrix atColumn: 1 atRow: 3  put: 7.
matrix atColumn: 2 atRow: 3  put: 8.
matrix atColumn: 3 atRow: 3  put: 9.  

Transcript show: matrix; cr.

"Display :"
"1 2 3"
"4 5 6"
"7 8 9"

sparseMatrix := matrix toSparseMatrix .
Transcript show: sparseMatrix; cr.

"Display :"
"1 2 3"
"4 5 6"
"7 8 9"

Transcript show: sparseMatrix elements size  .

"Display : 9"

sparseMatrix atColumn: 2 atRow: 1 put: 0.

Transcript show: sparseMatrix elements size  .

"Display : 8"

m := sparseMatrix toMatrix. 
Transcript show: m.

"Display :"
"1 0 3"
"4 5 6"
"7 8 9"

```

