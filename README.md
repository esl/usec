usec
====

Convert anything\* to microseconds and back.


Tired of implementing the same timestamp conversion functions in different
projects under different names? I was, and hence this tiny library.


Types
-----

```erlang
megaseconds()   :: non_neg_integer()
seconds()       :: non_neg_integer()
milliseconds()  :: non_neg_integer()
microseconds()  :: non_neg_integer()
now_timestamp() :: {megaseconds(), seconds(), microseconds()}
```    

API
---

```erlang
from_msec/1	% Convert milliseconds() to microseconds().
to_msec/1	% Convert microseconds() to milliseconds().

from_now/1	% Convert now_timestamp() to microseconds().
to_now/1	% Convert microseconds() to now_timestamp().

from_sec/1	% Convert seconds() to microseconds().
to_sec/1	% Convert microseconds() to seconds().
```

Other Info
----------

This project uses [rebar][1] and the awesome [universal erlang makefile][2] by erlware.

  * `make compile` compiles the library
  * `make dialyzer` type-checks the code
  * `make doc` builds the beautiful edoc documentation
  * `make test` runs the unit tests, writes coverage report to
    `.eunit/index.html`


[1]: https://github.com/rebar/rebar
[2]: http://blog.erlware.org/2013/06/04/universal-makefile-for-erlang-projects-that-use-rebar/
