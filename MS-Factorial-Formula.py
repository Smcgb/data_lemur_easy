"""
Given a number nn, write a formula that returns n!n!.

In case you forgot the factorial formula, n!=n∗(n−1)∗(n−2)∗.....2∗1n!=n∗(n−1)∗(n−2)∗.....2∗1.

For example, 5!=5∗4∗3∗2∗1=1205!=5∗4∗3∗2∗1=120 so we'd return 120.

Assume is nn is a non-negative integer.

https://datalemur.com/questions/python-factorial-formula
"""

# While loop
def factorial(n):

  factorial = 1
  
  while n > 1:

    factorial *= n
    n -= 1

  return factorial

# for loop
def factorial(n):
    
  factor = 1
  
  for i in range(n):
    
    factor *= i+1
  
  return factor

# recrusive

def factorial(n):
  if n == 0:
    return 1
  else:
    return n * factorial(n-1)
