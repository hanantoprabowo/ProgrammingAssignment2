### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly. Your assignment is to write a pair of functions that
cache the inverse of a matrix.

### Example: Caching the Inverse of a Matrix

Below are two functions that are used to create a
special object that stores a numeric matrix and caches its inverse.

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

For this assignment, assume that the matrix supplied is always
invertible.

### How to: Invoking the Functions

```
# read the R script
# replace the "path/to/file" with the directory you save the file into
> source("path/to/file/cachematrix.R")

# create the matrix using `makeCacheMatrix`
> my_matrix <- makeCacheMatrix(matrix(c(1,2,3,4), nrow = 2, ncol = 2));

# show the summary of the created matrix
> summary(my_matrix)
                 Length Class  Mode    
setMatrix        1      -none- function
getMatrix        1      -none- function
setInverseMatrix 1      -none- function
getInverseMatrix 1      -none- function

# show the created matrix
> my_matrix$getMatrix()
     [,1] [,2]
[1,]    1    3
[2,]    2    4

# compute the inverse of the created matrix and cache it
> cacheSolve(my_matrix)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

# if the inverse has already been calculated (and the matrix has not 
# changed), invoking the `cacheSolve` the second time should retrieve 
# the inverse from the cache.
> cacheSolve(my_matrix)
getting the inverse of the matrix from cache
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
```