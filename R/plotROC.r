#' plotROC() function
#'
#'
#' Function to plot the ROC curve
#'
#'
#' input:
#' prob: vector/array/data.frame...: containing the predicted probabilities from 'predict' function
#' true: vector/array/data.frame...: indicating the true label; has to have the same length as prob
#' resolution: int: search resolution, default set to 1000
#'
#'
#' output:
#' A plot of the ROC curve



plotROC <-function(prob, true, resolution = 1000){
  r <- ROC(prob, true, resolution)
  plot(x = r$fpr, y = r$tpr, type = "l", xlab = "FPR", ylab = "TPR")
}


