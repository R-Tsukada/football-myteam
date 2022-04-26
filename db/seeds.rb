# frozen_string_literal: true

League.create(
  [
    {
      "id": 1,
      "api_id": 39,
      "name": 'Premier League',
      "logo": 'https://media.api-sports.io/football/leagues/39.png'
    },
    {
      "id": 2,
      "api_id": 135,
      "name": 'Serie A',
      "logo": 'https://media.api-sports.io/football/leagues/135.png'
    },
    {
      "id": 3,
      "api_id": 140,
      "name": 'La Liga',
      "logo": 'https://media.api-sports.io/football/leagues/140.png'
    },
    {
      "id": 4,
      "api_id": 78,
      "name": 'Bundesliga 1',
      "logo": 'https://media.api-sports.io/football/leagues/78.png'
    }
  ]
)

Team.create(
  [
    {
      "id": 1,
      "name": 'Manchester United',
      "logo": 'https://media.api-sports.io/football/teams/33.png',
      "api_id": 33,
      "league_id": 1,
      "home_city": 'Manchester',
      "stadium": 'Old Trafford',
      "last_season_rank": 2
    },
    {
      "id": 2,
      "name": 'Newcastle',
      "logo": 'https://media.api-sports.io/football/teams/34.png',
      "api_id": 34,
      "league_id": 1,
      "home_city": 'Newcastle upon Tyne',
      "stadium": "St. James' Park",
      "last_season_rank": 12
    },
    {
      "id": 3,
      "name": 'Watford',
      "logo": 'https://media.api-sports.io/football/teams/38.png',
      "api_id": 38,
      "league_id": 1,
      "home_city": 'Watford',
      "stadium": 'Vicarage Road',
      "last_season_rank": ''
    },
    {
      "id": 4,
      "name": 'Wolves',
      "logo": 'https://media.api-sports.io/football/teams/39.png',
      "api_id": 39,
      "league_id": 1,
      "home_city": 'Wolverhampton, West Midlands',
      "stadium": 'Molineux Stadium',
      "last_season_rank": 13
    },
    {
      "id": 5,
      "name": 'Liverpool',
      "logo": 'https://media.api-sports.io/football/teams/40.png',
      "api_id": 40,
      "league_id": 1,
      "home_city": 'Liverpool',
      "stadium": 'Anfield',
      "last_season_rank": 3
    },
    {
      "id": 6,
      "name": 'Southampton',
      "logo": 'https://media.api-sports.io/football/teams/41.png',
      "api_id": 41,
      "league_id": 1,
      "home_city": 'Southampton, Hampshire',
      "stadium": "St. Mary's Stadium",
      "last_season_rank": 15
    },
    {
      "id": 7,
      "name": 'Arsenal',
      "logo": 'https://media.api-sports.io/football/teams/42.png',
      "api_id": 42,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Emirates Stadium',
      "last_season_rank": 8
    },
    {
      "id": 8,
      "name": 'Burnley',
      "logo": 'https://media.api-sports.io/football/teams/44.png',
      "api_id": 44,
      "league_id": 1,
      "home_city": 'Burnley',
      "stadium": 'Turf Moor',
      "last_season_rank": 17
    },
    {
      "id": 9,
      "name": 'Everton',
      "logo": 'https://media.api-sports.io/football/teams/45.png',
      "api_id": 45,
      "league_id": 1,
      "home_city": 'Liverpool',
      "stadium": 'Goodison Park',
      "last_season_rank": 10
    },
    {
      "id": 10,
      "name": 'Leicester',
      "logo": 'https://media.api-sports.io/football/teams/46.png',
      "api_id": 46,
      "league_id": 1,
      "home_city": 'Leicester, Leicestershire',
      "stadium": 'King Power Stadium',
      "last_season_rank": 5
    },
    {
      "id": 11,
      "name": 'Tottenham',
      "logo": 'https://media.api-sports.io/football/teams/47.png',
      "api_id": 47,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Tottenham Hotspur Stadium',
      "last_season_rank": 7
    },
    {
      "id": 12,
      "name": 'West Ham',
      "logo": 'https://media.api-sports.io/football/teams/48.png',
      "api_id": 48,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'London Stadium',
      "last_season_rank": 6
    },
    {
      "id": 13,
      "name": 'Chelsea',
      "logo": 'https://media.api-sports.io/football/teams/49.png',
      "api_id": 49,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Stamford Bridge',
      "last_season_rank": 4
    },
    {
      "id": 14,
      "name": 'Manchester City',
      "logo": 'https://media.api-sports.io/football/teams/50.png',
      "api_id": 50,
      "league_id": 1,
      "home_city": 'Manchester',
      "stadium": 'Etihad Stadium',
      "last_season_rank": 1
    },
    {
      "id": 15,
      "name": 'Brighton',
      "logo": 'https://media.api-sports.io/football/teams/51.png',
      "api_id": 51,
      "league_id": 1,
      "home_city": 'Falmer, East Sussex',
      "stadium": 'The American Express Community Stadium',
      "last_season_rank": 16
    },
    {
      "id": 16,
      "name": 'Crystal Palace',
      "logo": 'https://media.api-sports.io/football/teams/52.png',
      "api_id": 52,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Selhurst Park',
      "last_season_rank": 14
    },
    {
      "id": 17,
      "name": 'Brentford',
      "logo": 'https://media.api-sports.io/football/teams/55.png',
      "api_id": 55,
      "league_id": 1,
      "home_city": 'Brentford, Middlesex',
      "stadium": 'Brentford Community Stadium',
      "last_season_rank": ''
    },
    {
      "id": 18,
      "name": 'Leeds',
      "logo": 'https://media.api-sports.io/football/teams/63.png',
      "api_id": 63,
      "league_id": 1,
      "home_city": 'Leeds, West Yorkshire',
      "stadium": 'Elland Road',
      "last_season_rank": 9
    },
    {
      "id": 19,
      "name": 'Aston Villa',
      "logo": 'https://media.api-sports.io/football/teams/66.png',
      "api_id": 66,
      "league_id": 1,
      "home_city": 'Birmingham',
      "stadium": 'Villa Park',
      "last_season_rank": 11
    },
    {
      "id": 20,
      "name": 'Norwich',
      "logo": 'https://media.api-sports.io/football/teams/71.png',
      "api_id": 71,
      "league_id": 1,
      "home_city": 'Norwich, Norfolk',
      "stadium": 'Carrow Road',
      "last_season_rank": ''
    },
    {
      "id": 21,
      "name": 'Lazio',
      "logo": 'https://media.api-sports.io/football/teams/487.png',
      "api_id": 487,
      "league_id": 2,
      "home_city": 'Roma',
      "stadium": 'Stadio Olimpico',
      "last_season_rank": 6
    },
    {
      "id": 22,
      "name": 'Sassuolo',
      "logo": 'https://media.api-sports.io/football/teams/488.png',
      "api_id": 488,
      "league_id": 2,
      "home_city": 'Reggio nell&apos;Emilia',
      "stadium": 'MAPEI Stadium - Città del Tricolore',
      "last_season_rank": 8
    },
    {
      "id": 23,
      "name": 'AC Milan',
      "logo": 'https://media.api-sports.io/football/teams/489.png',
      "api_id": 489,
      "league_id": 2,
      "home_city": 'Milano',
      "stadium": 'Stadio Giuseppe Meazza',
      "last_season_rank": 2
    },
    {
      "id": 24,
      "name": 'Cagliari',
      "logo": 'https://media.api-sports.io/football/teams/490.png',
      "api_id": 490,
      "league_id": 2,
      "home_city": 'Cagliari',
      "stadium": 'Unipol Domus',
      "last_season_rank": 16
    },
    {
      "id": 25,
      "name": 'Napoli',
      "logo": 'https://media.api-sports.io/football/teams/492.png',
      "api_id": 492,
      "league_id": 2,
      "home_city": 'Napoli',
      "stadium": 'Stadio Diego Armando Maradona',
      "last_season_rank": 5
    },
    {
      "id": 26,
      "name": 'Udinese',
      "logo": 'https://media.api-sports.io/football/teams/494.png',
      "api_id": 494,
      "league_id": 2,
      "home_city": 'Udine',
      "stadium": 'Dacia Arena',
      "last_season_rank": 14
    },
    {
      "id": 27,
      "name": 'Genoa',
      "logo": 'https://media.api-sports.io/football/teams/495.png',
      "api_id": 495,
      "league_id": 2,
      "home_city": 'Genova',
      "stadium": 'Stadio Comunale Luigi Ferraris',
      "last_season_rank": 11
    },
    {
      "id": 28,
      "name": 'Juventus',
      "logo": 'https://media.api-sports.io/football/teams/496.png',
      "api_id": 496,
      "league_id": 2,
      "home_city": 'Torino',
      "stadium": 'Allianz Stadium',
      "last_season_rank": 4
    },
    {
      "id": 29,
      "name": 'AS Roma',
      "logo": 'https://media.api-sports.io/football/teams/497.png',
      "api_id": 497,
      "league_id": 2,
      "home_city": 'Roma',
      "stadium": 'Stadio Olimpico',
      "last_season_rank": 7
    },
    {
      "id": 30,
      "name": 'Sampdoria',
      "logo": 'https://media.api-sports.io/football/teams/498.png',
      "api_id": 498,
      "league_id": 2,
      "home_city": 'Genova',
      "stadium": 'Stadio Comunale Luigi Ferraris',
      "last_season_rank": 9
    },
    {
      "id": 31,
      "name": 'Atalanta',
      "logo": 'https://media.api-sports.io/football/teams/499.png',
      "api_id": 499,
      "league_id": 2,
      "home_city": 'Bergamo',
      "stadium": 'Gewiss Stadium',
      "last_season_rank": 3
    },
    {
      "id": 32,
      "name": 'Bologna',
      "logo": 'https://media.api-sports.io/football/teams/500.png',
      "api_id": 500,
      "league_id": 2,
      "home_city": 'Bologna',
      "stadium": "Stadio Renato Dall'Ara",
      "last_season_rank": 12
    },
    {
      "id": 33,
      "name": 'Fiorentina',
      "logo": 'https://media.api-sports.io/football/teams/502.png',
      "api_id": 502,
      "league_id": 2,
      "home_city": 'Firenze',
      "stadium": 'Stadio Artemio Franchi',
      "last_season_rank": 13
    },
    {
      "id": 34,
      "name": 'Torino',
      "logo": 'https://media.api-sports.io/football/teams/503.png',
      "api_id": 503,
      "league_id": 2,
      "home_city": 'Torino',
      "stadium": 'Stadio Olimpico Grande Torino',
      "last_season_rank": 17
    },
    {
      "id": 35,
      "name": 'Verona',
      "logo": 'https://media.api-sports.io/football/teams/504.png',
      "api_id": 504,
      "league_id": 2,
      "home_city": 'Verona',
      "stadium": "Stadio Marc'Antonio Bentegodi",
      "last_season_rank": 10
    },
    {
      "id": 36,
      "name": 'Inter',
      "logo": 'https://media.api-sports.io/football/teams/505.png',
      "api_id": 505,
      "league_id": 2,
      "home_city": 'Milano',
      "stadium": 'Stadio Giuseppe Meazza',
      "last_season_rank": 1
    },
    {
      "id": 37,
      "name": 'Empoli',
      "logo": 'https://media.api-sports.io/football/teams/511.png',
      "api_id": 511,
      "league_id": 2,
      "home_city": 'Empoli',
      "stadium": 'Stadio Carlo Castellani',
      "last_season_rank": ''
    },
    {
      "id": 38,
      "name": 'Salernitana',
      "logo": 'https://media.api-sports.io/football/teams/514.png',
      "api_id": 514,
      "league_id": 2,
      "home_city": 'Salerno',
      "stadium": 'Stadio Arechi',
      "last_season_rank": ''
    },
    {
      "id": 39,
      "name": 'Spezia',
      "logo": 'https://media.api-sports.io/football/teams/515.png',
      "api_id": 515,
      "league_id": 2,
      "home_city": 'La Spezia',
      "stadium": 'Stadio Alberto Picco',
      "last_season_rank": 15
    },
    {
      "id": 40,
      "name": 'Venezia',
      "logo": 'https://media.api-sports.io/football/teams/517.png',
      "api_id": 517,
      "league_id": 2,
      "home_city": 'Venezia',
      "stadium": 'Stadio Pierluigi Penzo',
      "last_season_rank": ''
    },
    {
      "id": 41,
      "name": 'Barcelona',
      "logo": 'https://media.api-sports.io/football/teams/529.png',
      "api_id": 529,
      "league_id": 3,
      "home_city": 'Barcelona',
      "stadium": 'Camp Nou',
      "last_season_rank": 3
    },
    {
      "id": 42,
      "name": 'Atletico Madrid',
      "logo": 'https://media.api-sports.io/football/teams/530.png',
      "api_id": 530,
      "league_id": 3,
      "home_city": 'Madrid',
      "stadium": 'Estadio Wanda Metropolitano',
      "last_season_rank": 1
    },
    {
      "id": 43,
      "name": 'Athletic Club',
      "logo": 'https://media.api-sports.io/football/teams/531.png',
      "api_id": 531,
      "league_id": 3,
      "home_city": 'Bilbao',
      "stadium": 'San Mamés Barria',
      "last_season_rank": 10
    },
    {
      "id": 44,
      "name": 'Valencia',
      "logo": 'https://media.api-sports.io/football/teams/532.png',
      "api_id": 532,
      "league_id": 3,
      "home_city": 'Valencia',
      "stadium": 'Estadio de Mestalla',
      "last_season_rank": 13
    },
    {
      "id": 45,
      "name": 'Villarreal',
      "logo": 'https://media.api-sports.io/football/teams/533.png',
      "api_id": 533,
      "league_id": 3,
      "home_city": 'Villarreal',
      "stadium": 'Estadio de la Cerámica',
      "last_season_rank": 7
    },
    {
      "id": 46,
      "name": 'Sevilla',
      "logo": 'https://media.api-sports.io/football/teams/536.png',
      "api_id": 536,
      "league_id": 3,
      "home_city": 'Sevilla',
      "stadium": 'Estadio Ramón Sánchez Pizjuán',
      "last_season_rank": 4
    },
    {
      "id": 47,
      "name": 'Celta Vigo',
      "logo": 'https://media.api-sports.io/football/teams/538.png',
      "api_id": 538,
      "league_id": 3,
      "home_city": 'Vigo',
      "stadium": 'Abanca-Balaídos',
      "last_season_rank": 8
    },
    {
      "id": 48,
      "name": 'Levante',
      "logo": 'https://media.api-sports.io/football/teams/539.png',
      "api_id": 539,
      "league_id": 3,
      "home_city": 'Valencia',
      "stadium": 'Estadio Ciudad de Valencia',
      "last_season_rank": 14
    },
    {
      "id": 49,
      "name": 'Espanyol',
      "logo": 'https://media.api-sports.io/football/teams/540.png',
      "api_id": 540,
      "league_id": 3,
      "home_city": 'Cornella de Llobregat',
      "stadium": 'RCDE Stadium',
      "last_season_rank": 1
    },
    {
      "id": 50,
      "name": 'Real Madrid',
      "logo": 'https://media.api-sports.io/football/teams/541.png',
      "api_id": 541,
      "league_id": 3,
      "home_city": 'Madrid',
      "stadium": 'Estadio Santiago Bernabéu',
      "last_season_rank": 2
    },
    {
      "id": 51,
      "name": 'Alaves',
      "logo": 'https://media.api-sports.io/football/teams/542.png',
      "api_id": 542,
      "league_id": 3,
      "home_city": 'Vitoria-Gasteiz',
      "stadium": 'Estadio de Mendizorroza',
      "last_season_rank": 16
    },
    {
      "id": 52,
      "name": 'Real Betis',
      "logo": 'https://media.api-sports.io/football/teams/543.png',
      "api_id": 543,
      "league_id": 3,
      "home_city": 'Sevilla',
      "stadium": 'Estadio Benito Villamarín',
      "last_season_rank": 6
    },
    {
      "id": 53,
      "name": 'Getafe',
      "logo": 'https://media.api-sports.io/football/teams/546.png',
      "api_id": 546,
      "league_id": 3,
      "home_city": 'Getafe',
      "stadium": 'Coliseum Alfonso Pérez',
      "last_season_rank": 15
    },
    {
      "id": 54,
      "name": 'Real Sociedad',
      "logo": 'https://media.api-sports.io/football/teams/548.png',
      "api_id": 548,
      "league_id": 3,
      "home_city": 'Donostia-San Sebastián',
      "stadium": 'Reale Arena',
      "last_season_rank": 5
    },
    {
      "id": 55,
      "name": 'Granada CF',
      "logo": 'https://media.api-sports.io/football/teams/715.png',
      "api_id": 715,
      "league_id": 3,
      "home_city": 'Granada',
      "stadium": 'Estadio Nuevo Los Cármenes',
      "last_season_rank": 9
    },
    {
      "id": 56,
      "name": 'Cadiz',
      "logo": 'https://media.api-sports.io/football/teams/724.png',
      "api_id": 724,
      "league_id": 3,
      "home_city": 'Cádiz',
      "stadium": 'Estadio Nuevo Mirandilla',
      "last_season_rank": 12
    },
    {
      "id": 57,
      "name": 'Osasuna',
      "logo": 'https://media.api-sports.io/football/teams/727.png',
      "api_id": 727,
      "league_id": 3,
      "home_city": 'Iruñea',
      "stadium": 'Estadio El Sadar',
      "last_season_rank": 11
    },
    {
      "id": 58,
      "name": 'Rayo Vallecano',
      "logo": 'https://media.api-sports.io/football/teams/728.png',
      "api_id": 728,
      "league_id": 3,
      "stadium": 'Estadio de Vallecas',
      "home_city": 'Madrid'
    },
    {
      "id": 59,
      "name": 'Elche',
      "logo": 'https://media.api-sports.io/football/teams/797.png',
      "api_id": 797,
      "league_id": 3,
      "home_city": 'Elche',
      "stadium": 'Estadio Manuel Martínez Valero',
      "last_season_rank": 17
    },
    {
      "id": 60,
      "name": 'Mallorca',
      "logo": 'https://media.api-sports.io/football/teams/798.png',
      "api_id": 798,
      "league_id": 3,
      "home_city": 'Palma de Mallorca',
      "stadium": 'Visit Mallorca Estadi',
      "last_season_rank": ''
    },
    {
      "id": 61,
      "name": 'Bayern Munich',
      "logo": 'https://media.api-sports.io/football/teams/157.png',
      "api_id": 157,
      "league_id": 4,
      "home_city": 'München',
      "stadium": 'Allianz Arena',
      "last_season_rank": 1
    },
    {
      "id": 62,
      "name": 'Hertha Berlin',
      "logo": 'https://media.api-sports.io/football/teams/159.png',
      "api_id": 159,
      "league_id": 4,
      "home_city": 'Berlin',
      "stadium": 'Olympiastadion Berlin',
      "last_season_rank": 14
    },
    {
      "id": 63,
      "name": 'SC Freiburg',
      "logo": 'https://media.api-sports.io/football/teams/160.png',
      "api_id": 160,
      "league_id": 4,
      "home_city": 'Freiburg im Breisgau',
      "stadium": 'Europa-Park Stadion',
      "last_season_rank": 10
    },
    {
      "id": 64,
      "name": 'VfL Wolfsburg',
      "logo": 'https://media.api-sports.io/football/teams/161.png',
      "api_id": 161,
      "league_id": 4,
      "stadium": 'VOLKSWAGEN ARENA',
      "home_city": 'Wolfsburg',

      "last_season_rank": 4
    },
    {
      "id": 65,
      "name": 'Borussia Monchengladbach',
      "logo": 'https://media.api-sports.io/football/teams/163.png',
      "api_id": 163,
      "league_id": 4,
      "home_city": 'Mönchengladbach',
      "stadium": 'Stadion im BORUSSIA-PARK',
      "last_season_rank": 8
    },
    {
      "id": 66,
      "name": 'FSV Mainz 05',
      "logo": 'https://media.api-sports.io/football/teams/164.png',
      "api_id": 164,
      "league_id": 4,
      "home_city": 'Mainz',
      "stadium": 'MEWA ARENA',
      "last_season_rank": 12
    },
    {
      "id": 67,
      "name": 'Borussia Dortmund',
      "logo": 'https://media.api-sports.io/football/teams/165.png',
      "api_id": 165,
      "league_id": 4,
      "home_city": 'Dortmund',
      "stadium": 'Signal-Iduna-Park',
      "last_season_rank": 3
    },
    {
      "id": 68,
      "name": '1899 Hoffenheim',
      "logo": 'https://media.api-sports.io/football/teams/167.png',
      "api_id": 167,
      "league_id": 4,
      "home_city": 'Sinsheim',
      "stadium": 'PreZero Arena',
      "last_season_rank": 11
    },
    {
      "id": 69,
      "name": 'Bayer Leverkusen',
      "logo": 'https://media.api-sports.io/football/teams/168.png',
      "api_id": 168,
      "league_id": 4,
      "home_city": 'Leverkusen',
      "stadium": 'BayArena',
      "last_season_rank": 6
    },
    {
      "id": 70,
      "name": 'Eintracht Frankfurt',
      "logo": 'https://media.api-sports.io/football/teams/169.png',
      "api_id": 169,
      "league_id": 4,
      "home_city": 'Frankfurt am Main',
      "stadium": 'Deutsche Bank Park',
      "last_season_rank": 5
    },
    {
      "id": 71,
      "name": 'FC Augsburg',
      "logo": 'https://media.api-sports.io/football/teams/170.png',
      "api_id": 170,
      "league_id": 4,
      "home_city": 'Augsburg',
      "stadium": 'WWK Arena',
      "last_season_rank": 13
    },
    {
      "id": 72,
      "name": 'VfB Stuttgart',
      "logo": 'https://media.api-sports.io/football/teams/172.png',
      "api_id": 172,
      "league_id": 4,
      "home_city": 'Stuttgart',
      "stadium": 'Mercedes-Benz-Arena',
      "last_season_rank": 9
    },
    {
      "id": 73,
      "name": 'RB Leipzig',
      "logo": 'https://media.api-sports.io/football/teams/173.png',
      "api_id": 173,
      "league_id": 4,
      "home_city": 'Leipzig',
      "stadium": 'Red Bull Arena',
      "last_season_rank": 2
    },
    {
      "id": 74,
      "name": 'VfL BOCHUM',
      "logo": 'https://media.api-sports.io/football/teams/176.png',
      "api_id": 176,
      "league_id": 4,
      "home_city": 'Bochum',
      "stadium": 'Vonovia Ruhrstadion',
      "last_season_rank": ''
    },
    {
      "id": 75,
      "name": 'SpVgg Greuther Furth',
      "logo": 'https://media.api-sports.io/football/teams/178.png',
      "api_id": 178,
      "league_id": 4,
      "home_city": 'Fürth',
      "stadium": 'Sportpark Ronhof Thomas Sommer',
      "last_season_rank": ''
    },
    {
      "id": 76,
      "name": 'Union Berlin',
      "logo": 'https://media.api-sports.io/football/teams/182.png',
      "api_id": 182,
      "league_id": 4,
      "home_city": 'Berlin',
      "stadium": 'Stadion An der Alten Försterei',
      "last_season_rank": 7
    },
    {
      "id": 77,
      "name": 'Arminia Bielefeld',
      "logo": 'https://media.api-sports.io/football/teams/188.png',
      "api_id": 188,
      "league_id": 4,
      "home_city": 'Bielefeld',
      "stadium": 'SchücoArena',
      "last_season_rank": 15
    },
    {
      "id": 78,
      "name": 'FC Koln',
      "logo": 'https://media.api-sports.io/football/teams/192.png',
      "api_id": 192,
      "league_id": 4,
      "home_city": 'Köln',
      "stadium": 'RheinEnergieStadion',
      "last_season_rank": 16
    }
  ]
)
