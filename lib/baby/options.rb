require 'pp'

class Options

	attr_accessor :instrument, :time_sig, :key, :length, :difficulty

	def initialize(instrument = 'soprano recorder', 
								 time_sig = '4/4', 
                 key = {:key => 'c', :mode => 'major'}, 
								 length = 32, 
								 difficulty = 20)
		@instrument = instrument
		@time_sig = time_sig
		@key = key
		@length = length
		@difficulty = difficulty
	end

	def self.parse(filename)
		opts = Options.new	# gets default vals
		raw_text = IO.read(filename)
		raw_lines = raw_text.split(/[\r\n(\r\n)]/)
		raw_lines.each_with_index do |line, i|
			line.strip! # remove whitespace
			words = line.split(':')
			opt = words.shift
			param = words.join(' ').strip
			case opt
				when 'instrument'
					opts.instrument = param
				when 'time signature'
					opts.time_sig = param
				when 'key'
					opts.key = parse_key(param)
				when 'length'
					opts.length = param.to_i
				when 'difficulty'
					opts.difficulty = param.to_i
				else
					puts "Parse error on line #{ i } with #{ line }, default parameter will be used instead."
			end
		end
		opts
	end

	def self.parse_key(keystr)
		key_arr = /([A-F]#?b?)(major|minor)?/.match(keystr)
		{:key => key_arr[1].downcase, :mode => key_arr[2]}
	end
end
