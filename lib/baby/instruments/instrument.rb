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

	def self.generate(params = {})
		notes_per_bar = params[:time].chars.to_a[0].to_i
		bars = params[:bars].to_i
		notes = notes_per_bar * bars
		score = ""
		current_range = range(params[:range])

		puts notes_per_bar
		puts bars
		puts notes

		notes.times do |num|
			score << current_range[rand(current_range.length)] << " "
		end

		score
	end
end
