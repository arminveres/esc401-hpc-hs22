# Exercise 7

## Rigns and Deadlocks

- Without splitting the send and received into two separate parts, there is a deadlock and nothing
  happens. Splitting the sends and receives into alternating even/odd ranks word if the the non
  synchronous send methods are used!

- Since we are in a ring, we always find ourselved in a block (except with alternating sending as seen)
  sinve we have to wait for the previous sender. With a nonblocking one, we don't have that problem and
  values can be received independently from having to wait.
