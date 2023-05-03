# CS 155 Problem Set 2 - Lexical Analyzer using Flex

This implementation of the Lexical Analyzer using Flex was created by John Miguel Choa in partial fulfillment of the academic requirements for the course CS 155 (Compiler Construction) of the 2nd Semester, AY 2022-2023.

## Flex Installation
- [Windows](https://www.geeksforgeeks.org/how-to-install-flex-on-windows/)
- [Ubuntu](https://www.howtoinstall.me/ubuntu/18-04/flex/)
- [Mac OS X using Homebrew](https://formulae.brew.sh/formula/flex)
- [Mac OS X using MacPorts](https://ports.macports.org/port/flex/)

## GCC Installation
- [Windows](https://youtu.be/k6juv3mIr9o)
- [Mac OS](https://cs.millersville.edu/~gzoppetti/InstallingGccMac.html)
- [Linux](https://www.geeksforgeeks.org/how-to-install-gcc-compiler-on-linux/)

## Usage
Run the following commands:
1. `flex easy.flex`
2. `gcc lex.yy.c`
    - If that doesn't work, try one of the following commands:
        - (on Mac OS X) `gcc lex.yy.c -ll`
        - (on Linux) `gcc lex.yy.c -lfl`
3. Run the executable on the test file:
    - (on Windows) `a.exe <test_file.easy>`
    - (on Mac / Linux) `./a.out <test_file.easy>`

### Sample (Windows)
```
flex easy.flex
gcc lex.yy.c
a.exe .\test_files\reserved_test.easy
```