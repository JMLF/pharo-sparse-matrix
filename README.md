# pharo-sparse-matrix
Pharo matrix package


## Usage : 

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
