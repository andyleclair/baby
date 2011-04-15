class Generator

  # Entry point (inner)

  def self.run!(copts = {}, *args)
    inname, outname = args
    options = Options.parse(inname)

    generate!(outname, options.to_hash)
  end

  def self.generate!(outfile, options)
    classname = options[:instrument].split(" ").each{ |s| s.capitalize! }.join
    instrument = Kernel.const_get(classname)
    File.open(outfile, 'w') do |f|
      f.write LilyPond::create_doc(options, instrument)
    end
  end
end
