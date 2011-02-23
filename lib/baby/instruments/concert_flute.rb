class ConcertFlute < Instrument

	LO_NOTE = 'c''
	HI_NOTE = "d''''"

	LO_RANGE 	= %w{ c'' d'' e'' f'' g'' a'' b'' c''' }
	MID_RANGE = %w{ c''' d''' e''' f''' g''' a''' b''' c'''' }
	HI_RANGE  = %w{ c'''' d'''' }
	FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

	CLEF = 'treble'
	
	NAME = 'ConcertFlute'
end
