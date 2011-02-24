class LilyPond
	VERSION = "2.12.2"

	def self.create_doc(params, instrument)

<<SCORE
\\header {
	title = \\markup \\center-column { "Site-reading for #{ Time.now }" }
	tagline = "Music generated by Baby::Got::Bach, BITCH!"
	instrument = #{ instrument::NAME }
	composer = "Baby::Got::Bach"
}

\\version "#{ VERSION }"

global = {
	\\tempo 4 = #{ params[:tempo] }
	\\time #{ params[:time] }
}

#{ instrument.generate(params) } 

SCORE
	end

end
