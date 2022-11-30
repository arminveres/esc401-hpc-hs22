# Exercise 1

## Hadoop

Running it resultet in:

```
Map input records=35506
Map output records=53856j8
```

An output folder with 2 files was generated:

```
hadoop fs -ls output
Found 2 items
-rw-r--r--   1 ubuntu supergroup          0 2022-11-30 17:16 output/_SUCCESS
-rw-r--r--   1 ubuntu supergroup     642476 2022-11-30 17:16 output/part-00000
```
the part-00000 file can be found in this repo.
