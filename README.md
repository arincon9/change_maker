# **CHANGE MAKER**
  

At first, this code challenge seems fairly straight forward until you take into consideration the requirement of returning the least amount of coins to make change, this is where the subtle complexity creeps in.

## Process

I first begin by looping through the denominations array and calculating change using the denominations provided.
I then store the array of change in a variable called **optimal_change**, and override this variable if the length of the **optimal_change** array is shorter than the length of the **change** array. My reasoning was, I needed a way to store and compare the arrays to find the minimum number of coins. In order to find the minimum number of coins and find all possible combinations, I needed to remove the first item of the **denominations** array, so I used the **shift** method. The loop then continues, and makes change and compares that **change** array length to the previously saved **optimal_change** array. If the array is shorter then it saves this array as the optimal solution.

## Bonus Points

For the bonus points, I raise an error if the change cannot be made. In order to accomplish this I subtract the **optimal_change** amount to the **amount** given. If the result is 0, then we can confidently assume that we have successfully made change.

