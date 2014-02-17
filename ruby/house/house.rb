class House

  VERSE_MAPPING = {
    12=> {subject: 'horse and the hound and the horn', verb: 'belonged to' },
    11=> {subject: 'farmer sowing his corn',           verb: 'kept' },
    10=> {subject: 'rooster that crowed in the morn',  verb: 'woke' },
    9 => {subject: 'priest all shaven and shorn',      verb: 'married' },
    8 => {subject: 'man all tattered and torn',        verb: 'kissed' },
    7 => {subject: 'maiden all forlorn',               verb: 'milked' },
    6 => {subject: 'cow with the crumpled horn',       verb: 'tossed' },
    5 => {subject: 'dog',                              verb: 'worried' },
    4 => {subject: 'cat',                              verb: 'killed' },
    3 => {subject: 'rat',                              verb: 'ate' },
    2 => {subject: 'malt',                             verb: 'lay in' },
    1 => {subject: 'house',                            verb: 'Jack built' },
  }

  def verse(num)
    lines = num.downto(1).map do |n|
      verse_parts = VERSE_MAPPING[n]
      "#{verse_parts[:subject]} that #{verse_parts[:verb]}"
    end
    "This is the #{lines.join(' the ')}.\n"
  end

  def verses(from, to)
    ( from.upto(to).map { |n| verse(n) }.join "\n" ) + "\n"
  end

end
