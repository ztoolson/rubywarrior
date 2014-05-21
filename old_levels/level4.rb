class Player
  @health = -1

  def play_turn(warrior)
    puts "health variable at start of turn #{@health}\n" 
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
    if warrior.feel.empty?
      warrior.walk!
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
