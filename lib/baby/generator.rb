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

                        parsed_opts = Hash.new
                        parsed_opts.store( :instrument, opts.instrument.value ) unless opts.instrument.nil?
                        parsed_opts.store( :time, opts.time.value ) unless opts.time.nil?
                        parsed_opts.store( :bars, opts.num_bars.value ) unless opts.num_bars.nil?
                        unless opts.key.nil?
                                key_arr = opts.key.value.split(' ')
                                key_hash = { :key => key_arr[0].downcase, :mode => key_arr[1] }
                                parsed_opts.store( :key, key_hash)
                        end

                        DEFAULTS.merge parsed_opts
                rescue Citrus::ParseError => e
                        puts "Error: could not parse input file `#{ filename }':\n"
                        puts e.detail()
                        puts "(line #{ e.line_number }, position #{ e.line_offset })"
                        puts "\nDefault parameters will be used instead."

                        DEFAULTS
                end
        end
end
