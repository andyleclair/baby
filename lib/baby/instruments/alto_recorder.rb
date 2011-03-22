class AltoRecorder < Instrument
    LO_NOTE = "f"
    HI_NOTE = "f''"

    LO_RANGE   = %w{ f g a b c' d' e' f' }
    MID_RANGE  = %w{ f' g' a' b' c'' d'' }
    HI_RANGE   = %w{ d'' e'' f'' }
    FULL_RANGE = LO_RANGE.concat(MID_RANGE).concat(HI_RANGE)

    CLEF = 'G^8'
    
    NAME = 'Alto Recorder'
end
