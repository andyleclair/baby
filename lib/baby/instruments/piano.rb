class Piano < Instrument

  LO_NOTE = "a,,,"
  HI_NOTE = "c'''''"

  o0 = %w{ a,,, ais,,, b,,, }
  o1 = %w{ c,, cis,, d,, dis,, e,, f,, fis,, g,, gis,, a,, ais,, b,, }
  o2 = %w{ c, cis, d, dis, e, f, fis, g, gis, a, ais, b, }
  o3 = %w{ c cis d dis e f fis g gis a ais b }
  o4 = %w{ c' cis' d' dis' e' f' fis' g' gis' a' ais' b' }
  o5 = %w{ c'' cis'' d'' dis'' e'' f'' fis'' g'' gis'' a'' ais'' b'' }
  o6 = %w{ c''' cis''' d''' dis''' e''' f''' fis''' g''' gis''' a''' ais''' b''' }
  o7 = %w{ c'''' cis'''' d'''' dis'''' e'''' f'''' fis'''' g'''' gis'''' a'''' ais'''' b'''' }
  o8 = %w{ c''''' }

  LO_RANGE  = o0 + o1 + o2
  MID_RANGE = o3 + o4 + o5
  HI_RANGE  = o6 + o7 + o8

  FULL_RANGE = LO_RANGE + MID_RANGE + HI_RANGE

  BASIC_BASS = o2 + o3
  BASIC_TREB = o4 + o5

  NAME = 'Piano'

  def self.generate(params = {})
    treb_notes = Music.generate_notes(params.merge({:notes => BASIC_TREB}))
    bass_notes = Music.generate_notes(params.merge({:notes => BASIC_BASS}))

    header = self.staff_header(params)

    <<-PIANO
\\new PianoStaff <<
  \\new Staff { 
    \\clef treble
    #{ header }
    #{ treb_notes  }
  }
  \\new Staff { 
    \\clef bass 
    #{ header }
    #{ bass_notes }
  }
>>
    PIANO
  end

end
