multiplicationMat <- function(A,B){
	nRow <- nrow(A)
	nCol <- ncol(B)
	nInner <- ncol(A)

	# empty matrix
	newMat <- matrix(data = NA, ncol = nRow, nrow = nCol)

	for(Row in 1:nRow){
		for(Col in 1:nCol){
			sum = 0
			for (inner in 1:nInner){
				sum = sum + (A[Row,inner]*B[inner,Col])
			}
			newMat[Row, Col] <- sum 
		}
	}
	return(newMat)

}
