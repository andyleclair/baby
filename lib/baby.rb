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
                options[:verbose] = false
                opts.on('-v', '--verbose', 'Print debug information' ) do
                    option[:verbose] = true
                end
                opts.on('--set-instrument', 'Override instrument setting' ) do
                    puts "blah"
                end
                opts.on('--set-key', 'Override key setting' ) do
                    puts "blah"
                end
            end

            optparse.parse!

            SYNTAX = <<-SYNTAX

Baby Got Bach:
    usage: #{ $0 } <input doc> <output filename>

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
