dnaCount.func <- function(DNA){ 
	dna.split<- strsplit(DNA, split='')
	dna.split.v <- dna.split[[1]]

	nuc <- c('A','T','G','C')

	#empty vector
	nuc.count <- c()

	for ( pos in 1:4){
		output <- dna.split.v == nuc[pos]
		pos.nuc <- which(output)
		count.nuc <- length(pos.nuc)
		nuc.count[pos] <- count.nuc
	}

	names(nuc.count) <- nuc
	#print(nuc.count)
	return(nuc.count)
}
