cl-restapi-demo
===============

This is a common lisp implementation of average price calculator for the past X days.  The average being used is the average of high mid and low mid.  The implementation relies on [OANDA API](https://github.com/oanda/apidocs) for rates.

Dependency
----------
* Compiler used is [SBCL](http://www.sbcl.org/).
* JSON parsing is done in [cl-json](http://common-lisp.net/project/cl-json/).
* HTTP requests are made with [drakma](http://weitz.de/drakma/).

Setup
-----
* The implementation was done on SBCL, its home page has information on how to install.
* You can get [quicklisp](http://www.quicklisp.org/) to manage the dependencies for you.  The two packages you need are "cl-json" and "drakma". 

```commonlisp
  * (quicklisp-quickstart:install)
  * (ql:quickload "cl-json")
  * (ql:quickload "drakma")
  * (ql:add-to-init-file)
```