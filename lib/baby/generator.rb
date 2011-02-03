class Generator

	DEFAULTS = {
		:instrument => 'violin',
		:complexity => 20,
		:key 		=> 'CMaj',
		:bars 	=> 16,
		:tempo 	=> 90,
		:style 	=> 'classical',
		:range 	=> 'mid',
		:time		=> '4/4'
	}

	def self.run!(*args)
		inname, outname = args
		
		generate!(outname)
	end

	def self.generate!(outfile)
		classname = DEFAULTS[:instrument].to_s.capitalize
		instrument = Kernel.const_get(classname)
		File.open(outfile, 'w') do |f|
			f.write LilyPond::create_doc(DEFAULTS, instrument)
		end
	end
end
