# csv-file-splitter
Split CSV file into many.

Example usage:

```bash
# Split "sample.csv" to files. Each output file should have 3 lines (+header) and be named with prefix "result_".
pgrabarczyk@pgrabarczyk:~/git/csv-file-splitter$ bash csv-file-splitter.sh "sample.csv" 3 "result_" 
2022-02-06 23:56:07.747 - source_csv_path: sample.csv
2022-02-06 23:56:07.749 - dest_prefix_path: /home/pgrabarczyk/git/csv-file-splitter/output/result_
2022-02-06 23:56:07.755 - There is 7 lines in file. I'll create 2 files per 3 (Last file may have less)
2022-02-06 23:56:07.756 - Start processing.
2022-02-06 23:56:07.761 - Done.
```

The same with DEBUG mode (last parameter set to 1)
```bash
pgrabarczyk@pgrabarczyk:~/git/csv-file-splitter$ bash csv-file-splitter.sh "sample.csv" 3 "result_" 1
2022-02-06 23:54:57.059 - source_csv_path: sample.csv
2022-02-06 23:54:57.060 - dest_prefix_path: /home/pgrabarczyk/git/csv-file-splitter/output/result_
2022-02-06 23:54:57.066 - There is 7 lines in file. I\'ll create 2 files per 3 (Last file may have less)
2022-02-06 23:54:57.067 - Start processing.
2022-02-06 23:54:57.070 - Creating file /home/pgrabarczyk/git/csv-file-splitter/output/result_000001.csv with lines [1;4]
2022-02-06 23:54:57.072 - Creating file /home/pgrabarczyk/git/csv-file-splitter/output/result_000002.csv with lines [4;7]
2022-02-06 23:54:57.074 - Creating file /home/pgrabarczyk/git/csv-file-splitter/output/result_000003.csv with lines [7;10]
2022-02-06 23:54:57.076 - Done.

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

### Sample performance (local computer)

40seconds to split 188MB file into 888 smaller:
```bash
2022-02-06 23:56:33.662 - There is 88884 lines in file. I\'ll create 888 files per 100 (Last file may have less)
2022-02-06 23:56:33.663 - Start processing.
2022-02-06 23:57:14.425 - Done.
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