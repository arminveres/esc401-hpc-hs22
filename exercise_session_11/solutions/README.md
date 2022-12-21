# Exercise sheet 11 - solutions

## Exercise 1

In order to run the code in parallel on a GPU, we need to add respective `pragma` directives in front of parallel region:

```C++
#include <stdio.h> 
#include "gettime.h"
#include "openacc.h" //not necessary

static long steps = 1000000000;

int main (int argc, const char *argv[]) {
    int i; double x;
    double pi;
    char *p;
    double step = 1.0/(double) steps;
    for (int j=0;j<5;j++){
        double sum = 0.0;
        double start = getTime();
        #pragma acc parallel 
        #pragma acc loop reduction(+:sum) private(x) // private not necessary
        for (i=0; i < steps; i++) {
            x = (i+0.5)*step;
            sum += 4.0 / (1.0+x*x);
        }
        pi = step * sum;
        double delta = getTime() - start;
        printf("PI = %.16g computed in %.4g seconds\n", pi, delta);
    }
}
```

Notice a necessary reduction regarding `sum` variable. On the other hand, `private(x)` is not required here as scalars (and loop variables) are by default private.

Find job script and output file in folder `openacc`. Note that it is enough to run on a single CPU per task, as parallelization happens on the GPU. First iteration is significantly longer that the remaining ones (see below). The reason is GPU needs to be set up and data transfer handled prior the computation.

```
PI = 3.141592653589793 computed in 1.429 seconds
PI = 3.141592653589793 computed in 0.01288 seconds
PI = 3.141592653589793 computed in 0.02531 seconds
PI = 3.141592653589793 computed in 0.05022 seconds
PI = 3.141592653589793 computed in 0.101 seconds
```
