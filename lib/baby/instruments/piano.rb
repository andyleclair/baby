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

	LO_RANGE = o0.concat(o1)
	MID_RANGE = o2.concat(o3).concat(o4)
	HI_RANGE = o5.concat(o6).concat(o7).concat(o8)
	
	FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)
		
	NAME = 'Piano'
	
	CLEF = 'piano'

end