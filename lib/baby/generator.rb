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
		parse_options(inname)	
		generate!(outname)
	end

	def self.generate!(outfile)
		classname = DEFAULTS[:instrument].to_s.capitalize
		instrument = Kernel.const_get(classname)
		File.open(outfile, 'w') do |f|
			f.write LilyPond::create_doc(DEFAULTS, instrument)
		end
	end

	def self.parse_options(filename)
		raw_options = IO.read(filename)
		Citrus.load 'lib/baby/grammar/options'
		opts = Options.parse raw_options
		puts opts.instrument.value
		puts opts.time.value
		puts opts.key.value
		puts opts.length.value
	end
end
