## Below are two functions that are used to create a special object that stores a matrix and 
## cache's its inverse.


## makeCacheMatrix creates a special "matrix", which is really a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  i<- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## The following function calculates the inverse matrix of the special "matrix" created 
## with the above function. However, it first checks to see if the inverse matrix has 
## already been calculated. If so, it gets the inverse matrix from the cache and skips
## the computation. Otherwise, it calculates the inverse matrix of the data and sets the 
## value of the inverse matrix in the cache via the setinv function.

cacheSolve <- function(x, ...) {
  i <- x$getinv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinv(i)
  i
}
