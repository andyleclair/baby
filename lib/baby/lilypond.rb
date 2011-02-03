class LilyPond
	VERSION = "2.12.2"

	def self.create_doc(params, instrument)
		<<DOC
{
	\\version "#{ VERSION }"
	\\time #{ params[:time] }
	\\clef #{ instrument::CLEF }
	#{ instrument.range(params[:range]).join " " }
}
DOC
	end

end
