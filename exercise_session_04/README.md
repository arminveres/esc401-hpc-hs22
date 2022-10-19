# Exercise 3

## Task 1

I have got read, write, execute permission on $HOME:
`drwx------ 16 averes uzh8 8192 Oct 18 17:52 /users/averes`
I have got read, write, execute permission on $SCRATCH for myself, group has read and execute, and
the other system users as well.
`drwxr-xr-x 2 averes uzh8 4096 Oct 6 20:09 /scratch/e1000/averes`

If creating (touch hellou) a file in $SCRATCH I have got read/write and the group/users have read permission:
`-rw-r--r-- 1 averes uzh8 0 Oct 18 17:56 /scratch/e1000/averes/hellou`
If creating a file in $HOME I have got read/write and the group/users have read permission:
`-rw-r--r-- 1 averes uzh8      0 Oct 18 17:58 hellou`

Since other users can neither read, writem, nor execute anything inside jbucko's folder, no, I could
not read/see the file. Even running `ls` returns permission denied.


By running `chmod 700 testdir` the user gets full access, while removing any acces for anyone else:
`drwx------ 2 averes uzh8 4096 Oct 18 18:08 testdir/`

To give write acces to a directory in my SCRATCH dir, I have to run `chmod 775 testdir`, which gives
the group members read, write and execeute access. We could also run 765, only read and write access.

Running 000 on chmod does not make the file disappera, merely unopenable. We can run chmod again to 
regain access, since we are the owners of the file.

## Task 2

1) ".*00$"
2) "^1.*1$"
3) "110"
4) "1.*1.*1"
5) "1111*"

## Task 3

`factor`: returns the prime number factorization of a given number
`factor 20
20: 2 2 5`
`factor 31
31: 31`

Piping: we could use the --words flag to count the words, then subtract one to get the number of factors.
If it's 1, then it's a prime.

testing: we could check for the number of factors as said above and exit if it's not a prime, printing a statement, as
done in my isprime.sh script.

```
time ./isprime.sh 4230283
4230283 is a prime

real	0m0.040s
user	0m0.013s
sys	0m0.009s

```
```
time ./isprime.sh 4572862171001
4572862171001 is a prime

real	0m0.042s
user	0m0.010s
sys	0m0.012s
```
