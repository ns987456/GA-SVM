library(SKAT)
data(SKAT.example)

attach(SKAT.example)
head(SKAT.example$Z)
SKAT.example$X
SKAT.example$y.c
SKAT.example$y.b

dim(SKAT.example$Z)
dim(SKAT.example$X)
length(SKAT.example$y.c)
length(SKAT.example$y.b)
y=as.data.frame(SKAT.example$y.c)
head(y)


z=as.data.frame(SKAT.example$Z)
head(z)
max(SKAT.example$y.c); min(SKAT.example$y.c)
 
Y<- as.factor(ifelse(y$V1< -1, -1, 
              ifelse (y$V1< 1, 0,
              ifelse (y$V1<4, 1, 0 ))))
datame=cbind(z, Y)
head(datame)


write.csv(datame,file = "C:/Users/HN/Desktop/MyNewFile.csv")

capture.output(datame, file = "C:/Users/HN/Desktop/My New File.txt")


