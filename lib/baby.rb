require 'baby/generator'
require 'baby/lilypond'

class Baby
	class Got
		class Bach
	
			@syntax = <<-SYNTAX

Baby Got Bach:
	usage: ./cs4500 <input doc> <output filename>

Currently, the input doc is TOTES IGNORED, BRO

SYNTAX

			def self.run!(*args)
				case args.length
					when 2
						Generator.run!(*args)
					else
						puts @syntax
				end
				return 0
			end
		end
	end
end
