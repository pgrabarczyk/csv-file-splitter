# csv-file-splitter
Split CSV file into many.

Example usage:

```bash
# Split "sample.csv" to files. Each output file should have 3 lines (+header) and be named with prefix "result_".
pgrabarczyk@pgrabarczyk:~/git/csv-file-splitter$ bash csv-file-splitter.sh "sample.csv" 3 "result_"
source_csv_path: sample.csv
dest_prefix_path: /home/pgrabarczyk/git/csv-file-splitter/output/result_
There is 7 lines in file. I'll create 2 files per 3 (Last file may have less)
Start processing.
Finished.
```

The same with DEBUG mode (last parameter set to 1)
```bash
pgrabarczyk@pgrabarczyk:~/git/csv-file-splitter$ bash csv-file-splitter.sh "sample.csv" 3 "result_" 1
source_csv_path: sample.csv
dest_prefix_path: /home/pgrabarczyk/git/csv-file-splitter/output/result_
There is 7 lines in file. I'll create 2 files per 3 (Last file may have less)
Start processing.
Creating file /home/pgrabarczyk/git/csv-file-splitter/output/result_000001.csv with lines [1;4]
Creating file /home/pgrabarczyk/git/csv-file-splitter/output/result_000002.csv with lines [4;7]
Creating file /home/pgrabarczyk/git/csv-file-splitter/output/result_000003.csv with lines [7;10]
Done.
```

Results:
```bash
pgrabarczyk@pgrabarczyk:~/git/csv-file-splitter$ cat output/result_00000{1..3}.csv 
CSVLine,Anything
2,A
3,B
4,C
CSVLine,Anything
5,D
6,E
7,F
CSVLine,Anything
8,G
```


### Tested on:

```bash
$ bash --version
GNU bash, version 5.0.17(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```