class BeerSong

  def verse(n)
"""#{bottles_of_beer(n, wall: true).capitalize}, #{bottles_of_beer n}.
#{action n}, #{bottles_of_beer (n === 0 ? 99 : n-1), wall: true}.
"""
  end

  def verses(first, last)
    first.downto(last).map{ |n| verse n }.join("\n") + "\n"
  end

  def sing
    verses 99, 0
  end

  private

  def bottles_of_beer(n, **opts)
    n = 'no more' if n === 0
    "#{n} bottle#{'s' unless n === 1} of beer#{' on the wall' if opts[:wall]}"
  end

  def action(n)
    case n
    when 0
      "Go to the store and buy some more"
    when 1
      "Take it down and pass it around"
    else
      "Take one down and pass it around"
    end
  end

end
