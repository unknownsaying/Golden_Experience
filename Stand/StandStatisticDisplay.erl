stand_stats() ->
    Stats = [
        {power, "A", "95/100"},
        {speed, "A", "95/100"}, 
        {range, "C", "45/100"},
        {durability, "B", "85/100"},
        {precision, "C", "65/100"},
        {potential, "A", "95/100"}
    ],
    
    io:format("~n🏆 GOLDEN EXPERIENCE - STAND STATISTICS~n"),
    io:format("=======================================~n"),
    
    [io:format("~-15s: ~s (~s)~n", [atom_to_list(Name), Rank, Value]) 
     || {Name, Rank, Value} <- Stats],
    
    io:format("~n✨ GOLDEN: 'Our stats reflect our nature - creative power with practical limits!'~n"),
    io:format("🌱 EXPERIENCE: 'But remember, numbers don't capture the wisdom gained through battle!'~n").