# TitanicML

In this repositorie we will analysis and create a lineal model to try predict if a person would have died or survived if
he or she would have been on the Titanic throgh his name, gender, age, number of siblings or spouses aboard and number of parents or children aboard. All this "predictions" were made by mathematical model throgh data set of the peoples who really been on the
Titanic. We'll calculate precision, recall and accuracy of this model.

## Run it yourself!

You can test this little program:

`1. Install RStudio`

`2. Clone this repositorie`

`3. Make sure you have installed the following libraries:` shiny, tidyverse, tidymodels, titanic

`4. Run the aplication with: runApp("App-1") in the console in RStudio`

`5. In the screen View you can view the interface and interact`

## The Problem

As you thinking this problem is a binary classification problem, surely you have noticed that this problem is a binary classification problem, that is, a Yes or No problem. In this case the answer to the problem is whether or not the person would survive. So we trained our model on a set of observations consisting of 668 records of people who actually sailed on the Titanic. These records consist of:

1. Passenger ID
2. Passenger Class
3. Name
4. Sex
5. Age
6. Number of Siblings/Spouses Aboard
7. Number of Parents/Children Aboard
8. Ticket Number
9. Passenger Fare
10. Cabin
11. Embarked
12. Port of Embarkation

Obviously there is irrelevant information, such as the passenger id, it is irrelevant because intuitively it is not a piece of information that would determine whether a person would survive or not.
This analysis and study of the problem is carried out in a stage called Exploratory Data Analysis
Then we transform the data we need in order to use it to create the model that will help us find patterns in the information and make predictions. Transformations such as vectorization, normalization, standardization, missing values handling, etc.


## The solution

Once the model is created, we are ready to test the efficacy. For this we use a data set, which was not used to train the model (obviously). These data are from 223 records of people who were also on the Titanic so that we can compare what the model predicted about these people and what actually happened.

Before giving the results, let's give a concept to clarify and understand the results. Confussion Matrix is a table or matrix where:
- Rows represents actual classes
- Columns represents predicted classes
- Each entry is the number of instance with corresponding actual and predicted classes
  
|   | YES | NO
|---|-----|-----
|YES| TP  | FN
|NO | FP  | TN

This matrix in our problem:

|   | Died | Survived
|---|-----|-----
|YES| TP  | FN
|NO | FP  | TN

Where TP is true positive and represents the number of instances that our model predicts positively and indeed the prediction is correct.
FN is false negative and represents the number of instances that our model predicts positively but the prediction is wrong.
FP is false positive and represents the number of instances that our model predicts negatively but the prediction is wrong.
And TN is true negative and represents the number of instances that our model predicts negatively and indeed the prediction is correct.

The results of the model are as follows:


|            |  Died    |  Survived
|------------|----------|-----------
|  Died      |   117    |   19
|  Survived  |   24     |  63

We calculate the **accuracy** as (TP+TN) / (FP+FN+TP+TN)
And if we think about it in detail, this tells us how often is the classifier corret. So the accuracy of this classifier 
or model is 80%, pretty good.
We calculate the **precision** as TP / (TP+FP), that represents how often is the clasiffier correct when it predicted positive, and it's 82%
And the last **recall** as TP / (TP+FN) this tells us how often are the positive instances classified correctly as positive, it's 86%


