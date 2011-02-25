class Generator

    DEFAULTS = {
        :instrument => 'soprano recorder',
        :complexity => 20,
        :key        => {:key => 'c', :mode => 'major'},
        :bars       => 32,
        :tempo      => 90,
        :style      => 'classical',
        :range      => 'mid',
        :time       => '4/4'
    }

    def self.run!(copts = {}, *args)
        inname, outname = args
        options = parse_options(inname) 

		override = lambda {|x, y|
			options.store(x, copts[y]) if copts.key?(y)
		}
		
		override.call(:instrument, :set_instrument)
		override.call(:time, :set_timesig)
		override.call(:bars, :set_length)
		options.store(:key, parse_key(copts[:set_key])) if copts.key?(:set_key)
		
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

            parsed_opts = Hash.new
            parsed_opts.store(:instrument, opts.instrument.value) unless opts.instrument.nil?
            parsed_opts.store(:time, opts.time.value) unless opts.time.nil?
            parsed_opts.store(:bars, opts.num_bars.value) unless opts.num_bars.nil?
			parsed_opts.store(:key, parse_key(opts.key.value)) unless opts.key.nil?

            DEFAULTS.merge parsed_opts
        rescue Citrus::ParseError => e
            puts "Error: could not parse input file `#{ filename }':\n"
            puts e.detail()
            puts "(line #{ e.line_number }, position #{ e.line_offset })"
            puts "\nDefault parameters will be used instead."

            DEFAULTS
        end
    end
	
	def self.parse_key(keystr)
		key_arr = keystr.split(' ')
		{:key => key_arr[0].downcase, :mode => key_arr[1]}
	end
end
