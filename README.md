# State Saving Interpreter (SSI)

![D7123F59-111C-4A88-A9BD-5006F7D36E7A](https://user-images.githubusercontent.com/15845542/226259087-0e485e4f-feaa-4bcc-95bc-ac81b31a5994.jpeg)
* White hexagons on a black background.

* With the State Saving Interpreter, users can save states of the interpreter between times and deprecate <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>.

# Getting Started

Please read the following instructions on installing the project on your computer for writing code.

# Prerequisites

* Use a search engine to find the Homebrew (or other) Terminal install command for your platform and install it, and search for the Terminal command to install swipl using Homebrew and install it or download and install SWI-Prolog for your machine at <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a>.

* You may need to install gawk using Homebrew.

* Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in
```
culturaltranslationtool/ctt2.pl
trans_location("../../../gawk/trans").
```
to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>.

# Mac, Linux and Windows (with Linux commands installed): Prepare to run swipl

* In Terminal settings (Mac), make Bash the default shell:

```
/bin/bash
```

* In Terminal, edit the text file `~/.bashrc` using the text editor Nano:

```
nano ~/.bashrc
```

* Add the following to the file `~/.bashrc`:

```
export PATH="$PATH:/opt/homebrew/bin/"
```

* Check if `usr/local/bin` exists

```
ls -ld /usr/local/bin
```

* Create the directory if missing

```
sudo mkdir -p /usr/local/bin
```

* Link to swipl in Terminal

```
sudo ln -s /opt/homebrew/bin/swipl /usr/local/bin/swipl
```

# 1. Install manually

Download <a href="http://github.com/luciangreen/SSI/">this repository</a>, <a href="http://github.com/luciangreen/listprologinterpreter/">List Prolog Interpreter</a> (LPI) and the repositories which LPI is dependent on.  The <a href="https://github.com/luciangreen/Languages"> Languages repository</a> enables SSI to be run in different languages.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
mkdir GitHub
cd GitHub/
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","SSI").
../
halt.
```

# Running

* In Shell:
`cd SSI`
`swipl`
`['ssi'].`    

* You may need to replace `swipl` with `swipl --stack-limit=1G` above to run tests 15 and 25.

# Learn Prolog with SSI

You can learn List Prolog, SSI's programming language at <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/LPI_docs.md">List Prolog Documentation</a>.

# Explanation of what it does

* State Saving Interpreter (SSI), like <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter</a>, runs algorithms in the <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/LPI_docs.md">List Prolog language</a>.  List Prolog algorithms are lists, which can be more easily generated and analysed.  SSI is different because it manually creates and follows choice points (allowing multiple possible solutions like Prolog) unlike List Prolog Interpreter, which relies on Prolog to manage choice points.
* SSI was written to save the states of the Prolog interpreter. 
* It solves the problem of backtracking by saving states.
* It works by manually storing and referring to choice points, records of the variable binding table and recursive states. These include "virtual" commands (commands such as `member2` which compute all results when they are first run). The interpreter loads these choice points as the algorithm encounters flow through predicates, commands and recursion.
* It supports the Higher-Order `call` Command.
* SSI supports `member2`, `stringconcat`, `nested findall`, `cut` and the commands of <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/LPI_docs.md">List Prolog Interpreter</a>.
* SSI will enable running segments of a complex algorithm on a supercomputer and prevent data loss in low-power areas.

# Tests

To run SSI-specific tests, run:
`only_ssi_test(off,NTotal,Score).`

To run all tests (main, types, open and open types) in any language:
```
ssi_test_all00("en",off,NTotal,Score).
ssi_test_all00("en2",off,NTotal,Score).
```
where "en2" is an English language with e.g. `"concatenate strings"` instead of `stringconcat` ("en", or see available <a href="https://github.com/soimort/translate-shell">language codes</a> - see the <a href="https://github.com/luciangreen/Languages"> Languages repository</a> for instructions about how to install different languages).

To run a test from one of the primary, types, open or open types, run one of:
```
ssi_test_all01(test,            4,"en2",off,1,Passed).
ssi_test_all01(test_types_cases,6,"en2",off,1,Passed).
ssi_test_all01(testopen_cases,  3,"en2",off,1,Passed).
ssi_test_all01(test_open_types, 5,"en2",off,1,Passed).
```
where the user should replace 1 with the test number from

* <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4.pl">lpiverify4.pl</a>
* <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_types.pl">lpiverify4_types.pl</a>
* <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_open.pl">lpiverify4_open.pl</a>
* <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_open_types.pl">lpiverify4_open_types.pl</a>

respectively.

* Note 1: drag and drop contents of <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/test_open_and_types_open_data/">test_open_and_types_open_data/</a> into an empty file in BBEdit (Mac) to copy and paste into Terminal for tests with input.

To run all tests (main, types, open and open types) back-translating to and from any language:
```
ssi_test_all_bt00("en2",off,NTotal,Score).
```

To run a test from one of the primary, types, open or open types, run one of:
```
ssi_test_all_bt01(test,            4,"en2",off,1,Passed).
ssi_test_all_bt01(test_types_cases,6,"en2",off,1,Passed).
ssi_test_all_bt01(testopen_cases,  3,"en2",off,1,Passed).
ssi_test_all_bt01(test_open_types, 5,"en2",off,1,Passed).
```
where the user replaces 1 with the test number from

* <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4.pl">lpiverify4.pl</a>
* <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_types.pl">lpiverify4_types.pl</a>
* <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_open.pl">lpiverify4_open.pl</a>
* <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/lpiverify4_open_types.pl">lpiverify4_open_types.pl</a>

respectively.

* See note 1 above.

# SSI Web Service

* A low-code backend web Prolog service.

* After loading `swipl` and `[ssi].`, load State Saving Interpreter to run web apps with `ssi_server(8000).` and go to `http://127.0.0.1:8000` in your browser.

* Modify the application to run, the window's title and background colour in `ssi-api.pl`.

* Before running on your server, change the API key in `api-key(1234567890).` in `ssi-api-key.pl` to a different API key.

* To delete old session files every month, run `swipl ssi-ws.pl` using a scheduler in Linux, i.e. `crontab -e`.

* <a href="https://github.com/luciangreen/Text-to-Breasonings/blob/master/Setting_up_a_VPS_with_TextToBr.txt">Setting_up_a_VPS_with_TextToBr</a> describes how to set up a Virtual Private Server, which can run Prolog over the web.

* SSI Web Service contains few, but central commands for mainly AI-purposes in Prolog.  For more tutorials, see my <a href="https://www.youtube.com/channel/UCWpmrriB-XGpWWpWgReqluQ">Lucian Academy YouTube Channel</a>.

* To comply with browsers' security requirements, only run SSIWS apps with a password screen, as follows:
```
read_password("password")
```
or,
```
[[n, read_password], ["password"]],
```
in List Prolog, where "password" should be changed.

# Documentation

See <a href="https://github.com/luciangreen/listprologinterpreter/blob/master/LPI_docs.md">List Prolog Documentation</a>.

# SSI with Prolog queries

* Run <a href="https://github.com/luciangreen/Philosophy">SSI with Prolog queries</a>.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details.
