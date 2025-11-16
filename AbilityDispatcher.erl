%% Pattern matching for different Golden Experience abilities
ability_dispatcher(Command) ->
    case Command of
        {create, Object} when is_tuple(Object) ->
            golden_experience:life_giver(Object);
        {sense, Target} ->
            golden_experience:sense_life(Target);
        {reflect, Attack} ->
            golden_experience:damage_reflection(Attack);
        {heal, Target, damaged} ->
            heal_life_form(Target);
        {evolve, Requiem} when Requiem =:= true ->
            golden_experience_requiem:activate();
        _ ->
            {error, unknown_ability}
    end.

heal_life_form(Target) ->
    Target ! {healing, self()},
    receive
        {healing_response, Result} -> Result
    after 500 -> {error, no_response}
    end.