# State Saving Interpreter (SSI)

State Saving Interpreter can save states of the interpreter between times (and will deprecate <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>).

# Getting Started

Please read the following instructions on installing the project on your computer for writing code.

# Prerequisites

* Please download and install SWI-Prolog for your machine at `https://www.swi-prolog.org/build/`.

* You may need to install gawk using Homebrew.

* Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in
```
culturaltranslationtool/ctt2.pl
trans_location("../../../gawk/trans").
```
to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>.

# 1. Install manually

Download <a href="http://github.com/luciangreen/SSI/">this repository</a>, <a href="http://github.com/luciangreen/listprologinterpreter/">List Prolog Interpreter</a> (LPI) and the repositories which LPI is dependent on.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","SSI").
halt
```

# Running

* In Shell:
`cd SSI`
`swipl`
`['ssi'].`    

* Running the tests
To run all tests, enter:
`test(2,Q,F,R),lucianpl(off,Q,F,R2)`
where `2` is replaced by the test number (1-194) from <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4.pl">lpiverify4.pl</a>.

# Explanation of what it does

* SSI was written to save states of the Prolog interpreter, to support the retry (reloading of saved states) feature in trace mode. 
* Because it solves the problem of backtracking by saving states, it can form the basis of an online application programming language, which allows access to files and web features.
* It works by manually storing and referring to choice points, records of the variable binding table and recursive states. These include "virtual" commands (commands such as `member` which compute all results when they are first run). The interpreter loads these choice points as the algorithm encounters flow through predicates, commands and recursion.
* It will support the Higher-Order `call` Command, which saves states of multiple interpreters and reloads them when continuing with an interpreter.
* SSI supports `member`, `string_concat`, `nested findall`, `cut` and the commands of <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/LPI_docs.md">List Prolog Interpreter</a>.
* Later SSI may support going backwards, breaking, modifying and correcting code in trace mode.
* SSI will enable running segments of a complex algorithm on a supercomputer and prevent data loss in low-power areas.

# Documentation

See <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/LPI_docs.md">List Prolog Documentation</a>.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details.
