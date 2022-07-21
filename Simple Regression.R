path <- "C:/karidiprashanth/Downloads/Analytics"
setwd(path)
data = read.csv("airfoil_self_noise.csv")
summary(data)
str(data)
colSums(is.na(data))
cor(data)
model <- lm(Sound_pressure_level ~ .,data = data)
summary(model)
par(mfrow=c(1,1), oma=c(1,1,0,0), mar=c(1,1,1,0))
plot(model)
set.seed(1)
d <- sample(x = nrow(data),size = nrow(data)*0.7)
train <- data[d,]
test <- data[-d,]
rmodel <- lm(log(Sound_pressure_level)~.,data = train)
summary(rmodel)
rpred <- predict(rmodel,test)
rpred <- exp(rpred)
library(Metrics)
rmse(actual = test$Sound_pressure_level,predicted = rpred)
d <- boxplot(train$Displacement,varwidth = T,outline = T,border = T)
d$out
