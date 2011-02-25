# Load all instruments files in the instruments directory
require 'baby/instrument'
Dir[File.join('lib', 'baby', 'instruments', '*.rb')].each {|instr| load instr} 

require 'baby/generator'
require 'baby/lilypond'
require 'citrus'
require 'optparse'

class Baby
    class Got
        class Bach
    
            options = {}
            optparse = OptionParser.new do|opts|
			    opts.banner = "usage: #{ $0 } [options] <input> <output>"
                options[:verbose] = false
                opts.on('-v', '--verbose', 'Print debug information' ) do
                    option[:verbose] = true
                end
                opts.on('--set-instrument INSTRUMENT', 'Force `instrument\' parameter' ) do|instrument|
                    option[:set-instrument] = instrument
                end
                opts.on('--set-timesig TIMESIG', 'Force `time signature\' parameter' ) do|timesig|
                    option[:set-timesig] = timesig
                end
                opts.on('--set-key KEY', 'Force `key\' parameter' ) do|key|
                    option[:set-key] = key
                end
                opts.on('--set-length LENGTH', 'Force `length\' parameter' ) do|length|
                    option[:set-length] = length
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
                        Generator.run!(*args)
                    else
                        puts RUNSYNTAX
                end
                return 0
            end
        end
    end
end
