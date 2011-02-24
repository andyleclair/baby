class AltoRecorder < Instrument

	LO_NOTE = "f"
	HI_NOTE = "g''"

	LO_RANGE 	= %w{ f g a b c' d' e' f' }
	MID_RANGE = %w{ f' g' a' b' c'' d'' e'' f'' }
	HI_RANGE  = %w{ f'' g'' }
	FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

	CLEF = 'tenor'
	
	NAME = 'AltoRecorder'
end
