#Zorba.js - Zorba Compiled to JavaScript

This project provides tooling to compile the Zorba XQuery Processor (http://www.zorba-xquery.com/) to JavaScript using Emscripten (http://emscripten.org).
This repository contains a version of libxml2 and libzorba compiled to LLVM bytecode.

##Dependencies
* LLVM 3.2 (http://llvm.org/releases/)
* Emscriptem (http://emscripten.org)

##How to compile it?
The` build.sh` script compiles `src/zorba.cpp` to JavaScript.
Simply execute the script with the `LLVM` and `EMSCRIPTEN` variables:
```bash
$ LLVM=/path/to/llvm/bin EMSCRIPTEN=/path/to/emscripten ./build.sh
```

`build_debug.sh` is identical to `build.sh` but produces a debuggable output.

##How to build dependencies?
###Libxml2
Tutorial on how to build libxml2 to llvm bytecode is available at http://mozakai.blogspot.fr/2012/03/howto-port-cc-library-to-javascript.html
###Zorba
Checkout Zorba LLVM branch:
```bash
$ bzr branch lp:~zorba-coders/zorba/llvm
```
To build
```bash
$ LLVM=/path/to/llvm/bin EMSCRIPTEN=/path/to/emscripten ./build_zorba.sh
```

