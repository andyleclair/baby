class Cello < Instrument

	LO_NOTE = "c,"
	HI_NOTE = "c'''"

	LO_RANGE 	= %w{ c, d, e, f, g, a, b, c }
	MID_RANGE = %w{ c d e f g a b c' c' d' e' f' g' a' b' c'' }
	HI_RANGE  = %w{ c'' d'' e'' f'' g'' a'' b'' c''' }
	FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

	CLEF = 'bass'
	
	NAME = 'Cello'
end
