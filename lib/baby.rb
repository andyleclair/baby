# Load all instruments files in the instruments directory
require 'require_all'
require 'baby/instrument'
Dir[File.join('lib', 'baby', 'instruments', '*.rb')].each {|instr| load instr} 

require 'baby/generator'
require 'baby/lilypond'
require 'citrus'

class Baby
	class Got
		class Bach
	
			SYNTAX = <<-SYNTAX

Baby Got Bach:
	usage: ./cs4500 <input doc> <output filename>

Currently, the input doc is TOTES IGNORED, BRO

			SYNTAX

			def self.run!(*args)
				case args.length
					when 2
						Generator.run!(*args)
					else
						puts SYNTAX
				end
				return 0
			end
		end
	end
end
