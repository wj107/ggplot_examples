
######################################################
#---generate random data: 3 quantitative variables
######################################################

#---number of points
N<-1e3

#---generate X and Y coordinates, using random normal distribution
X<-rnorm(N,0,1)
Y<-rnorm(N,0,1)
Z<-rnorm(N,0,1)


#---create data frame
dat<-data.frame(X,Y,Z)

#---save and preview!!
save(dat,file="../sample_data/data_q3c0.RData")
head(dat,11)
