-module(animal).
-export([init/1, handle_senses/1]).

init(Type) ->
    process_flag(trap_exit, true),
    animal_loop(#{
        type => Type,
        senses => [sight, hearing, touch],
        lifespan => calculate_lifespan(Type),
        abilities => get_animal_abilities(Type)
    }).

animal_loop(State = #{type := Type, lifespan := Lifespan}) ->
    receive
        {awaken, StandPid} ->
            StandPid ! {animal_awakened, Type, self()},
            animal_loop(State);
        {command, move, Direction} ->
            io:format("~p moving ~s~n", [Type, Direction]),
            animal_loop(State);
        {soul_probe, From} ->
            Intensity = case Type of
                frog -> 25;
                snake -> 35;
                butterfly -> 15;
                _ -> 20
            end,
            From ! {soul_response, Intensity},
            animal_loop(State);
        {'EXIT', _, _} ->
            io:format("~p life form expires~n", [Type]),
            ok
    after Lifespan ->
        ok
    end.