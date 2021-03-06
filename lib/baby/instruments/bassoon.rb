class Bassoon < Instrument
    LO_NOTE = "b,,"
    HI_NOTE = "b'"

    LO_RANGE   = %w{ b,, c, d, e, f, g, a, b, }
    MID_RANGE  = %w{ b, c d e f g a b }
    HI_RANGE   = %w{ b c' d' e' f' g' a' b' }
    FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

    CLEF = 'bass'
    
    NAME = 'Bassoon'
end
