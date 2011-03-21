class Instrument

  # unused for now
  LO_NOTE = nil
  HI_NOTE = nil

  LO_RANGE   = nil
  MID_RANGE  = nil
  HI_RANGE   = nil
  FULL_RANGE = nil

  CLEF = nil

  NAME = nil

  def self.range(range = 'full')
    case range
    when 'low'
      self::LO_RANGE
    when 'mid'
      self::MID_RANGE
    when 'high'
      self::HI_RANGE
    else
      self::FULL_RANGE
    end
  end

  def self.generate(options = {})
    staff_header = self.staff_header(options)
    notes = generate_notes(options.merge({:notes => range('full')}))
    <<-NOTES
    \\new Staff {
      \\clef "#{ self::CLEF }"
      #{ staff_header } 
      #{ notes }
    }
    NOTES
  end

  def self.staff_header(options = {})
    keystring = options[:key][:key]
    keystring += " \\" + options[:key][:mode] if options[:key][:mode]
    <<-HEADER
    \\key #{ keystring }
    \\time #{ options[:time_sig] }
    HEADER
  end

  def self.generate_notes(options = {})
    notes_per_bar = options[:time_sig][0].chr.to_i
    bars = options[:length].to_i
    score = ""
    current_range = options[:notes] # pased directly; array of symbols
    bars.times do |num|
      score << generate_measure(notes_per_bar,current_range, options)
      score << "\n    " unless num+1 == bars
    end
    score
  end

  def self.generate_measure(notes_per_bar = 0.0, notes = self::FULL_RANGE, options = {})
    measure = ""
    measure_notes = []
    while notes_per_bar > 0.0 do
      pitch = notes[rand(notes.length)]
      length = generate_length(options[:difficulty])

      length = notes_per_bar.to_f if length > notes_per_bar # just a hack for now
      
      measure_notes << pitch
      measure << pitch << qtimeof(length).to_s << " "

      notes_per_bar = notes_per_bar.to_f - length.to_f
    end

    measure
  end

  def self.generate_length(difficulty)
    r = rand * difficulty
    # result = "length, in number of quarter notes time"
    if r < 5.0
      4.0
    elsif r < 15.0
      2.0
    elsif r < 50.0
      1.0
    elsif r < 60.0
      0.5
    else
      0.25
    end
  end

  def self.qtimeof(time)
    (4.0*(1.0/time)).to_i
  end
end
