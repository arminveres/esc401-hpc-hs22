# Exercise 5

## Task 1

In order for a C++ file to be compiled and correctly link, one could change the CC to g++.
If I just try to compile without changing the CC, then it correctly compiles with g++ but then switches
back to cc and failes to link correctly.
I used `.cpp` as a file extension.

## Task 2

```c
int p[10] = ...;
```

- `p[-1] = 42` in C/C++ reduces the pointer by one, leading to undefinet behaviour, since it likely
  overwrites memory not defined and controlled by us.
- p is a pointer to an integer (array), which when incremented points to the next element in the array.
  `*p` is the dereferenced value of the pointer, which is an integer. `&p` is the adress of the pointer,
  so a pointer to a pointer.
- `*(p+1)` is the pointer incremented by one and dereferenced, which is the second value in the array.
  `*p+1` is the derefenced value/integer increased by one.
- `*q = p-1`: q[0] is the same situation as p[-1]. _(q+10) is the 9th element of p dereferenced. _(q+11)
  is an out of bounds/undefied behaviour again, because it oversteps the boundaries.

```cpp
int ** M = new int *[2];
M[0] = new int[5]{0,1,2,3,4};
M[1] = new int[5]{5,6,7,8,9};
```

- M is a pointer to an array, aka. a pointer to a pointer, so a 2d array.
- `*M` is one of the underlying 1d arrays, dependind if M got incremented. `**M` is the value/int at
  position 0 of array 0, again depending if it got incremented.
  `M[1][3]` is the 3rd element in the first array, or in english the 4th element in the second array.
  `*(M[0] + 1)` The pointer to the first array gets incremented by 1 and then dereferenced, which
  should get us the 1th/second elemt in the first array.
  `*(*(M+1)+3)` The pointer to the array pointer gets incremented pointin now to M[1], gets dereferenced,
  getting us the pointer to the first element in the second array, incremented by 3, getting us `M[1][3]`.
- The arrays are indirectly stored next to each other, rather it's the elements that are stored sequentially.
  Incrementing e.g. the pointer to ther first array, would add enough 'units' so that it goes to the first
  element of the second array.
