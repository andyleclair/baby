require 'erb'

class LilyPond

  def self.create_doc(options, instrument_class)
    template = IO.read 'lib/baby/lilypond.erb'
    tempo = '120'
    time_sig = options[:time_sig].gsub('\\', '/')
    notes = instrument_class.generate(options)
    instrument = instrument_class::NAME
    difficulty = options[:difficulty]
    document = ERB.new(template)
    document.result(self.send(:binding))
  end
end
