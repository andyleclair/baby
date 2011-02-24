class Generator

	DEFAULTS = {
		:instrument => 'soprano recorder',
		:complexity => 20,
		:key 		=> {:key => 'c', :mode => 'major'},
		:bars 	=> 32,
		:tempo 	=> 90,
		:style 	=> 'classical',
		:range 	=> 'mid',
		:time		=> '4/4'
	}

	def self.run!(*args)
		inname, outname = args
		options = parse_options(inname)	
		generate!(outname, options)
	end

	def self.generate!(outfile, options)
		classname = options[:instrument].split(" ").each{ |s| s.capitalize! }.join
		instrument = Kernel.const_get(classname)
		File.open(outfile, 'w') do |f|
			f.write LilyPond::create_doc(options, instrument)
		end
	end

	def self.parse_options(filename)
		begin
			raw_options = IO.read(filename)
			Citrus.load 'lib/baby/grammar/options.citrus'
			opts = Options.parse raw_options
			key_arr = opts.key.value.split(' ')
			key_hash = { :key => key_arr[0].downcase, :mode => key_arr[1] }
			hash_opts = {	:instrument => opts.instrument.value,
										:time 			=> opts.time.value,
										:key				=> key_hash,
										:bars				=> opts.num_bars.value }
			DEFAULTS.merge hash_opts
		rescue Citrus::ParseError => e
			puts "WARNING!!!  Parsing error at line #{ e.line_number }, position #{ e.line_offset }"
			puts "Using default value instead of #{ e.line }"
			DEFAULTS
		end
	end
end
