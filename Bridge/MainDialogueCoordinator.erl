start() ->
    register(conversation_manager, self()),
    GoldenPid = spawn(?MODULE, golden_process, [serene]),
    ExperiencePid = spawn(?MODULE, experience_process, [curious]),
    
    {GoldenPid, ExperiencePid} ! {begin_conversation, self()},
    
    dialogue_loop(GoldenPid, ExperiencePid, []).

dialogue_loop(GoldenPid, ExperiencePid, History) ->
    receive
        {speak, GoldenPid, Message} ->
            io:format("✨ GOLDEN: ~s~n", [Message]),
            timer:sleep(1500),
            ExperiencePid ! {respond, Message},
            dialogue_loop(GoldenPid, ExperiencePid, [{golden, Message}|History]);
        
        {speak, ExperiencePid, Message} ->
            io:format("🌱 EXPERIENCE: ~s~n", [Message]),
            timer:sleep(1500),
            GoldenPid ! {respond, Message},
            dialogue_loop(Golden_Pid, ExperiencePid, [{experience, Message}|History]);
        
        {ability_demonstration, Type} ->
            demonstrate_ability(Type),
            dialogue_loop(GoldenPid, ExperiencePid, History);
        
        end_conversation ->
            io:format("🎭 Stand conversation completed. History: ~p~n", [lists:reverse(History)]),
            ok
    end.