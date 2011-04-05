
-record(jobinfo, {jobname :: nonempty_string(),
                  jobfile :: nonempty_string(),
                  jobenvs :: [{nonempty_string(), string()}],
                  force_local :: bool(),
                  force_remote :: bool(),
                  owner :: binary(),
                  inputs :: [binary()] | [[binary()]],
                  worker :: binary(),
                  map :: bool(),
                  max_cores :: non_neg_integer(),
                  nr_reduce :: non_neg_integer(),
                  reduce :: bool()}).
-type jobinfo() :: #jobinfo{}.

-record(nodeinfo, {name :: nonempty_string(),
                   connected :: bool(),
                   blacklisted :: bool(),
                   slots :: non_neg_integer(),
                   num_running :: non_neg_integer(),
                   stats_ok :: non_neg_integer(),
                   stats_failed :: non_neg_integer(),
                   stats_crashed :: non_neg_integer()}).
-type nodeinfo() :: #nodeinfo{}.

-record(task, {chosen_input :: binary() | [binary()],
               force_local :: bool(),
               force_remote :: bool(),
               from :: pid(),
               input :: [{binary(), nonempty_string()}],
               jobenvs :: [{nonempty_string(), string()}],
               worker :: binary(),
               jobname :: nonempty_string(),
               mode :: nonempty_string(), %"map" | "reduce"
               taskid :: non_neg_integer(),
               taskblack :: list(),
               fail_count :: non_neg_integer()}).
-type task() :: #task{}.

