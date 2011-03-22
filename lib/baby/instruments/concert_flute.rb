class ConcertFlute < Instrument
    LO_NOTE = "b"
    HI_NOTE = "b'''"

    LO_RANGE   = %w{ b c' d' e' f' g' a' b' c'' }
    MID_RANGE  = %w{ c'' d'' e'' f'' g'' a'' b'' c''' }
    HI_RANGE   = %w{ c''' d''' e''' f''' g''' a''' b'''  }
    FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

    CLEF = 'treble'
    
    NAME = 'Concert Flute'
end
