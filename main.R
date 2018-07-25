library(BRugs)
library(rmarkdown)
#https://jennybc.github.io/2014-05-12-ubc/ubc-r/session2.4_github.html
render("ABTesting.Rmd")
##
i <- 5
##
modelCheck("C:/Users/Bountour/Dropbox/R Projects/ABTesting/BayesianModels/model.txt")
y <- data[[i]]$cntr; dataList <- list(nFlips=length(y), y = y)
bugsData(dataList)
modelData(bugsData(dataList))
modelCompile()
modelGenInits()
samplesSet("theta")
modelUpdate(10000)
samples_cntr <- samplesSample("theta")
##
modelCheck("C:/Users/Bountour/Dropbox/R Projects/ABTesting/BayesianModels/model.txt")
y <- data[[i]]$test_sc2; dataList <- list(nFlips=length(y), y = y)
bugsData(dataList)
modelData(bugsData(dataList))
modelCompile()
modelGenInits()
samplesSet("theta")
modelUpdate(10000)
samples_test_sc2 <- samplesSample("theta")
##
sum(samples_test_sc2 >= samples_cntr) / length(samples_cntr)
##

i <- 1
computations[["Bayesian"]][["sc1"]][["thetas"]] <- list()
for (k in seq(500, length(y), by=500)) {
    ##
    y <- data[[i]]$test_sc1;  
    dataList <- list(nFlips=length(y[1:k]), y = y[1:k])
    modelCheck("C:/Users/Bountour/Dropbox/R Projects/ABTesting/BayesianModels/model.txt")
    bugsData(dataList)
    modelData(bugsData(dataList))
    modelCompile()
    modelGenInits()
    samplesSet("theta")
    modelUpdate(10000)
    computations[["Bayesian"]][["sc1"]][["thetas"]][[k]] <- samplesSample("theta")
    ##
    y <- data[[i]]$test_sc2;  
    dataList <- list(nFlips=length(y[1:k]), y = y[1:k])
    modelCheck("C:/Users/Bountour/Dropbox/R Projects/ABTesting/BayesianModels/model.txt")
    bugsData(dataList)
    modelData(bugsData(dataList))
    modelCompile()
    modelGenInits()
    samplesSet("theta")
    modelUpdate(10000)
    computations[["Bayesian"]][["sc2"]][["thetas"]][[k]] <- samplesSample("theta")
    ##
}



f <- function(df, col_name) {
  
    y <- df[, col_name]
    dataList <- list(nFlips=length(y), y = y)
    modelCheck("C:/Users/Bountour/Dropbox/R Projects/ABTesting/BayesianModels/model.txt")
    bugsData(dataList)
    modelData(bugsData(dataList))
    modelCompile()
    modelGenInits()
    samplesSet("theta")
    modelUpdate(10000)
    return(samplesSample("theta"))
}

computations[["Bayesian"]][["cntr"]][["data-thetas"]] <- lapply(data, f, "cntr")
computations[["Bayesian"]][["test_sc1"]][["data-thetas"]] <- lapply(data, f, "test_sc1")
computations[["Bayesian"]][["test_sc2"]][["data-thetas"]] <- lapply(data, f, "test_sc2")


#b <- f(data[[i]], "test_sc1")
#c <- f(data[[i]], "test_sc2")
#sum(a < b)/length(a)
#sum(a < c)/length(a)
# 
#quantile(samples, c(0.10,0.90))
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