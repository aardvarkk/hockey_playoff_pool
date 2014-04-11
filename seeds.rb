require './teams'

module Seeds

  include Teams

  # http://www.nhl.com/ice/standings.htm?type=PLA
  MATCHUPS = %i(
    COL
    MIN
    STL
    CHI
    ANA
    DAL
    SJS
    LAK
    BOS
    DET
    MTL
    TBL
    PIT
    CBJ
    NYR
    PHI
      )

end