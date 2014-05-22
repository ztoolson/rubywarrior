class Player

  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    elsif taking_damage?(warrior) and warrior.health < 11
      retreat(warrior)
    elsif taking_damage?(warrior)
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

  def retreat(warrior)
    warrior.walk!(:backward)
  end

  def captive_rescued?
    if @captive_rescued.nil?
      @captive_rescued = 0
    end

    return @captive_rescued < 0
  end
end
