module Teams

  SHORT = %i(ANA BOS BUF CGY CAR CHI COL CBJ DAL DET EDM FLA LAK MIN MTL NSH NJD NYI NYR OTT PHI PHX PIT SJS STL TBL TOR VAN WSH WPG)

  LONG = {
    ANA: 'Anaheim',
    BOS: 'Boston',
    BUF: 'Buffalo',
    CGY: 'Calgary',
    CAR: 'Carolina',
    CHI: 'Chicago',
    COL: 'Colorado',
    CBJ: 'Columbus',
    DAL: 'Dallas',
    DET: 'Detroit',
    EDM: 'Edmonton',
    FLA: 'Florida',
    LAK: 'Los Angeles',
    MIN: 'Minnesota',
    MTL: 'Montreal',
    NSH: 'Nashville',
    NJD:  'New Jersey',
    NYI: 'New York Islanders',
    NYR: 'New York Rangers',
    OTT: 'Ottawa', 
    PHI: 'Philadelphia',
    PHX: 'Phoenix',
    PIT: 'Pittsburgh',
    SJS: 'San Jose',
    STL: 'St. Louis',
    TBL: 'Tampa Bay',
    TOR: 'Toronto',
    VAN: 'Vancouver',
    WSH: 'Washington',
    WPG: 'Winnipeg'
  }

  # http://www.nhl.com/ice/standings.htm?type=PLA
  RECORDS = {
    ANA: [54, 20, 8],
    BOS: [54, 19, 9],
    BUF: [21, 51, 10],
    CGY: [35, 40, 7],
    CAR: [36, 35, 11],
    CHI: [46, 21, 15],
    COL: [52, 22, 8],
    CBJ: [43, 32, 7],
    DAL: [40, 31, 11],
    DET: [39, 28, 15],
    EDM: [29, 44, 9],
    FLA: [29, 45, 8],
    LAK:  [46, 28, 8],
    MIN: [43, 27, 12],
    MTL: [46, 28, 8],
    NSH: [38, 32, 12],
    NJD:  [35, 29, 18],
    NYI: [34, 37, 11],
    NYR: [45, 31, 6],
    OTT: [37, 31, 14], 
    PHI: [42, 30, 10],
    PHX: [37, 30, 15],
    PIT: [51, 24, 7],
    SJS: [51, 22, 9],
    STL: [52, 23, 7],
    TBL:  [46, 27, 9],
    TOR: [38, 36, 8],
    VAN: [36, 35, 11],
    WSH: [38, 30, 14],
    WPG: [37, 35, 10]
  }

end