ability_demo() ->
    io:format("🎭 GOLDEN EXPERIENCE ABILITY DEMONSTRATION~n"),
    io:format("=========================================~n"),
    
    lists:foreach(
        fun(Ability) ->
            demonstrate_ability(Ability),
            timer:sleep(2000)
        end,
        [life_creation, damage_reflection, life_sense, requiem_awakening]
    ).

demonstrate_ability(life_creation) ->
    io:format("~n✨ GOLDEN: 'Observe! I transform this stone into living flesh!'~n"),
    io:format("🌱 EXPERIENCE: 'The frog moves with natural instinct - my knowledge guides its behavior!'~n");

demonstrate_ability(damage_reflection) ->
    io:format("~n✨ GOLDEN: 'An attack approaches! I create a protective life form!'~n"),
    io:format("🌱 EXPERIENCE: 'The damage is amplified and reflected back - I learned this from previous battles!'~n");

demonstrate_ability(life_sense) ->
    io:format("~n✨ GOLDEN: 'I can feel all living souls in this area...'~n"),
    io:format("🌱 EXPERIENCE: 'And I can distinguish friend from foe based on their intent and experience!'~n");

demonstrate_ability(requiem_awakening) ->
    io:format("~n✨ GOLDEN: 'This power... it transcends normal creation!'~n"),
    io:format("🌱 EXPERIENCE: 'Our combined evolution - infinite experience meeting infinite potential!'~n").