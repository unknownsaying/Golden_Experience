%% Main Stand process - Life Giver ability
life_giver(InanimateObject) when is_tuple(InanimateObject) ->
    spawn(fun() -> 
        {ok, LifeForm} = create_life(InanimateObject),
        LifeForm ! {awaken, self()},
        monitor_life(LifeForm)
    end).

create_life({object, Material}) ->
    case Material of
        rock -> spawn_animal(frog);
        metal -> spawn_animal(snake);
        plastic -> spawn_animal(butterfly);
        wood -> spawn_plant(tree);
        _ -> spawn_animal(default)
    end;
create_life({plant, damaged}) ->
    {ok, spawn_plant(healed)};
create_life(_) ->
    {error, cannot_create_life}.

spawn_animal(Type) ->
    Pid = spawn(animal, init, [Type]),
    {ok, Pid}.

spawn_plant(Type) ->
    Pid = spawn(plant, init, [Type]),
    {ok, Pid}.