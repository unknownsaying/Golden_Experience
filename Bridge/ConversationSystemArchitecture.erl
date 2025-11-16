-module(golden_experience_conversation).
-export([start/0, begin_dialogue/0, golden_process/1, experience_process/1]).
-export([stand_stats/0, ability_demo/0]).

%% Message types for Stand communication
-type dialogue_type() :: philosophical | combat | creation | reflection.
-type emotion() :: serene | passionate | curious | protective.

-record(dialogue, {
    speaker :: atom(),
    message :: string(),
    emotion :: emotion(),
    ability_trigger :: atom() | undefined
}).