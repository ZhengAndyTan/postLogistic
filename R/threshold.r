#' threshold() function
#'
#'
#' function to search for threshold
#'
#'
#' input:
#' prob: vector/array/data.frame...: containing the predicted probabilities from 'predict' function
#' true: vector/array/data.frame...: indicating the true label; has to have the same length as prob
#' resolution: int: search resolution, default set to 1000
#'
#'
#' output:
#' An R data frame containing the three optimal thresholds, according to the three metrics:
#' Accuracy, Balanced Accuracy and F1 Score

threshold <- function(prob, true, resolution = 1000){
  # prob: vector/array: containing the predicted probabilities from 'predict' function
  # true: vector/array: indicating the true label; has to have the same length as prob
  # metric: the target threshold maximizes the picked metric
  len <- length(prob)
  store_ACC <- rep(0, len)   # Overall Accuracy: ACC = (TP+TN)/(TP+TN+FP+FN)
  store_BA <- rep(0, len)    # Balanced Accuracy: BA = (TPR+TNR)/2
  store_F1 <- rep(0, len)    # F1 Score: (2TP)/(2TP+FP+FN)
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
    tnr <- tn/(tn+fp)
    fnr <- fn/(fn+tp)

    store_ACC[i] <- (tp+tn)/(tp+tn+fp+fn)
    store_BA[i] <- (tpr+tnr)/2
    store_F1[i] <- (2*tp)/(2*tp+fp+fn)

  }
  threshold_ACC <- which.max(store_ACC)/resolution
  threshold_BA <- which.max(store_BA)/resolution
  threshold_F1 <- which.max(store_F1)/resolution
  res <- as.data.frame(t(c(threshold_ACC, threshold_BA, threshold_F1)))
  names(res) <- c("threshold_ACC", "threshold_BA", "threshold_F1")
  return(res)
}




