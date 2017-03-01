if(!require(mlr)) {
  install.packages("mlr")
  library(mlr)
}


## A simple stratified cross-validation of linear discriminant analysis with mlr.

data(iris)

## Define the task
task = makeClassifTask(id = "tutorial", data = iris, target = "Species")
print(task)

## Define the learner
lrn = makeLearner("classif.lda")
print(lrn)

## Define the resampling strategy
rdesc = makeResampleDesc(method = "CV", stratify = TRUE)
print(rdesc)

## Do the resampling
r = resample(learner = lrn, task = task, resampling = rdesc, show.info = FALSE)
print(r)

## Get the mean misclassification error
r$aggr

