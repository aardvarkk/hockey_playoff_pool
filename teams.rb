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
    ANA: [52, 20, 8],
    BOS: [53, 18, 9],
    BUF: [21, 50, 9],
    CGY: [35, 38, 7],
    CAR: [34, 35, 11],
    CHI: [46, 19, 15],
    COL: [52, 21, 7],
    CBJ: [42, 31, 7],
    DAL: [39, 30, 11],
    DET: [38, 27, 15],
    EDM: [28, 44, 9],
    FLA: [29, 44, 8],
    LAK:  [46, 28, 7],
    MIN: [43, 26, 12],
    MTL: [45, 28, 8],
    NSH: [36, 32, 12],
    NJD:  [34, 29, 17],
    NYI: [32, 37, 11],
    NYR: [45, 31, 5],
    OTT: [35, 31, 14], 
    PHI: [41, 30, 9],
    PHX: [36, 29, 15],
    PIT: [51, 24, 5],
    SJS: [49, 22, 9],
    STL: [52, 21, 7],
    TBL:  [44, 27, 9],
    TOR: [38, 35, 8],
    VAN: [35, 34, 11],
    WSH: [37, 30, 13],
    WPG: [35, 35, 10]
  }

end