#sentiment analysis of youtube comments
library(vosonSML)
##google developer api key, go to google type developer key for youtube, select go to api console,click on credentials to view
your api keys
api="AIzaSyA4t95Zc1pSaMGeqjCcPYSBDbL7FFF67k8"
youtubeAuth <- Authenticate("youtube", apiKey = api)
# collecting youtube video data using video IDs
https://www.youtube.com/watch?v=N2-HsIYd0Go
https://www.youtube.com/watch?v=YpkJO_GrCo0
video=c("N2-HsIYd0Go","YpkJO_GrCo0")
ytdata=Collect(credential =youtubeAuth,video,ego=F,maxComments = 100)
##before executing above command, one needs to enable the youtube API by going here,
https://console.developers.google.com/apis/credentials?project=data-mining-260310
ytdata
str(ytdata)
dim(ytdata)
write.csv(ytdata,"ytdata.csv",row.names = F)
mydata=read.csv("ytdata.csv",header=T)
names(mydata)
head(mydata)
str(mydata)
View(mydata)
#to find comments where a comment recieved a reply
newdata=mydata[mydata$ReplyCount!=F,]
dim(newdata)
dim(mydata)
## we will create a new data frame with only username and reply
nd=data.frame(mydata$AuthorDisplayName,mydata$ReplyCount)
dim(nd)
# create user network
library(igraph)
network=graph.data.frame(nd,directed = T)
## below command is to exclude comments where original writer himself commented.
network=simplify(network)
V(network)
E(network)
V(network)$label=V(network)$name
V(network)$degree=degree(network)
hist(V(network)$degree,col="green",main="Histogram of node degree",ylab = frequency,xlab = "degree of vertices")
plot(network,vertex.size=0.2*V(network)$degree,edge.arrow.size=0.1,vertex.label.cex=0.2*V(network)$degree)
##sentiment analysis
library(syuzhet)
