#sentiment analysis of youtube comments
library(vosonSML)
##google developer api key, go to google type developer key for youtube, select go to api console,click on credentials to view
your api keys
api="AIzaSyBfjvbnS7O2kdlbwjwYYOgDvohNGuCpiMY"
youtubeAuth <- Authenticate("youtube", apiKey = api)
# collecting youtube video data using video IDs
https://www.youtube.com/watch?v=4oO0zV5ANNI
https://www.youtube.com/watch?v=CMR6UMG-H2U
video=c("4oO0zV5ANNI","CMR6UMG-H2U")
ytdata1=Collect(credential =youtubeAuth,video,ego=F,maxComments = 100)
##before executing above command, one needs to enable the youtube API by going here,
https://console.developers.google.com/apis/credentials?project=data-mining-part2
ytdata1
str(ytdata1)
dim(ytdata1)
write.csv(ytdata,"ytdata1.csv",row.names = F)
mydata=read.csv("ytdata1.csv",header=T)
names(mydata)
head(mydata)
str(mydata)
View(mydata)