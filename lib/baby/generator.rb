class Generator

  def self.run!(*args)
  # Entry point (inner)
    inname, outname = args
    options = Options.parse(inname).to_hash

    classname = options[:instrument].split(" ").each{ |s| s.capitalize! }.join
    instrument = Kernel.const_get(classname)
    File.open(outname, 'w') do |f|
      f.write LilyPond::create_doc(options, instrument)
    end
  end
end
