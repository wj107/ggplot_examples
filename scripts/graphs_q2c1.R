
##############################################################################
#---graphs for data frame with 2 quantitative and 1 categorical variable
##############################################################################

#---required!!
require(ggplot2)
load("../sample_data/data_q2c1.RData")

#---create ggplot scale for x, y coordinates
X.scale<-scale_x_continuous(
    #--axis title
    name="Quantitative variable #1",
    #--labeled numeric breaks on axis (NULL for none)
    breaks=seq(-2,2,by=1),
    #--sub-breaks (indicated w/out label)
    minor_breaks=seq(-2,2,by=0.25),
    #--limits
    limits=c(-2,2)
    )

Y.scale<-scale_y_continuous(
    #--axis title
    name="Quantitative variable #2",
    #--labeled numeric breaks on axis (NULL for none)
    breaks=seq(-2,2,by=1),
    #--sub-breaks (indicated w/out label)
    minor_breaks=seq(-2,2,by=0.25),
    #--limits
    limits=c(-2,2)
    )

#---labels for graph
################how to format these???
base.labels<-labs(
    #---graph title
    title="Sample Data 1",
    #---subtitle
    subtitle="Data consists of two quantitative variables, one categorical variable."
    )

#---create base ggplot
base.plot<-ggplot(
    #---data frame!!
    dat,
    #---aesthetics: represent quantitative variables on x and y axes
    aes(
        #---x coordinate
        x=X,
        #---y coordinate
        y=Y
    )
)

#---add x,y scales
base.plot<-base.plot+
    #---x scale
    X.scale+
    #---y scale
    Y.scale

#---add base labels
base.plot<-base.plot+
    base.labels

#######################################
#---define basic graph from base plot
graph.base<-base.plot+
    #---add points
  geom_point(
        #---define fixed alpha
        alpha=0.5,
        #---define fixed size
        size=5
        )

######################################
#---adding color to the base plot
######################################

#---define colors for levels of categorical variable
Z.colors<-c(
        "A"="#FF0000",
        "B"="#00FF00",
        "C"="#0000FF"
    )


#---create ggplot scale for categorical variable
Z.scale<-scale_color_manual(
    #--colors as defined above
    values=Z.colors,
    #--how to group categorical data
    breaks=c("A","B","C"),
    #--labels on graph legend
    labels=c("Level A","Level B","Level C")
    )


#---create additional labels
labels.color<-labs(
    #---caption
    caption="Categorical variable represented by dot color",
    #---label for categorical legend
    color="Categorical Data"
    )

##########################################################
#---define graph with color aesthetic from base plot
graph.color<-base.plot+
    #---add points
    geom_point(
        #---define fixed alpha
        alpha=0.5,
        #---define fixed size
        size=5,
        #---add aesthetic for color
        aes(color=Z)
    )+
    #---add scale for colors
    Z.scale+
    #---add additional labels
    labels.color




######################################
#---adding size to the base plot
######################################

#---define sizes for levels of categorical variable
Z.sizes<-c(
        "A"=3,
        "B"=5,
        "C"=7
    )


#---create ggplot scale for categorical variable
Z.scale<-scale_size_manual(
    #--sizes as defined above
    values=Z.sizes,
    #--how to group categorical data
    breaks=c("A","B","C"),
    #--labels on graph legend
    labels=c("Level A","Level B","Level C")
    )


#---create additional labels
labels.size<-labs(
    #---caption
    caption="Categorical variable represented by dot size",
    #---label for categorical legend
    size="Categorical Data"
    )


##########################################################
#---define graph with size aesthetic from base plot
graph.size<-base.plot+
    #---add points
    geom_point(
        #---define fixed alpha
        alpha=0.5,
        #---define fixed color
        color="#000000",
        #---add aesthetic for size
        aes(size=Z)
    )+
    #---add scale for colors
    Z.scale+
    #---add additional labels
    labels.size

######################
#---save graphs!
######################

save(
      #---plots to save
      graph.base,
      graph.color,
      graph.size,
      #---output file
      file="../base_graphs/graphs_q2c1.RData"
       )

