%% Golden Experience Stand Process Manager
init(Stats) ->
    {ok, #golden_experience{
        power = Stats#golden_experience.power,
        speed = Stats#golden_experience.speed,
        range = Stats#golden_experience.range,
        durability = Stats#golden_experience.durability,
        precision = Stats#golden_experience.precision,
        potential = Stats#golden_experience.potential
    }}.

handle_call({create_life, Object}, _From, State) ->
    {Reply, NewState} = case create_life(Object) of
        {ok, LifePid} -> 
            {{ok, LifePid}, State};
        Error -> 
            {Error, State}
    end,
    {reply, Reply, NewState};

handle_call({sense_life, Target}, _From, State) ->
    Result = sense_life(Target),
    {reply, Result, State};

handle_call(get_stats, _From, State) ->
    {reply, State, State}.

handle_cast({reflect_damage, DamageData}, State) ->
    spawn(?MODULE, damage_reflection, [DamageData]),
    {noreply, State}.