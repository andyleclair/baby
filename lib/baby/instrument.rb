class Instrument

  # unused for now
  LO_NOTE = nil
  HI_NOTE = nil

  LO_RANGE   = nil
  MID_RANGE  = nil
  HI_RANGE   = nil
  FULL_RANGE = nil

  CLEF = nil

  @@last_pitch = ''
  last_length = ''

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

  def self.generate_notes(params = {})
    notes_per_bar = params[:time_sig][0].chr.to_i
    bars = params[:length].to_i
    score = ""
    current_range = params[:notes] # pased directly; array of symbols
    complexity = Complexity.from_index(params[:difficulty])
    bars.times do |num|
      score << generate_measure(notes_per_bar,current_range,complexity);
      score << "\n    " unless num+1 == bars
    end

    score
  end

  def self.generate_measure(notes_per_bar = 0.0, notes = {}, complexity = {})
    measure = ""
    @@last_pitch = rand(notes.length) if @@last_pitch == ''
    while notes_per_bar > 0.0 do
      pitchnum = rand(complexity.pitch_delta)
      pitchnum = (pitchnum * -1) if rand(0) < 0.5
      @@last_pitch = @@last_pitch + pitchnum
      @@last_pitch = notes.length-1 if @@last_pitch > (notes.length-1)
      @@last_pitch = 0 if @@last_pitch < 0
      pitch = notes[@@last_pitch]
      length = generate_length(complexity.len_probs)

      length = 1.0 if length > notes_per_bar
      length = 0.5 if length > notes_per_bar # just a hack for now
      length = 0.25 if length > notes_per_bar

      measure << pitch << qtimeof(length).to_s << " "

      notes_per_bar = notes_per_bar.to_f - length.to_f
    end

    measure
  end

  def self.generate_length(probs)
    r = rand(0)
    # result = "length, in number of quarter notes time"

    if r < probs[0]
      4.0
    elsif r < (probs[1]+probs[0])
      2.0
    elsif r < (probs[2]+probs[1]+probs[0])
      1.0
    elsif r < (probs[3]+probs[2]+probs[1]+probs[0])
      0.5
    else
      0.25
    end

  end

  def self.qtimeof(time)
    (4.0*(1.0/time)).to_i
  end
end
