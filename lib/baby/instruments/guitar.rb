class Guitar < Instrument
    LO_NOTE = "e"
    HI_NOTE = "e'''"

    LO_RANGE   = %w{ e f g a b c' d' e' }
    MID_RANGE  = %w{ e' f' g' a' b' c'' d'' e'' }
    HI_RANGE   = %w{ e'' f'' g'' a'' b'' c''' d''' e''' }
    FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

    CLEF = 'treble_8'
    
    NAME = 'Guitar'
end
