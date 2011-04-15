class Instrument

  LO_NOTE = nil
  HI_NOTE = nil

  LO_RANGE   = nil
  MID_RANGE  = nil
  HI_RANGE   = nil
  FULL_RANGE = nil

  CLEF = nil

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

  # override me for special Instruments
  def self.generate(options = {})
    staff_header = self.staff_header(options)
    notes = Music.generate_notes(options.merge({:notes => range('full')}))
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
    "\\key #{ keystring }"
  end

end
