## Refer to README.md to invoke the following functions
## Below are two functions that are used to create a special object 
## that stores a numeric matrix and caches its inverse.

## This function creates a special "matrix" object, that 
## can cache its inverse
makeCacheMatrix <- function(my_matrix = matrix()) {
	## Initialize the inverse matrix
    inverse_matrix <- NULL

    ## Function to set the matrix
    setMatrix <- function(matrix) {
		my_matrix <<- matrix
		inverse_matrix <<- NULL
    }

    ## Function the get the matrix
    getMatrix <- function() {
    	my_matrix
    }

    ## Function to set the inverse of the matrix
    setInverseMatrix <- function(inverse) {
        inverse_matrix <<- inverse
    }

    ## Function to get the inverse of the matrix
    getInverseMatrix <- function() {
        inverse_matrix
    }

    ## Return a list of the functions and their names
    list(setMatrix = setMatrix, getMatrix = getMatrix, 
		setInverseMatrix = setInverseMatrix, 
		getInverseMatrix = getInverseMatrix)
}

## This function computes the inverse of the special "matrix" 
## returned by `makeCacheMatrix` above. If the inverse has
## already been calculated (and the matrix has not changed), 
## then `cacheSolve` should retrieve the inverse from the cache.
cacheSolve <- function(my_matrix, ...) {
	## Get the inverse of the matrix
    inverse_matrix <- my_matrix$getInverse()

    ## Return the inverse of the matrix if it is already set
    if( !is.null(inverse_matrix) ) {
		message("getting the inverse of the matrix from cache")
		return(inverse_matrix)
    }

    ## Get the matrix
    data <- my_matrix$get()	

    ## Calculate the inverse of the matrix
    inverse_matrix <- solve(data)

    ## Set the inverse of the matrix
    my_matrix$setInverse(inverse_matrix)

    ## Return the inverse of the matrix
    inverse_matrix
}
