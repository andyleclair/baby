class Options

	attr_reader :instrument, :time_sig, :key, :length, :difficulty

	def initialize(instrument = 'soprano recorder', 
								 time_sig = '4/4', 
                 key = 'C major', 
								 length = 32, 
								 difficulty = 20)
		@instrument = instrument
		@time_sig = time_sig
		@key = key
		@length = length
		@difficulty = difficulty
	end
end
