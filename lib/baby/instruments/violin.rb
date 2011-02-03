class Violin

	LO_NOTE = 'g'
	HI_NOTE = "e'''"

	LO_RANGE 	= %w{ g a b c' d' e' f' g' }
	MID_RANGE = %w{ g' a' b' c'' d'' e'' f'' g'' }
	HI_RANGE  = %w{ g'' a'' b'' c''' d''' e''' f''' g''' a''' b''' c'''' d'''' e'''' }
	FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

	CLEF = 'treble'

	def self.range(range= :full)
		case range
			when :low
				LO_RANGE
			when :mid
				MID_RANGE
			when :high
				HI_RANGE
			else
				FULL_RANGE
			end
	end

end
