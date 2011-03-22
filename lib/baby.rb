# Load all instruments files in the instruments directory
require 'baby/instrument'
Dir[File.join('lib', 'baby', 'instruments', '*.rb')].each {|instr| load instr} 

require 'baby/lilypond'
require 'baby/options'
require 'baby/generator'
require 'baby/complexity'
require 'optparse'

class Baby
    class Got
        class Bach
    
            COPTS = {}
            optparse = OptionParser.new do|opts|
			    opts.banner = "usage: #{ $0 } [options] <input> <output>"
                COPTS[:verbose] = false
                opts.on('-v', '--verbose', 'Print debug information' ) do
                    COPTS[:verbose] = true
                end
                opts.on('--set-instrument INSTRUMENT', 'Force `instrument\' parameter' ) do|instrument|
                    COPTS[:set_instrument] = instrument
                end
                opts.on('--set-timesig TIMESIG', 'Force `time signature\' parameter' ) do|timesig|
                    COPTS[:set_timesig] = timesig
                end
                opts.on('--set-key KEY', 'Force `key\' parameter' ) do|key|
                    COPTS[:set_key] = key
                end
                opts.on('--set-length LENGTH', 'Force `length\' parameter' ) do|length|
                    COPTS[:set_length] = length
                end
				opts.on('-h','--help','Display this screen') do
				    puts opts
					exit
				end
            end

			RUNSYNTAX = optparse.help()
            optparse.parse!

            def self.run!(*args)
                case args.length
                    when 2
                        Generator.run!(COPTS, *args)
                    else
                        puts RUNSYNTAX
						puts COPTS
                end
                return 0
            end
        end
    end
end
