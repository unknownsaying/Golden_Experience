%% Main execution function
run_stand_conversation() ->
    io:format("🎭 INITIATING GOLDEN EXPERIENCE STAND DIALOGUE~n"),
    io:format("=============================================~n~n"),
    
    %% Start the core conversation
    begin_dialogue(),
    
    timer:sleep(2000),
    
    %% Show abilities in action
    ability_demo(),
    
    timer:sleep(2000),
    
    %% Display stand capabilities
    stand_stats(),
    
    io:format("~n🎭 GOLDEN & EXPERIENCE: 'We are one Stand - two aspects of the same power!'~n").

%% Emotion update functions
update_emotion(Msg, CurrentEmotion) ->
    case string:find(Msg, "battle") orelse string:find(Msg, "attack") of
        true -> protective;
        false -> 
            case string:find(Msg, "create") orelse string:find(Msg, "life") of
                true -> passionate;
                false -> serene
            end
    end.

update_experience_emotion(Msg, CurrentEmotion) ->
    case string:find(Msg, "soul") orelse string:find(Msg, "creation") of
        true -> curious;
        false ->
            case string:find(Msg, "protect") orelse string:find(Msg, "danger") of
                true -> protective;
                false -> serene
            end
    end.