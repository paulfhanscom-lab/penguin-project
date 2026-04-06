### Penguin Species Prediction Report
**Can we predict penguin species using body measurements?**
#### Cleaning
I selected the columns needed for the analysis and removed rows with missing values
using a filter step.
#### Visualizations
I created a scatterplot of bill length vs bill depth and a boxplot of body mass by species.
The graphs show visible differences among species.
#### Machine Learning
I split the cleaned dataset into two parts: 70% for training and 30% for testing. The training
data was used to build a decision tree model that predicts penguin species using bill
length, bill depth, flipper length, and body mass. The testing data was then used to check
how well the model performed on new data. After that, I used a confusion matrix to
evaluate the predictions and a tree plot to visualize the decision rules.
#### Results
The model performed well overall. Gentoo and Adelie were classified very accurately, while
Chinstrap was somewhat harder to predict. The tree showed that flipper length was the
first and most important split, and bill length helped separate Adelie from Chinstrap. This
means body measurements are useful for predicting penguin species.
#### Conclusion
The model was able to classify penguin species using body measurements. The graphs and
model both showed that species differ in measurable ways.
