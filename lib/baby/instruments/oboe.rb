class Oboe < Instrument
    LO_NOTE = "b"
    HI_NOTE = "d'''"

    LO_RANGE   = %w{ b c' d' e' f' g' a' b' }
    MID_RANGE  = %w{ b' c'' d'' e'' f'' g'' a'' b'' }
    HI_RANGE   = %w{ b'' c''' d''' }
    FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

    CLEF = 'treble'
    
    NAME = 'Oboe'
end
