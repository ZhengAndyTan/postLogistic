#' ROC() function
#'
#'
#' Function to get a data frame containing the ROC
#'
#'
#' input:
#' prob: vector/array/data.frame...: containing the predicted probabilities from 'predict' function
#' true: vector/array/data.frame...: indicating the true label; has to have the same length as prob
#' resolution: int: search resolution, default set to 1000
#'
#'
#' output:
#' The function returns an R data frame, each row containing the True Positive Rate (tpr)
#' and False Positive Rate (fpr), according to the same threshold.


ROC <- function(prob, true, resolution = 1000){
  # prob: vector/array: containing the predicted probabilities from 'predict' function
  # true: vector/array: indicating the true label; has to have the same length as prob
  # resolution: int: search resolution
  len <- length(prob)
  ff <- rep(0, len)
  tt <- rep(0, len)
  for (i in 1:resolution){
    cutt <- i/resolution
    #cutt <- range(prob)[1]+ i/resolution * (range(prob)[2]-range(prob)[1])
    pred <- rep(0, len)
    for (j in 1:len){
      pred[j] <- if (prob[j] < cutt) 0 else 1
    }
    tp <- sum(pred==1 & true==1)
    tn <- sum(pred==0 & true==0)
    fp <- sum(pred==1 & true==0)
    fn <- sum(pred==0 & true==1)
    tpr <- tp/(tp+fn)
    fpr <- fp/(fp+tn)
    ff[i] <- fpr
    tt[i] <- tpr
  }
  f <- t(t(ff))
  t <- t(t(tt))
  res <- as.data.frame(cbind(f,t))
  names(res) <- c("fpr", "tpr")
  return(res)
}


