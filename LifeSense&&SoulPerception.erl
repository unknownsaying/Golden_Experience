%% Life Sensing Ability
sense_life(Target) ->
    case detect_soul_presence(Target) of
        {soul_present, Intensity} when Intensity > 50 ->
            {conscious_life, Target, Intensity};
        {soul_present, Intensity} when Intensity > 20 ->
            {animal_life, Target, Intensity};
        {soul_present, _} ->
            {plant_life, Target};
        no_soul ->
            {inanimate, Target}
    end.

detect_soul_presence(Target) ->
    %% Simulate soul detection through Erlang process messaging
    Target ! {soul_probe, self()},
    receive
        {soul_response, Intensity} -> {soul_present, Intensity};
        _ -> no_soul
    after 1000 -> no_soul
    end.