# Load all instruments files in the instruments directory
require 'baby/instrument'
Dir[File.join('lib', 'baby', 'instruments', '*.rb')].each {|instr| load instr} 

require 'baby/lilypond'
require 'baby/options'
require 'baby/generator'
require 'baby/complexity'
require 'baby/music'
require 'baby/key'
require 'erb'
require 'optparse'

class Baby
  class Got
    class Bach

      # Entry point class (client)

      # Command-line option handling
      COPTS = {}
      optparse = OptionParser.new do|opts|
	opts.banner = "usage: #{ $0 } [options] <input> <output>"
	COPTS[:verbose] = false
	opts.on('-v', '--verbose', 'Print debug information' ) do
	  COPTS[:verbose] = true
	end
	opts.on('--set-instrument INSTRUMENT', 'Force `instrument\' parameter' ) do|instrument|
	  COPTS[:instrument] = instrument
	end
	opts.on('--set-timesig TIMESIG', 'Force `time signature\' parameter' ) do|timesig|
	  COPTS[:time_sig] = timesig
	end
	opts.on('--set-key KEY', 'Force `key\' parameter' ) do|key|
	  COPTS[:key] = key
	end
	opts.on('--set-length LENGTH', 'Force `length\' parameter' ) do|length|
	  COPTS[:length] = length
	end
        opts.on('--set-difficulty DIFFICULTY', 'Force `difficulty\' parameter' ) do |difficulty|
          COPTS[:difficulty] = Integer(difficulty)
        end
        opts.on('-s', '--use-seed SEED','Provide a seed for this run' ) do|seed|
          srand(Integer(seed))
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
	end
	return 0
      end
    end
  end
end
