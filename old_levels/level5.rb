class Player

  def play_turn(warrior)

    if taking_damage?(warrior)
      charge(warrior)
    elsif warrior.feel.empty? and warrior.health < 20
      warrior.rest!
    else
      charge(warrior)
    end

    @health = warrior.health
  end

  def charge(warrior)
    if warrior.feel.empty? # nothing ahead, go ahead and walk
      warrior.walk!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
  end

  def taking_damage?(warrior)
    if @health
      warrior.health < @health
    else
      false
    end
  end
end
