# postLogistic
Tools after Logistic Regression

The package contains three functions, all of which focus on the threshold of a binary classifier, namely the cut point of the predicted probabilities. 

All the functions take in the same two main parameters: the predicted probabilities and the "truth". 

ROC()
The function returns an R data frame, each row containing the True Positive Rate (tpr) and False Positive Rate (fpr), according to the same threshold. 

plotROC()
The function plots the ROC curve. 

threshold()
The function searches the optimal threhold, according to three different metrics, Accuracy, Balanced Accuracy and F1 Score. It returns an R data frame containing the three optimal thresholds. 
