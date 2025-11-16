experience_process(Emotion) ->
    receive
        {begin_conversation, Manager} ->
            timer:sleep(1000),
            Manager ! {speak, self(), "And I am the wisdom gained through action, the lessons of reality..."},
            experience_loop(Manager, curious);
        
        {respond, GoldenMsg} ->
            Manager = whereis(conversation_manager),
            Response = generate_experience_response(GoldenMsg, Emotion),
            Manager ! {speak, self(), Response},
            experience_loop(Manager, update_experience_emotion(GoldenMsg, Emotion))
    end.

generate_experience_response(GoldenMsg, Emotion) ->
    case {string:find(GoldenMsg, "soul"), Emotion} of
        {nomatch, curious} -> practical_responses();
        {nomatch, protective} -> defensive_responses();
        {_, serene} -> analytical_responses();
        {_, passionate} -> combat_experience_responses()
    end.

practical_responses() ->
    Choices = [
        "But creation without purpose is chaos. What meaning does this life hold?",
        "I've learned that every action creates ripples - some healing, some destructive...",
        "The battlefield teaches harsh lessons about the value of the lives we create."
    ],
    lists:nth(random:uniform(length(Choices)), Choices).

analytical_responses() ->
    Choices = [
        "I sense the attacker's intentions - their rage creates openings we can exploit...",
        "This damage reflection works because I understand the nature of their aggression!",
        "Let me analyze the opponent's fighting style - experience reveals patterns!"
    ],
    lists:nth(random:uniform(length(Choices)), Choices).