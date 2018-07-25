library(BRugs)
#
setwd("C:/Users/Bountour/Dropbox/R Projects/Bayesian")
library(rmarkdown)
render("ABTesting.Rmd")

# modelCheck("C:/Users/Bountour/Dropbox/R Projects/Bayesian/model.txt")
# #
# dataList <- list(nFlips=40, y = c(0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,1))
# #
# bugsData(dataList)
# modelData(bugsData(dataList))
# modelCompile()
# modelGenInits()
# samplesSet("theta")
# modelUpdate(10000)
# #
# samplesStats("theta")
# samples <- samplesSample("theta")
# 
# 
# quantile(samples, c(0.10,0.90))
# 
# 
# 
# 
# 
# #
# modelCheck("C:/Users/Bountour/Dropbox/R Projects/Bayesian/model_regression.txt")
# #
# dataList <- list(nData=10, y = c(1,2,3,4,1,2,3,4,1,2), x=c(4,3,4,3,5,6,2,3,4,0))
# #
# bugsData(dataList)
# modelData(bugsData(dataList))
# modelCompile()
# modelGenInits()
# samplesSet(c("beta0", "beta1"))
# modelUpdate(10000)
# #
# samplesStats(c("beta0", "beta1"))
# samples <- samplesSample("beta0")
# quantile(samples, c(0.10,0.90))