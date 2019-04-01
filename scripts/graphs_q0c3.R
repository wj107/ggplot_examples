
############################################################
#---graphs for data frame with 3 categorical variables
############################################################

#---required!!
require(ggplot2)
load("../sample_data/data_q0c3.RData")


#---create ggplot scale for x, y groupings
X.scale<-scale_x_discrete(
    #--axis title
    name="Categorical variable #1",
    #--labeled numeric breaks on axis (NULL for none)
    breaks=c("1","2","3"),
    #--labels
    labels=c("Group 1", "Group 2","Group 3")
    )

#---create ggplot scale for x, y groupings
Y.scale<-scale_y_discrete(
    #--axis title
    name="Categorical variable #2",
    #--labeled numeric breaks on axis (NULL for none)
    breaks=c("A","B"),
    #--labels
    labels=c("Type A", "Type B")
    )

#---labels for graph
base.labels<-labs(
    #---graph title
    title="Categorical variable #2",
    #---subtitle
    subtitle="Data consists of three categorical variables"
    )

#---create base ggplot
base.plot<-ggplot(
    #---data frame!!
    dat,
    #---aesthetics: 'bin' first two categorical variables on x and y axes
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
        size=5,
        #---jitter positioning
        position="jitter"
        )


######################################
#---adding color to the base plot
######################################

#---define colors for levels of third factor (can you do this with color themes???)
Z.colors<-c(
        "1"="#000000",
        "2"="#111111",
        "3"="#223355",
        "4"="#557790",
        "5"="#FF3333"
    )


#---create ggplot scale for categorical variable
Z.scale<-scale_color_manual(
    #--colors as defined above
    values=Z.colors,
    #--how to group categorical data
    breaks=c("1","2","3","4","5"),
    #--labels on graph legend
    labels=c("Level 1","Level 2","Level 3","Level 4","Level 5")
    )


#---create additional labels
labels.color<-labs(
    #---caption
    caption="Third categorical variable represented by dot color",
    #---label for categorical legend
    color="Categorical Variable #3"
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
        #---jitter positioning
        position="jitter",
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

#---define sizes for levels of third factor
Z.sizes<-c(
  "1"=1,
  "2"=2,
  "3"=3,
  "4"=4,
  "5"=5
)


#---create ggplot scale for categorical variable
Z.scale<-scale_size_manual(
  #--colors as defined above
  values=Z.sizes,
  #--how to group categorical data
  breaks=c("1","2","3","4","5"),
  #--labels on graph legend
  labels=c("Level 1","Level 2","Level 3","Level 4","Level 5")
)


#---create additional labels
labels.size<-labs(
  #---caption
  caption="Third categorical variable represented by dot size",
  #---label for categorical legend
  size="Categorical Data #3"
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
  file="../base_graphs/graphs_q0c3.RData"
)


