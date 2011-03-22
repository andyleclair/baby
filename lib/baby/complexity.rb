class Complexity
  attr_accessor :pitch_delta, :len_probs # [whole,half,quarter,eighth,sixteeth]

  def self.from_index(n)
    c = Complexity.new
    if n < 21
      c.pitch_delta = 2
      c.len_probs = [0.2,0.2,0.6,0,0]
    elsif n < 51
      c.pitch_delta = 4
      c.len_probs = [0.1,0.1,0.6,0.2,0]
    elsif n < 81
      c.pitch_delta = 8
      c.len_probs = [0.05,0.05,0.5,0.25,0.05]
    else
      c.pitch_delta = 10
      c.len_probs = [0.05,0.05,0.35,0.35,0.1]
    end
    c
  end

end
