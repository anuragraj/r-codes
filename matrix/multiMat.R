multiMat <- function(mat, multi){
	nRow <- nrow(mat)
	nCol <- ncol(mat)

	# empty matrix
	newMat <- matrix(data = NA, ncol = ncol(mat), nrow = nrow(mat))

	for(Row in 1:nRow){
		for(Col in 1:nCol){
			newMat[Row, Col] <- mat[Row, Col] * multi
		}
	}
	return(newMat)
}