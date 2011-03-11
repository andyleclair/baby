class Options

	attr_reader :instrument, :time_sig, :key, :length, :difficulty

	def initialize instrument, time_sig, key, length, difficulty
		@instrument = instrument
		@time_sig = time_sig
		@key = key
		@length = length
		@difficulty = difficulty
	end
end
