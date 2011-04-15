class Complexity
  attr_accessor :pitch_delta, :len_probs 
  
  # Defines difficulty levels.

  # :pitch_delta : upper limit (natural)
  #   :len_probs : [whole,half,quarter,eighth,sixteeth]

  def self.from_index(n)
    c = Complexity.new
    if n < 21
      c.pitch_delta = 2
      c.len_probs = [0.5,0.4,0.1,0,0]
    elsif n < 51
      c.pitch_delta = 4
      c.len_probs = [0.3,0.45,0.2,0.05,0]
    elsif n < 81
      c.pitch_delta = 8
      c.len_probs = [0.05,0.1,0.5,0.2,0.05]
    else
      c.pitch_delta = 10
      c.len_probs = [0.05,0.05,0.35,0.35,0.1]
    end
    c
  end

end
