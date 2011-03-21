class Generator

    def self.run!(copts = {}, *args)
			inname, outname = args
			options = Options.parse(inname)

			#override = lambda {|x, y|
			#	options.call(x, copts[y]) if copts.key?(y)
			#}
		
			#override.call(:instrument, :set_instrument)
			#override.call(:time, :set_timesig)
			#override.call(:length, :set_length)
			#override.call(:key, Options.parse_key(copts[:set_key])) if copts.key?(:set_key)
			#override.
			
			generate!(outname, options.to_hash())
    end

    def self.generate!(outfile, options)
        classname = options[:instrument].split(" ").each{ |s| s.capitalize! }.join
        instrument = Kernel.const_get(classname)
        File.open(outfile, 'w') do |f|
            f.write LilyPond::create_doc(options, instrument)
        end
    end
end
