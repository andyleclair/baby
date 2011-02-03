class Instrument
	LO_NOTE = ' '
	HI_NOTE = " "

	LO_RANGE 	= []
	MID_RANGE = []
	HI_RANGE  = []
	FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

	CLEF = 'treble'

	def self.range(range= :full)
		case range
			when :low
				self::LO_RANGE
			when :mid
				self::MID_RANGE
			when :high
				self::HI_RANGE
			else
				self::FULL_RANGE
			end
	end
end
