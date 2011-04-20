class Options

  attr_accessor :instrument, :time_sig, :key, :length, :difficulty

  def initialize(instrument = 'soprano recorder', 
                 time_sig = '4/4', 
                 key = {:key => 'c', :mode => 'major'}, 
                 length = 32, 
                 difficulty = 20) # init with defaults
    @instrument = instrument
    @time_sig = time_sig
    @key = key
    @length = length
    @difficulty = difficulty
  end

  def self.parse(filename)
    opts = Options.new	# gets default vals
    raw_text = IO.read(filename)
    # hack'd it
    raw_text.gsub!("\r\n","\n")
    raw_text.gsub!("\r","\n")
    raw_lines = raw_text.split(/[\n]/)
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
        puts "Parse error on line #{ i } with #{ line }. A default parameter may be used instead."
      end
    end
    opts
  end

  def self.parse_key(keystr)
    key_arr = /([A-G]#?b?) *(major|minor)?/.match(keystr)
    if key_arr[2]==nil then key="major" else key=key_arr[2] end
    {:key => key_arr[1].sub("b","es").sub("#","is").downcase, :mode => key}
  end

  def to_hash
    hash = {}
    self.instance_variables.each do |var|
      name = var.gsub(/@/, '')
      hash[name.to_sym] = self.instance_variable_get(var)
    end
    hash
  end
end
