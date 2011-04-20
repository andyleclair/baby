class Key
  A = %w{ a b cis d e fis gis }
  B = %w{ b cis dis e fis gis ais }
  C = %w{ c d e f g a b }
  D = %w{ d e fis g a b cis }
  E = %w{ e fis gis a b cis dis }
  F = %w{ f g a bes c d e }
  G = %w{ g a b c d e fis }
  def self.scale(key = "C") 
    key = key.downcase
    key = key[0,1]
    case key
    when 'a'
      self::A
    when 'b'
      self::B
    when 'c'
      self::C
    when 'd'
      self::D
    when 'e'
      self::E
    when 'f'
      self::F
    when 'g'
      self::G
    else
      self::C
    end
  end
end
