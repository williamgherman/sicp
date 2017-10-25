### Exercise 1.13.
Prove that *Fib*(*n*) is the closest integer to φ<sup>*n*</sup>/√5, where φ = (1 + √5)/2. Hint: Let Ψ = (1 - √5)/2. Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that *Fib*(*n*) = φ<sup>*n*</sup> - Ψ<sup>*n*</sup>/√5.

### Solution

#### 1. Prove that Fib(n) = (φ<sup>n</sup> - Ψ<sup>n</sup>)/√5.

Here is our given information, along with some algebraic properties of φ and Ψ:

    (1) Fib(n) = 0,                   for n = 0
               = 1,                   for n = 1
               = Fib(n-1) + Fib(n-2), for n > 1
        for all n >= 0.
    (2) φ = (1+√5)/2,
        Ψ = (1-√5)/2
    (3) φ² = φ+1, Ψ² = Ψ+1
        1/φ = φ-1, 1/Ψ = Ψ-1   

With this information, we can prove that Fib(n) = φ<sup>n</sup> - Ψ<sup>n</sup>/√5 for the first few values of n.

    Fib(0) = Fib(n) = φ<sup>n</sup> - Ψ<sup>n</sup>/√5
