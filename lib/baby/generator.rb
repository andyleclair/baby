class Generator

	DEFAULTS = {
		:instrument => 'violin',
		:complexity => 20,
		:key => 'CMaj',
		:bars => 10,
		:tempo => 90,
		:style => 'classical',
		:range => 'middle'
	}

	def self.run!(*args)
		inname, outname = args
		infile, outfile = [nil, nil]

		if File.exists?(outname)
			File.delete(outname)
		end
		
		outfile = File.new(outname, 'w+')

		generate!(outfile)
	end

	def self.generate!(outfile)
		
	end
end
