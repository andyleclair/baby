class Instrument
	# unused for now
    LO_NOTE = ""
    HI_NOTE = ""

    LO_RANGE   = []
    MID_RANGE  = []
    HI_RANGE   = []
    FULL_RANGE = []

    CLEF = 'treble'

    NAME = 'derp!'

    def self.range(range = 'full')
        case range
            when 'low'
                self::LO_RANGE
            when 'mid'
                self::MID_RANGE
            when 'high'
                self::HI_RANGE
            else
                self::FULL_RANGE
            end
    end

        def self.generate(params = {})
                staff_header = self.staff_header(params)
                notes = generate_notes(params.merge({:notes => range('full')}))
                <<NOTES
\\new Staff {
    \\clef "#{ self::CLEF }"
    #{ staff_header } 
    #{ notes }
}
NOTES
        end
        
    def self.staff_header(params = {})
    keystring = params[:key][:key]
    keystring += " \\" + params[:key][:mode] if params[:key][:mode]
        <<HEADER
\\key #{ keystring }
    \\time #{ params[:time_sig] }
HEADER
    end

    def self.generate_notes(params = {})
        notes_per_bar = params[:time_sig][0].chr.to_i
        bars = params[:length].to_i
        score = ""
        current_range = params[:notes] # pased directly; array of symbols
        bars.times do |num|
            score << generate_measure(notes_per_bar,current_range);
            score << "\n    " unless num+1 == bars
        end

        score
    end
    
    def self.generate_measure(notes_per_bar = 0.0, notes = {})
        measure = ""
        while notes_per_bar > 0.0 do
            pitch = notes[rand(notes.length)]
            length = generate_length()
                        
            length = 0.5 if length > notes_per_bar # just a hack for now
                                
            measure << pitch << qtimeof(length).to_s << " "
            
            notes_per_bar = notes_per_bar.to_f - length.to_f
        end
        
        measure
    end
    
    def self.generate_length()
        r = rand(0)
        # result = "length, in number of quarter notes time"
        if r < 0.2
            2.0
        elsif r < 0.25
            4.0
        elsif r < 0.3
            0.5
        else
            1.0
        end
    end
    
    def self.qtimeof(time)
        (4.0*(1.0/time)).to_i
    end
end
