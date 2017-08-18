transpose.func <- function(mat){
  
  #find dimension of the given matrix
  dim_mat <- dim(mat)
  
  #creating empty transpose matrix
  t.mat <- matrix(data=NA,nrow = dim_mat[2], ncol=dim_mat[1])
  
  #looping through original matrix
  for (i in 1:nrow(mat)){
    for (j in 1:ncol(mat)){
      t.mat[j,i] <- mat[i,j] 
    }
  }
  return(t.mat)
}