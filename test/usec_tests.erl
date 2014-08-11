-module(usec_tests).
-include_lib("proper_eunit/include/pt_proper_eunit.hrl").

from_sec0_test() ->
    ?assertEqual(0, usec:from_sec(0)).
from_sec1_test() ->
    ?assertEqual(1000*1000, usec:from_sec(1)).

to_sec0_test() ->
    ?assertEqual(0, usec:to_sec(0)).
to_sec1_test() ->
    ?assertEqual(1, usec:to_sec(1000*1000)).
to_sec_truncation1_test() ->
    ?assertEqual(1, usec:to_sec(1000*1000+499)).
to_sec_truncation2_test() ->
    ?assertEqual(1, usec:to_sec(1000*1000+999)).

from_now0_test() ->
    ?assertEqual(0, usec:from_now({0,0,0})).
from_now1_test() ->
    ?assertEqual(1000, usec:from_now({0,0,1000})).
from_now2_test() ->
    ?assertEqual(1000*1000, usec:from_now({0,1,0})).
from_now3_test() ->
    ?assertEqual(1000*1000*1000*1000,
                 usec:from_now({1,0,0})).
from_now4_test() ->
    ?assertEqual(1000*1000*1000*1000 + 1000*1000 + 1,
                 usec:from_now({1,1,1})).

to_now0_test() ->
    ?assertEqual({0,0,0}, usec:to_now(0)).
to_now1_test() ->
    ?assertEqual({0,0,1}, usec:to_now(1)).
to_now2_test() ->
    ?assertEqual({0,1,0}, usec:to_now(1000*1000)).
to_now3_test() ->
    ?assertEqual({1,0,0}, usec:to_now(1000*1000*1000*1000)).
to_now4_test() ->
    ?assertEqual({1,1,1}, usec:to_now(1000*1000*1000*1000 + 1000*1000 + 1)).


from_msec_test() ->
    ?assertEqual(1000, usec:from_msec(1)).

to_msec_test() ->
    ?assertEqual(1, usec:to_msec(1000)).
to_msec_truncation0_test() ->
    ?assertEqual(1, usec:to_msec(1001)).
to_msec_truncation1_test() ->
    ?assertEqual(1, usec:to_msec(1999)).


%% Is one of these redundant?
prop_no_loss_to_from_now() ->
    ?FORALL(T, non_neg_integer(),
            T =:= usec:from_now(usec:to_now(T))).

prop_no_loss_from_to_now() ->
    ?FORALL(ET, {non_neg_integer(), non_neg_integer(), non_neg_integer()},
            ET =:= usec:to_now(usec:from_now(ET))).
