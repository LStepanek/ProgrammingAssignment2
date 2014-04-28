The following two functions were performed in order to save computional and time complexity. The first function
calls back itself in its body and saves an input argument, matrix, into memory as a variable (x). The second
function is an assistant function that uses the first function (calls it in its body) and detects if the input of
the second function has been known for the first one. If yes, then it returns simply an output, which the first
function has already computed (it is very fast and saves the both computional and time complexity as was mentioned
above). If not, the second function calls back the first one (the one actually computes the result) and then the
second function returns the expected output on its own.


The first function takes an argument x of type matrix (with numeric values) and returns a list containing four
list items: makeCacheMatrix(Matrix)$set(myMatrix) saves myMatrix as argument, makeCacheMatrix(myMatrix)$get()
returns the myMatrix. The value myMatrix is saved (cached) in memory as a variable x. All other computations are
performed with the x variable. The inverse of an input matrix is computed in a body of the first function.


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) m <<- solve
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


The second function calls the first function makeCacheMatrix, particularly x$getInverse function. If the
x$getInverse is non empty, it happens in case the input matrix of the second function (argument x) and its inverse
is known for the first function makeCacheMatrix, the computation does not start, the message "getting cached data"
is printed and the expected output, already computed by the first function, is returned by the second function
cacheSolve. In case the x$getInverse is empty, it means the input matrix of the second function (argument x) and
its inverse is NOT known for the first function makeCacheMatrix, the first function is called and computes the
output (inverse of the input matrix), printed by the second function.


cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
}

##
