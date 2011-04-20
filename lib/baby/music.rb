class Music
  @@last_pitch = ''
  @@last_length = ''
  @@start_note = ''

  # generate music for the given params
  def self.generate_notes(instr,params = {})
    @@start_note = get_mid_note_index(instr,params[:notes],params[:key][:key][0,1])
    #puts @@start_note
    #puts instr.range('full').at(@@start_note)
    notes_per_bar = params[:time_sig][0].chr.to_i
    bars = params[:length].to_i
    score = ""
    current_range = params[:notes] # set of possible notes
    complexity = Complexity.from_index(params[:difficulty])
    bars.times do |num|
      # generation continues by measures, with global memory
      score << generate_measure!(notes_per_bar,current_range,complexity,params[:key][:key][0,1]);
      score << "\n  " unless num+1 == bars
    end

    score
  end

 # generate a single measure of notes
 def self.generate_measure!(notes_per_bar = 0.0, notes = {}, complexity = {}, key = "C")
    measure = ""
    # seed the initial note
    #@@last_pitch = @@start_note if @@last_pitch == ''
    while notes_per_bar > 0.0 do
      pitchnum = rand(complexity.pitch_delta)
      pitchnum = (pitchnum * -1) if rand(0) < 0.5
      if @@last_pitch == '' then
        @@last_pitch = @@start_note
      else
        @@last_pitch = @@last_pitch + pitchnum
        @@last_pitch = notes.length-1 if @@last_pitch > (notes.length-1)
        @@last_pitch = 0 if @@last_pitch < 0
      end
      pitch = "*"+notes[@@last_pitch]
      scale = Key.scale(key)
      pitch.gsub!("*"+pitch[1,1],scale.at(@@last_pitch % 7))
      length = generate_length(complexity.len_probs)

      length = 1.0 if length > notes_per_bar
      length = 0.5 if length > notes_per_bar # just a hack for now
      length = 0.25 if length > notes_per_bar

      measure << "\t" <<  pitch << qtimeof(length).to_s << " "

      notes_per_bar = notes_per_bar.to_f - length.to_f
    end

    measure
  end

 def self.generate_length(probs)
    r = rand(0)
    # result = "length, in number of quarter notes time"

    if r < probs[0]
      4.0
    elsif r < (probs[1]+probs[0])
      2.0
    elsif r < (probs[2]+probs[1]+probs[0])
      1.0
    elsif r < (probs[3]+probs[2]+probs[1]+probs[0])
      0.5
    else
      0.25
    end

  end

  def self.qtimeof(time)
    (4.0*(1.0/time)).to_i
  end

 def self.get_mid_note_index(instr,notes,note)
   note.downcase!
   midnotes = instr.range('mid')
   #notes = instr.range('full')
   midnote=""
   midnotes.each do |n|
     midnote=n if n.index(note)!=nil
   end
   midnote=midnotes[0] if midnote==""
   notes.index(midnote)
 end

end
