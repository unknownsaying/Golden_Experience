%% Damage Reflection - Golden Experience's defensive capability
damage_reflection(Damage) ->
    receive
        {attack, Attacker, DamageType, Amount} ->
            ReflectedDamage = calculate_reflection(DamageType, Amount),
            Attacker ! {damage_reflected, ReflectedDamage, self()},
            damage_reflection(ReflectedDamage);
        stop ->
            ok
    end.

calculate_reflection(DamageType, Amount) ->
    Multiplier = case DamageType of
        physical -> 1.5;    % Physical attacks get amplified reflection
        energy -> 1.2;      % Energy attacks
        spiritual -> 2.0    % Stand attacks get strongest reflection
    end,
    round(Amount * Multiplier).