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
		
	NAME = 'Piano'
	
	def self.generate(params = {})
		treb_notes = generate_notes(params.merge({:range => 'mid'}))
		bass_notes = generate_notes(params.merge({:range => 'low'}))

		<<PIANO
\\new PianoStaff <<
	\\new Staff { 
        \\clef treble
	#{ treb_notes  } 
	}
	\\new Staff { 
	\\clef bass 
	#{ bass_notes } 
	}
>>
PIANO
	end

end
