class Complexity
  attr_accessor :len_probs

  def self.from_index(n)
    c = Complexity.new
    if n < 21
      c.len_probs = [0.2,0.2,0.6,0]
    elsif n < 51
      c.len_probs = [0.1,0.1,0.6,0.2]
    elsif n < 81
      c.len_probs = [0.05,0.05,0.5,0.3]
    else
      c.len_probs = [0.05,0.05,0.4,0.4]
    end
    c
  end

end
