addMat <- function(A, B){
  
  #empty matrix
  newMat <- matrix (data = NA, ncol = ncol(A), nrow = nrow(A))
  
  for (i in 1:nrow(A)){
    for (j in 1:ncol(A)){
      newMat[i,j] <- A[i,j] + B[i,j]
    }
  }
  
  return(newMat)
}