x <- 0
y <- 0
plot(-4:4, -4:4, type =  "n")

#color vector
mycol <- rgb(0, 1, 0, 0.5)
#rgb(red, green, blue, alpha)

#intializing the walk
points(x, y, pch = 21, bg = par("bg") , col = sample(rainbow(25),size = 1))

#randomizing the walk
for(i in 1:100){
  direction <- sample(c(0,1,2,3), size = 1)
  if ( direction == 0){
    x <- x + 0.1
  }else if ( direction == 1){
    x <- x - 0.1
  }else if ( direction == 2){
    y <- y + 0.2
  }else if ( direction == 3){
    y <- y - 0.2
  }
  
  #reintializing
  if(x > 4 || x < -4){
    x <- 0
  }
  if(y > 4 || y < -4){
    y <- 0
  }
  
  points(x, y, pch = 21, bg = par("bg"), col= sample(rainbow(25),size = 1))
  Sys.sleep(0.05)
}

