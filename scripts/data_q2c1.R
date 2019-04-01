
#########################################################################
#---generate random data: 2 quantitative, 1 categorical variable
#########################################################################

#---number of points
N<-1e3

#---generate X and Y coordinates, using random normal distribution
X<-rnorm(N,0,1)
Y<-rnorm(N,0,1)

#---random prob distrib 'orphan function'
dist_vec<-function(
    #---argument: how many dimensions is the vector?
    n
){
    #---create random vector of dimension n
    runif(n,0,1)->v
    #---represent as proportions
    v<-v/sum(v)
    #---output
    v
}


#---define the names and distribution of categorical variable
    #---three levels
    Z.names<-c("A","B","C")
    #---distribution for categorical variable
    Z.dist<-dist_vec(3)

#---create categorical variable
Z<-factor(sample(Z.names,N,replace=T,Z.dist))

#---create data frame
dat<-data.frame(X,Y,Z)

#---save and preview!!
save(dat,file="../sample_data/data_q2c1.RData")
head(dat,11)
