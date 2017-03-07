## The first function, 'makeCacheMatrix' creates a special "matrix" object that can cache its inverse.
## It contains the following functions:
## set -  sets the value of a matrix
## get - gets the value of a matrix
## setInverse - sets the cached value of the inverse of the matrix
## getInverse - gets the cached value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
cache <-NULL

  ##Stores the matrix
  setMatrix <-function(newInverse){
    x<<-newInverse
    ##As there is a new value, the cache is flushed
    cache<<-NULL
  }

  ##Gets the cached Matrix
  getMatrix<funcion(){
    x
  }

  ##Sets the cached value of the inverse of the matrix
  setInverse <-function(solve) {
    cache<<-solve
  }

  getInverse<-function(){
    cache
  }
  
  list(setMatrix=setMatrix, getMatrix=getMAtrix, setInverse=setInverse, getInverse=getInverse)
}


## The following function calculates the inverse of the special matrix created with the above function, However, 
##it first checks to see if the inverse has already been calculated.  If so, it returns the inverse 
##from the cache and skips the computation.  Otherwise, it calculates the inverse of the matrix and sets the 
##inverse of the matrix in the cache via the setInverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  ## gets the cached value of the inverse of the matrix      
  Inverse <-x$getInverse()
  
  ##If the value is cached, it will be returned
  if(!is.null(Inverse)){
    message("getting cached data")
    return(Inverse)
  }
  ##If the value is not in the cache, it is calculated and then stored in the cache
  data<-x$getMatrix()
  Inverse <-solve(data)
  x$setInverse(Inverse)
  
  ##Returns the Inverse
  Inverse
}
