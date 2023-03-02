https://datalemur.com/questions/precision-recall-tradeoff
BCG Gamma
Diff: Easy

Describe precision and recall and give their formulas. What is their importance and what is the nature of the tradeoff between the two?


When talking about precision and recall, we need to talk about confusion matrix.

i.e. we have a classification problem, we are judging whether a sale is going to be a success or not.

conf matrix:

TP FP
FN TN

TP - we predicted a sale and it happened
FP - we predicted a sale and it did not happen
FN - we predicted a bust and it was a sale
TN - we predicted a bust and it happened

precision:
TP/(TP+FP)

recall:
TP(TP+FN)

precision and recall are substitutable, easiest way to increase one is to decrease the other one.

Based on the example, precision describes how good are we at identifying sales (and do not confuse busts and successful sales) 
and recall explains how good are we at identifying successes.
