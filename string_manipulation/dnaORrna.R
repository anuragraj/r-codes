dnaORrna <- function(sequence){
	#-------
	sequence <- toupper(sequence)
	#-------
	#sequence <- 'ATGC'
	nuc <- strsplit(sequence, split='')[[1]]
	if (length(nuc) == 0){
		stop("No sequence is given!!!")
	}
	#-------
	conflictSeq <- intersect(c('T','U'),nuc)
	if(length(conflictSeq) == 0){
		output <- 'DNA or RNA'
	}else{
		#check for U
		rna <- length(which(nuc == "U"))
		if(rna >= 1){
			output <- 'RNA'
			rna.nuc <- c('A','U','G','C')
			if(length(setdiff(nuc,rna.nuc))==0){
				output <- 'RNA'
			}else{
				output <- 'The given sequence is not correct.'
			}
		}else{
			dna.nuc <- c('A','T','G','C')
			if(length(setdiff(nuc,dna.nuc))==0){
				output <- 'DNA'
			}else{
				output <- 'The given sequence is not correct.'
			}
		}
	}
	return(output)
}