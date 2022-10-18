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
