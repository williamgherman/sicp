### Exercise 1.45

We saw in Section 1.3.3 that attempting to compute square roots by naively
finding a fixed point of *y* &#8614; *x*/*y* does not converge, and that this
can be fixed by average damping. The same method works for finding cube roots as
fixed points of the average-damped *y* &#8614; *x*/*y*<sup>2</sup>.
Unfortunately, the process does not work for fourth roots&em;a single average
damp is not enough to make a fixed-point search for *y* &#8614;
*x*/*y*<sup>3</sup> converge. On the other hand, if we average damp twice (i.e.,
use the average damp of the average damp of *y* &#8614; *x*/*y*<sup>3</sup>) the
fixed-point search does converge. Do some experiments to determine how many
average damps are required to compute nth roots as a fixed-point search based
upon repeated average damping of *y* &#8614; *x*/*y*<sup>*n*-1</sup>. Use this
to implement a simple procedure for computing nth roots using `fixed-point`,
`average-damp` and the `repeated` procedure of Exercise 1.43. Assume that any
arithmetic operations you need are available as primitives.

### Solution

See `45.scm`. The number of average-damps performed is equal to about to the
log<sub>2</sub> of the level of root, achieved iteratively through the
`get-damps` function.

