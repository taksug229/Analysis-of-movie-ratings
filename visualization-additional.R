getwd()
setwd("Set your working directory here")
mov <- read.csv("P2-Movie-Sales.csv")
head(mov)
tail(mov)
summary(mov)

library(ggplot2)

ggplot(data=mov, aes(x=Day.of.Week)) + geom_bar()

#filtering the Genre and Studio
filt1 <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")
filt2 <- (mov$Studio == "Buena Vista Studios") | (mov$Studio == "Fox") | (mov$Studio == "Paramount Pictures") | (mov$Studio == "Sony") | (mov$Studio == "Universal") | (mov$Studio == "WB")

#assigning the filter to mov2
mov2 <- mov[filt1 & filt2,]
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))


p + geom_point(aes(size=Budget...mill.))
p + geom_boxplot(aes(size=Budget...mill.))

str(mov2)

#boxplot with points
p + geom_boxplot() + geom_point()
#boxplot with jitter
p + geom_boxplot() + geom_jitter()
#boxplot on top of jitter
p + geom_jitter() + geom_boxplot()
#boxplot with transparency
p + geom_jitter() + geom_boxplot(alpha=0.7)
#boxplot with color
p + geom_jitter(aes(size=Budget...mill., color=Studio)) + geom_boxplot(alpha=0.7)
#remove outlier
p + geom_jitter(aes(size=Budget...mill., color=Studio)) + geom_boxplot(alpha=0.7, outlier.color = NA)
#save progress
q <- p + geom_jitter(aes(size=Budget...mill., color=Studio)) + geom_boxplot(alpha=0.7, outlier.color = NA)
q
#change fonts
q <- q + 
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")
q

?theme

#Assign Theme
q <- q +
  theme(
    text = element_text(family="Comic Sans MS"),
    axis.title.x = element_text(colour="Blue", size=30),
    axis.title.y = element_text(colour="Blue", size=30),
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),
    plot.title = element_text(colour="Black", size=40),
    legend.title = element_text(size=20),
    legend.text = element_text(size=12)
  )
q

q$labels$size = "Budget $M"
q

