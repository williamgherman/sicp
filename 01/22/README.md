### Exercise 1.22.
Most Lisp implementations include a primitive called `runtime` that returns an
integer that specifies the amount of time the system has been running (measured,
for example, in microseconds). The following `timed-prime-test` proceddure, when
called with an integer n, prints n and checks to see if n is prime. If n is
prime, the procedure prints three asterisks followed by the amount of time used
in performing the test.
```scheme
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
```
Using this procedure, write a procedure `search-for-primes` that checks the
primality of consecutive odd integers in a specified range. Use your procedure
to find the three smallest primes larger than 1000; larger than 10,000; larger
than 100,000; larger than 1,000,000. Note the time needed to test each prime.
Since the testing algorithm has order of growth of ϴ(√n), you should expect that
testing for primes around 10,000 should take about √10 times as long as testing
for primes around 1000. Do your time data bear this out? How well do the data
for 100,000 and 1,000,000 support the √n prediction? Is your result compatible
with the notion that programs on your machine run in time proportional to the
number of steps required for the computation?

### Solution
See `primetimes.scm` for the complete procedure. 

Note that not all interpreters define the `runtime` primitive. As previously
stated, the recommended interpreter is the MIT/GNU Scheme Interpreter available
at <https://www.gnu.org/software/mit-scheme/>.

Also note that since SICP was written, computers have developed processing
capabilities which result in extremely low runtimes for these given numbers for
the procedures. Therefore, in addition to testing 1000 through 1,000,000, I have
also tested 1,000,000,000 (one billion) through 1,000,000,000,000 (one
trillion).

Program output:
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
1000033 *** 0.
1000037 *** 0.

1000000007 *** .04000000000000001
1000000009 *** 3.9999999999999994e-2
1000000021 *** .04000000000000001
10000000019 *** .12000000000000002
10000000033 *** .10999999999999999
10000000061 *** .11000000000000004
100000000003 *** .3799999999999999
100000000019 *** .3700000000000001
100000000057 *** .3599999999999999
1000000000039 *** 1.1300000000000001
1000000000061 *** 1.1399999999999997
1000000000063 *** 1.1400000000000006
```
The data suggests that for each increase in the input by a factor 10, the
resulting time roughly triples (average factor of ~3.055), which is roughly 96%
of sqrt(10). 
