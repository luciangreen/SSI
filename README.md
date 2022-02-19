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

Download <a href="http://github.com/luciangreen/SSI/">this repository</a>, <a href="http://github.com/luciangreen/listprologinterpreter/">List Prolog Interpreter</a> (LPI) and the repositories which LPI is dependent on.  The <a href="https://github.com/luciangreen/Languages"> Languages repository</a> enables SSI to be run in different languages.

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

* You may need to replace `swipl` with `swipl --stack-limit=1G` above to run tests 15 and 25.

# Explanation of what it does

* SSI was written to save states of the Prolog interpreter. 
* It solves the problem of backtracking by saving states.
* It works by manually storing and referring to choice points, records of the variable binding table and recursive states. These include "virtual" commands (commands such as `member2` which compute all results when they are first run). The interpreter loads these choice points as the algorithm encounters flow through predicates, commands and recursion.
* It supports the Higher-Order `call` Command.
* SSI supports `member2`, `stringconcat`, `nested findall`, `cut` and the commands of <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/LPI_docs.md">List Prolog Interpreter</a>.
* SSI will enable running segments of a complex algorithm on a supercomputer and prevent data loss in low-power areas.

# Tests

To run all tests (main, types, open and open types) in any language:
```
ssi_test_all00("en",off,NTotal,Score).
ssi_test_all00("en2",off,NTotal,Score).
```
where "en2" is an English language with e.g. `"concatenate strings"` instead of `stringconcat` ("en", or see available <a href="https://github.com/soimort/translate-shell">language codes</a> - see the <a href="https://github.com/luciangreen/Languages"> Languages repository</a> for instructions about how to install different languages).

To run a test from one of main, types, open or open types, run one of:
```
ssi_test_all01(test,            4,"en2",off,1,Passed).
ssi_test_all01(test_types_cases,6,"en2",off,1,Passed).
ssi_test_all01(testopen_cases,  3,"en2",off,1,Passed).
ssi_test_all01(test_open_types, 5,"en2",off,1,Passed).
```
where 1 is replaced with the test number from

<a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4.pl">lpiverify4.pl</a>
<a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_types.pl">lpiverify4_types.pl</a>
<a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_open.pl">lpiverify4_open.pl</a>
<a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_open_types.pl">lpiverify4_open_types.pl</a>

respectively.

* Note 1: drag and drop contents of <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/test_open_and_types_open_data/">test_open_and_types_open_data/</a> into an empty file in BBEdit (Mac) to copy and paste into Terminal for tests with input.

To run all tests (main, types, open and open types) back-translating to and from any language:
```
ssi_test_all_bt00("en2",off,NTotal,Score).
```

To run a test from one of main, types, open or open types, run one of:
```
ssi_test_all_bt01(test,            4,"en2",off,1,Passed).
ssi_test_all_bt01(test_types_cases,6,"en2",off,1,Passed).
ssi_test_all_bt01(testopen_cases,  3,"en2",off,1,Passed).
ssi_test_all_bt01(test_open_types, 5,"en2",off,1,Passed).
```
where 1 is replaced with the test number from

<a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4.pl">lpiverify4.pl</a>
<a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_types.pl">lpiverify4_types.pl</a>
<a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_open.pl">lpiverify4_open.pl</a>
<a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_open_types.pl">lpiverify4_open_types.pl</a>

respectively.

* See note 1 above.

# SSI Web Service

* After loading `swipl` and `[ssi].`, load State Saving Interpreter to run web apps with `ssi_server(8000).` and go to `http://127.0.0.1:8000` in your browser.

* Modify application to run, title of window and background colour in `ssi-api.pl`.

# Documentation

See <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/LPI_docs.md">List Prolog Documentation</a>.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details.
