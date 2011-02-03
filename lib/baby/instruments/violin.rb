class Violin < Instrument

	LO_NOTE = 'g'
	HI_NOTE = "e'''"

	LO_RANGE 	= %w{ g a b c' d' e' f' g' }
	MID_RANGE = %w{ g' a' b' c'' d'' e'' f'' g'' }
	HI_RANGE  = %w{ g'' a'' b'' c''' d''' e''' f''' g''' a''' b''' c'''' d'''' e'''' }
	FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

	CLEF = 'treble'


end
