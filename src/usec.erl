-module(usec).

-export([from_now/1, to_now/1,
        from_sec/1, to_sec/1,
        from_msec/1, to_msec/1
        ]).

-define(MILLION, 1000000).

-type megaseconds()   :: non_neg_integer().
-type seconds()       :: non_neg_integer().
-type milliseconds()  :: non_neg_integer().
-type microseconds()  :: non_neg_integer().
-type now_timestamp() :: {megaseconds(), seconds(), microseconds()}.

%% @doc Convert {@type now_timestamp()} to {@type microseconds()}.
-spec from_now(now_timestamp()) -> microseconds().
from_now({MegaSecs,Secs,Usecs}) ->
    (MegaSecs * ?MILLION + Secs) * ?MILLION + Usecs.

%% @doc Convert {@type microseconds()} to {@type now_timestamp()}.
-spec to_now(microseconds()) -> now_timestamp().
to_now(Usecs) ->
    {Usecs div (?MILLION * ?MILLION),
     Usecs div ?MILLION rem ?MILLION,
     Usecs rem ?MILLION}.

%% @doc Convert {@type seconds()} to {@type microseconds()}.
-spec from_sec(seconds()) -> microseconds().
from_sec(Secs) -> Secs * ?MILLION.

%% @doc Convert {@type microseconds()} to {@type seconds()}.
-spec to_sec(microseconds()) -> seconds().
to_sec(Usecs)     -> Usecs div ?MILLION.

%% @doc Convert {@type milliseconds()} to {@type microseconds()}.
-spec from_msec(milliseconds()) -> microseconds().
from_msec(MilliSecs) -> MilliSecs * 1000.

%% @doc Convert {@type microseconds()} to {@type milliseconds()}.
-spec to_msec(microseconds()) -> milliseconds().
to_msec(Usecs)          -> Usecs div 1000.
