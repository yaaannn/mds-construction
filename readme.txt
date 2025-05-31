Prerequisite:
-------------
You are supposed to install SageMath and an SMT solver (e.g., Z3).

File List:
----------
results/
    4_4.py  - 4x4 MDS with n = 4, 8, 16, 32, 64
    5_5.py  - 5x5 MDS with n = 4, 8, 16, 32, 64
    6_6.py  - 6x6 MDS with n = 8, 16, 32, 64
    7_7.py  - 7x7 MDS with n = 8, 16, 32, 64
    8_8.py  - 8x8 MDS with n = 8, 16, 32, 64

smt_file/
    smt_4_4_4bit.smt2   - an example of 4x4 4bit MDS constraints 
    smt_5_5_4bit.smt2   - an example of 5x5 4bit MDS constraints
    smt_6_6_8bit.smt2   - an example of 6x6 8bit MDS constraints
    smt_7_7_8bit.smt2   - an example of 7x7 8bit MDS constraints
    smt_8_8_8bit.smt2   - an example of 8x8 8bit MDS constraints
  
Usage:
------
To check the result, use SageMath's Python interpreter. For example:

    sage --python results/4_4.py

To solve the SMT constraints, use a SMT solver. For example, with Z3:

    z3 smt_file/smt_4_4_4bit.smt2

