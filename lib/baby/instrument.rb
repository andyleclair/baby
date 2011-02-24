class Instrument
	LO_NOTE = ' '
	HI_NOTE = " "

	LO_RANGE 	= []
	MID_RANGE = []
	HI_RANGE  = []
	FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

	CLEF = 'treble'

	NAME = 'derp!'

	def self.range(range= :full)
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

	def self.generate_notes(params = {})
		notes_per_bar = params[:time][0].chr.to_i
		bars = params[:bars].to_i
		notes = notes_per_bar * bars
		score = ""
		current_range = range(params[:range])

		notes.times do |num|
			score << "" << current_range[rand(current_range.length)] << " "
			if (num + 1) % notes_per_bar == 0 
				score << "\n\t"
			end
		end

		score
	end
end
