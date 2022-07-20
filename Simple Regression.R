path <- "C:/karidiprashanth/Downloads/Analytics"
setwd(path)
data = read.csv("airfoil_self_noise.csv")
summary(data)
str(data)
colSums(is.na(data))
cor(data)
model <- lm(Sound_pressure_level ~ .,data = data)
summary(model)
par(mfrow=c(1,1))
plot(model)

