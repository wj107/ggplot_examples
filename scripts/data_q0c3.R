
#######################################################
#---generate random data: 3 categorical variables
#######################################################

#---number of points
N<-1e3

#---name the factors
    #---first factor: 3 groups
    f1.name<-c("1","2","3")
    #---second factor: 2 groups
    f2.name<-c("A","B")
    #---third factor: 5 groups
    f3.name<-c("1","2","3","4","5")

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


#---distribution of the factors
    f1.dist<-dist_vec(3)
    f2.dist<-dist_vec(2)
    f3.dist<-dist_vec(5)

#---sample each of the three factors, create data frame
dat<-data.frame(
    X=factor(sample(f1.name,N,replace=T,f1.dist)),
    Y=factor(sample(f2.name,N,replace=T,f2.dist)),
    Z=factor(sample(f3.name,N,replace=T,f3.dist))
)

#---save and preview!!
save(dat,file="../sample_data/data_q0c3.RData")
head(dat,11)
