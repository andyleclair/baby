# Load all instruments files in the instruments directory
require 'baby/instrument'
Dir[File.join('lib', 'baby', 'instruments', '*.rb')].each {|instr| load instr} 

require 'baby/lilypond'
require 'baby/options'
require 'baby/generator'
require 'baby/complexity'
require 'baby/music'
require 'erb'

class Baby
  class Got
    class Bach
      # Entry point (client)

      def self.run!(*args)
	case args.length
	when 2
	  Generator.run!(*args)
	else
	  puts "usage: ./c4500 <input file> <output file name>"
	end
	return 0
      end
    end
  end
end
