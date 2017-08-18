is_na.func <- function(mat){
	for(i in 1:nrow(mat)){
	  for (j in 1:ncol(mat)){
	    if(is.na(mat[i,j])==TRUE){
	      print(paste('row = ',i))
	      print(paste('column = ',j))
	    }
	  }
	}
}
