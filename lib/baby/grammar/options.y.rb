class Optionsparser

	rule
		input: instrument_spec time_spec key_spec length_spec difficulty_spec { result = val }
		
		instrument_spec: 
			| whitespace 'instrument:' whitespace instr whitespace ls { result = val[3] }

		time_spec: { result = [] }
			| whitespace 'time signature:' whitespace int '/' int whitespace ls { result = val[3] + '/' + val[5] }

		key_spec: { result = [] }
			| whitespace 'key:' whitespace key whitespace ls { result = val[3] }

		length_spec: { result = [] }
			| whitespace 'length:' whitespace int whitespace ls { result = val[3] }

		difficulty_spec: { result = [] }
			| whitespace 'difficulty:' whitespace int whitespace ls { result = val[3] }

		instr: "soprano recorder"
			|  "alto recorder"
			|  "concert flute"
			|  "oboe"
			|  "bassoon"
			|  "violin"
			|  "cello"
			|  "guitar"
			|  "piano"

		key: pitch
			| pitch key 'major'
			| pitch key 'minor'

		pitch: "Ab"  |  "A"  |  "A#"  |  "Bb"  |  "B"  |  "B#"
			|  "Cb"  |  "C"  |  "C#"  |  "Db"  |  "D"  |  "D#"
			|  "Eb"  |  "E"  |  "E#"  |  "Fb"  |  "F"  |  "F#"
			|  "Gb"  |  "G"  |  "G#"

		int: digit | digit int

		digit: '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'	

		whitespace: 
			| "\u0020" whitespace

		ls: "\u000A" | "\u000D" | "\u000D\u000A"

end
