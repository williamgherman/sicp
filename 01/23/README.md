### Exercise 1.23.

The `smallest-divisor` procedure shown at the start of this section does lots of
needless testing: After it checks to see if the number is divisible by 2 there
is no point in checking to see if it is divisible by any larger even numbers.
This suggest that the values used for `test-divisor` should not be 2, 3, 4, 5,
6, ..., but rather 2, 3, 5, 7, 9, .... To implement this change, define a
procedure `next` that returns 3 if its input is equal to 2 and otherwise returns
its input plus 2. Modify the `smallest-divisor` procedure to use `(next
test-divisor)` instead of `(+ test-divisor 1)`. Wth `timed-prime-test`
incorporating this modified version of `smallest-divisor`, run the test for each
of the 12 primes found in exercise 1.22. Since this modification halves the
number of test steps, you should expect it to run about twice as fast. Is this
expectation confirmed? If not, what is the observed ration of the speeds of the
two algorithms, and how do you explain the fact that it is different from 2?

### Solution

See `23.scm` for the complete procedures. Below is the output given for the
original 12 primes found in exercise 1.22 as well as the next 12 large primes.
The tests ran approximately twice as fast, as expected.

```
1009 *** 0.
1013 *** 0.
1019 *** 0.
10007 *** 0.
10009 *** 0.
10037 *** 0.
100003 *** 0.
100019 *** 0.
100043 *** 0.
1000003 *** 0.
1000033 *** .01
1000037 *** 0.
*** ***
1000000007 *** 1.9999999999999997e-2
1000000009 *** .03
1000000021 *** 2.0000000000000004e-2
10000000019 *** .06000000000000001
10000000033 *** .06999999999999998
10000000061 *** .07000000000000003
100000000003 *** .19999999999999996
100000000019 *** .21999999999999997
100000000057 *** .21000000000000008
1000000000039 *** .67
1000000000061 *** .6699999999999999
1000000000063 *** .6699999999999999
```
