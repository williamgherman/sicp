### Exercise 1.13.
Prove that Fib(n) is the closest integer to φ<sup>n</sup>/√5, where φ = (1 + √5)/2. Hint: Let ψ = (1 - √5)/2. Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = φ<sup>n</sup> - ψ<sup>n</sup>/√5.

### Solution

#### 1. Prove that Fib(n) = (φ<sup>n</sup> - ψ<sup>n</sup>)/√5.

Here is our given information, along with some algebraic properties of φ and ψ:

    (1) Fib(n) = 0,                   for n = 0
               = 1,                   for n = 1
               = Fib(n-1) + Fib(n-2), for n > 1
        for all n >= 0.
    (2) φ = (1+√5)/2,
        ψ = (1-√5)/2
    (3) φ² = φ+1, ψ² = ψ+1
        1/φ = φ-1, 1/ψ = ψ-1   

With this information, we can prove that Fib(n) = (φ<sup>n</sup> - ψ<sup>n</sup>)/√5 for the first few values of n.

    Fib(0) = (φ⁰ - ψ⁰)/√5
           = (1 - 1)/√5
         0 = 0

    Fib(1) = (φ¹ - ψ¹)/√5
           = ((1+√5)/2 - (1-√5)/2)/√5          see given (2)
           = 2√5 / 2√5
         1 = 1

    Fib(2) = (φ² - ψ²)/√5
           = (((1+√5)/2)² - ((1-√5)/2)²) / √5  see given (2)
           = (6 + 2√5 - 6 + 2√5) / 4√5
         1 = 1
At this point, if we assume that Fib(n) = (φ<sup>n</sup> - ψ<sup>n</sup>)/√5 and Fib(n-1) = (φ<sup>n-1</sup> - ψ<sup>n-1</sup>)/√5, then we can prove that Fib(n+1) = (φ<sup>n+1</sup> - ψ<sup>n+1</sup>)/√5.

    Fib(n+1) = Fib(n) + Fib(n-1)                            see given (1)
             = (φⁿ - ψⁿ)/√5 + (φⁿ⁻¹ - ψⁿ⁻¹)/√5              see given (2)
             = (φⁿ + φⁿ⁻¹ - (ψⁿ + ψⁿ⁻¹)) / √5
             = (φⁿ⁺¹(φ⁻¹ + φ⁻²) - ψⁿ⁺¹(ψ⁻¹ + ψ⁻²)) / √5
             = (φⁿ⁺¹φ⁻¹(1 + φ⁻¹) - ψⁿ⁺¹ψ⁻¹(1 + ψ⁻¹)) / √5   see given (3)
             = (φⁿ⁺¹φ⁻¹φ - ψⁿ⁺¹ψ⁻¹ψ) / √5
             = (φⁿ⁺¹ - ψⁿ⁺¹)/√5
Now, the relationship between Fib(n) and φ and ψ is proven. To prove our original statement -- that Fib(n) is the closest integer to φ<sup>n</sup>/√5, we need to isolate φ:

    Fib(n)         = (φⁿ - ψⁿ)/√5
    Fib(n)         = φⁿ/√5 - ψⁿ/√5
    Fib(n) + ψⁿ/√5 = φⁿ/√5
and then prove that ψ<sup>n</sup>/√5 is within -0.5 and 0.5, done by approximating its value:

    ψ       ≈ -0.618033
    ψ/√5    ≈ -0.276393
    |ψⁿ/√5| < 0.5, for all real numbers n > 0 (|ψⁿ/√5| decreases as n increases).
Therefore, since |ψⁿ/√5| < 0.5, it will not affect the nearest integer value of Fib(n).

So, **Fib(n) is the closest integer to φ**<sup>**n**</sup>**/√5**.
