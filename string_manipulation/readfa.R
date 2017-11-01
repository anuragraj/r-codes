
con <- file('./test.fa','r', blocking=FALSE)
#----
myContents <- c()
#----
content <- 1
i <- 1
while(content != 0){
  Lines <- readLines(con, n=1)
  if(length(Lines) != 0){
    myContents[i] <- Lines
    i <- i+1 
  }else{
    content <- 0
  }
}
close(con)

#----
fastaHeaders <- grep('>', myContents)
Seqs <- list()
for(i in seq_along(fastaHeaders)){
  if(i != length(fastaHeaders)){
    # for all seq except last
    Seqs[[i]] <- myContents[fastaHeaders[i]:(fastaHeaders[i+1]-1)]
  }else{
    # for last seq
    Seqs[[i]] <- myContents[fastaHeaders[i]:length(myContents)]
  }
}

#------
seq.list <- list()
for(i in seq_along(Seqs)){
  seq.list[[i]] <- list(header = Seqs[[i]][1], 
                     sequence = gsub("T","U",paste(Seqs[[i]][-1],collapse = "")))
}


#-----
aaseq <- list()
for(i in seq_along(seq.list)){
  aasequence <- c()
  seq.len <- nchar(seq.list[[i]]["sequence"])
  j <- 1
  for (posStart in seq(1,(seq.len-2),3)){
    posStop = posStart+2
    aabase <- substr(seq.list[[i]]["sequence"],posStart,posStop)
    aasequence[j] <- aabase
    j <- j+1
  }
  aaseq[[i]] <- list(header = seq.list[[i]][[1]],
                     sequence = aasequence)
}
#print(aaseq)

#-----
proline <- c('CCA','CCG','CCC','CCU')
proline.freq <- list()
for(i in seq_along(aaseq)){
  codons <- aaseq[[i]][["sequence"]]
  proline.freq[[i]] <- table(codons %in% proline)
}