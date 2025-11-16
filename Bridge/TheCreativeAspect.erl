golden_process(Emotion) ->
    receive
        {begin_conversation, Manager} ->
            Manager ! {speak, self(), "I am the spark of creation, the giver of life..."},
            golden_loop(Manager, passionate);
        
        {respond, ExperienceMsg} ->
            Manager = whereis(conversation_manager),
            Response = generate_golden_response(ExperienceMsg, Emotion),
            Manager ! {speak, self(), Response},
            golden_loop(Manager, update_emotion(ExperienceMsg, Emotion))
    end.

generate_golden_response(ExperienceMsg, Emotion) ->
    case {string:find(ExperienceMsg, "life"), Emotion} of
        {nomatch, serene} -> philosophical_responses();
        {nomatch, passionate} -> combat_responses();
        {_, curious} -> creation_responses();
        {_, protective} -> reflection_responses()
    end.

philosophical_responses() ->
    Choices = [
        "Life is not merely existence, but the potential for growth and change...",
        "Every living thing contains a soul - can you feel their consciousness?",
        "Creation is not about power, but about understanding the essence of being..."
    ],
    lists:nth(random:uniform(length(Choices)), Choices).

creation_responses() ->
    Choices = [
        "Watch as I breathe life into the inanimate world around us!",
        "This frog was once cold stone - now it pulses with vital energy!",
        "Can you sense the soul awakening within this created life?"
    ],
    lists:nth(random:uniform(length(Choices)), Choices).