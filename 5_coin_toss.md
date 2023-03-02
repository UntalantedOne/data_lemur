https://datalemur.com/questions/coin-fairness-test
Facebook
Diff: Easy

Say you flip a coin 10 times and observe only one heads. What would be your null hypothesis and p-value for testing whether the coin is fair or not?

This is the same question as problem #5 in the Statistics Chapter of Ace the Data Science Interview!


H0: p(h) = 0.5
H1: p(h) ≠ 0.5

p-value should be calculated as all the possible combinations of 10 coin flips which is 
2^10
 

Only one head flip is observed in 10 combinations (i.e. heads flipped on the first try or on the second etc.)

p = 10/1024 = .0098

Which is rather low, so even at 0.05 confidence level the H0 can be rejected
