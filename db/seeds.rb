# frozen_string_literal: true

League.create(
  [
    {
      "id": 1,
      "api_id": 39,
      "name": 'Premier',
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
      "name": 'Bundes',
      "logo": 'https://media.api-sports.io/football/leagues/78.png'
    }
  ]
)

Team.create(
  [
    # --------- Premier ---------------
    {
      "id": 33,
      "name": 'Manchester United',
      "code": 'MUN',
      "logo": 'https://media.api-sports.io/football/teams/33.png',
      "api_id": 33,
      "league_id": 1,
      "home_city": 'Manchester',
      "stadium": 'Old Trafford',
      "last_season_rank": 8,
      "active": true
    },
    {
      "id": 34,
      "name": 'Newcastle',
      "code": 'NEW',
      "logo": 'https://media.api-sports.io/football/teams/34.png',
      "api_id": 34,
      "league_id": 1,
      "home_city": 'Newcastle upon Tyne',
      "stadium": "St. James' Park",
      "last_season_rank": 7,
      "active": true
    },
    {
      "id": 38,
      "name": 'Watford',
      "logo": 'https://media.api-sports.io/football/teams/38.png',
      "api_id": 38,
      "league_id": 1,
      "home_city": 'Watford',
      "stadium": 'Vicarage Road',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 35,
      "name": 'Bournemouth',
      "code": 'BOU',
      "logo": 'https://media.api-sports.io/football/teams/35.png',
      "api_id": 35,
      "league_id": 1,
      "home_city": 'Bournemouth',
      "stadium": 'Vitality Stadium',
      "last_season_rank": 12,
      "active": true
    },
    {
      "id": 36,
      "name": 'Fulham',
      "code": 'FUL',
      "logo": 'https://media.api-sports.io/football/teams/36.png',
      "api_id": 36,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Craven Cottage',
      "last_season_rank": 13,
      "active": true
    },
    {
      "id": 39,
      "name": 'Wolves',
      "code": 'WOL',
      "logo": 'https://media.api-sports.io/football/teams/39.png',
      "api_id": 39,
      "league_id": 1,
      "home_city": 'Wolverhampton, West Midlands',
      "stadium": 'Molineux Stadium',
      "last_season_rank": 14,
      "active": true
    },
    {
      "id": 40,
      "name": 'Liverpool',
      "code": 'LIV',
      "logo": 'https://media.api-sports.io/football/teams/40.png',
      "api_id": 40,
      "league_id": 1,
      "home_city": 'Liverpool',
      "stadium": 'Anfield',
      "last_season_rank": 3,
      "active": true
    },
    {
      "id": 41,
      "name": 'Southampton',
      "code": 'SOU',
      "logo": 'https://media.api-sports.io/football/teams/41.png',
      "api_id": 41,
      "league_id": 1,
      "home_city": 'Southampton, Hampshire',
      "stadium": "St. Mary's Stadium",
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 42,
      "name": 'Arsenal',
      "code": 'ARS',
      "logo": 'https://media.api-sports.io/football/teams/42.png',
      "api_id": 42,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Emirates Stadium',
      "last_season_rank": 2,
      "active": true
    },
    {
      "id": 44,
      "name": 'Burnley',
      "logo": 'https://media.api-sports.io/football/teams/44.png',
      "api_id": 44,
      "league_id": 1,
      "home_city": 'Burnley',
      "stadium": 'Turf Moor',
      "last_season_rank": 19,
      "active": false
    },
    {
      "id": 45,
      "name": 'Everton',
      "code": 'EVE',
      "logo": 'https://media.api-sports.io/football/teams/45.png',
      "api_id": 45,
      "league_id": 1,
      "home_city": 'Liverpool',
      "stadium": 'Goodison Park',
      "last_season_rank": 15,
      "active": true
    },
    {
      "id": 46,
      "name": 'Leicester',
      "code": 'LEI',
      "logo": 'https://media.api-sports.io/football/teams/46.png',
      "api_id": 46,
      "league_id": 1,
      "home_city": 'Leicester, Leicestershire',
      "stadium": 'King Power Stadium',
      "last_season_rank": 8,
      "active": true
    },
    {
      "id": 47,
      "name": 'Tottenham',
      "code": 'TOT',
      "logo": 'https://media.api-sports.io/football/teams/47.png',
      "api_id": 47,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Tottenham Hotspur Stadium',
      "last_season_rank": 5,
      "active": true
    },
    {
      "id": 48,
      "name": 'West Ham',
      "code": 'WES',
      "logo": 'https://media.api-sports.io/football/teams/48.png',
      "api_id": 48,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'London Stadium',
      "last_season_rank": 9,
      "active": true
    },
    {
      "id": 49,
      "name": 'Chelsea',
      "code": 'CHE',
      "logo": 'https://media.api-sports.io/football/teams/49.png',
      "api_id": 49,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Stamford Bridge',
      "last_season_rank": 6,
      "active": true
    },
    {
      "id": 50,
      "name": 'Manchester City',
      "code": 'MAC',
      "logo": 'https://media.api-sports.io/football/teams/50.png',
      "api_id": 50,
      "league_id": 1,
      "home_city": 'Manchester',
      "stadium": 'Etihad Stadium',
      "last_season_rank": 1,
      "active": true
    },
    {
      "id": 51,
      "name": 'Brighton',
      "code": 'BRI',
      "logo": 'https://media.api-sports.io/football/teams/51.png',
      "api_id": 51,
      "league_id": 1,
      "home_city": 'Falmer, East Sussex',
      "stadium": 'The American Express Community Stadium',
      "last_season_rank": 11,
      "active": true
    },
    {
      "id": 52,
      "name": 'Crystal Palace',
      "code": 'CRY',
      "logo": 'https://media.api-sports.io/football/teams/52.png',
      "api_id": 52,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Selhurst Park',
      "last_season_rank": 10,
      "active": true
    },
    {
      "id": 55,
      "name": 'Brentford',
      "code": 'BRE',
      "logo": 'https://media.api-sports.io/football/teams/55.png',
      "api_id": 55,
      "league_id": 1,
      "home_city": 'London',
      "stadium": 'Brentford Community Stadium',
      "last_season_rank": 16,
      "active": true
    },
    {
      "id": 63,
      "name": 'Leeds',
      "code": 'LEE',
      "logo": 'https://media.api-sports.io/football/teams/63.png',
      "api_id": 63,
      "league_id": 1,
      "home_city": 'Leeds',
      "stadium": 'Elland Road',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 57,
      "name": 'Ipswich',
      "code": 'IPS',
      "logo": 'https://media.api-sports.io/football/teams/57.png',
      "api_id": 57,
      "league_id": 1,
      "home_city": 'Ipswich',
      "stadium": 'Portman Road',
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 65,
      "name": 'Nottm Forest',
      "code": 'NOT',
      "logo": 'https://media.api-sports.io/football/teams/65.png',
      "api_id": 65,
      "league_id": 1,
      "home_city": 'Nottingham',
      "stadium": 'The City Ground',
      "last_season_rank": 16,
      "active": true
    },
    {
      "id": 66,
      "name": 'Aston Villa',
      "code": 'AST',
      "logo": 'https://media.api-sports.io/football/teams/66.png',
      "api_id": 66,
      "league_id": 1,
      "home_city": 'Birmingham',
      "stadium": 'Villa Park',
      "last_season_rank": 4,
      "active": true
    },
    {
      "id": 62,
      "name": 'Sheffield Utd',
      "code": 'SHE',
      "logo": 'https://media-4.api-sports.io/football/teams/62.png',
      "api_id": 62,
      "league_id": 1,
      "home_city": 'Sheffield',
      "stadium": 'Bramall Lane',
      "last_season_rank": 20,
      "active": false
    },
    {
      "id": 1359,
      "name": 'Luton',
      "code": 'LUT',
      "logo": 'https://media-4.api-sports.io/football/teams/1359.png',
      "api_id": 1359,
      "league_id": 1,
      "home_city": 'Luton',
      "stadium": 'Kenilworth Road',
      "last_season_rank": 18,
      "active": false
    },
    {
      "id": 71,
      "name": 'Norwich',
      "logo": 'https://media.api-sports.io/football/teams/71.png',
      "api_id": 71,
      "league_id": 1,
      "home_city": 'Norwich, Norfolk',
      "stadium": 'Carrow Road',
      "last_season_rank": '',
      "active": false
    },
    # --------- SelieA ---------------
    {
      "id": 487,
      "name": 'Lazio',
      "code": 'LAZ',
      "logo": 'https://media.api-sports.io/football/teams/487.png',
      "api_id": 487,
      "league_id": 2,
      "home_city": 'Roma',
      "stadium": 'Stadio Olimpico',
      "last_season_rank": 7,
      "active": true
    },
    {
      "id": 488,
      "name": 'Sassuolo',
      "code": 'SAS',
      "logo": 'https://media.api-sports.io/football/teams/488.png',
      "api_id": 488,
      "league_id": 2,
      "home_city": 'Reggio nell&apos;Emilia',
      "stadium": 'MAPEI Stadium - Città del Tricolore',
      "last_season_rank": 19,
      "active": false
    },
    {
      "id": 489,
      "name": 'AC Milan',
      "code": 'MIL',
      "logo": 'https://media.api-sports.io/football/teams/489.png',
      "api_id": 489,
      "league_id": 2,
      "home_city": 'Milano',
      "stadium": 'Stadio Giuseppe Meazza',
      "last_season_rank": 2,
      "active": true
    },
    {
      "id": 490,
      "name": 'Cagliari',
      "logo": 'https://media.api-sports.io/football/teams/490.png',
      "api_id": 490,
      "league_id": 2,
      "home_city": 'Cagliari',
      "stadium": 'Unipol Domus',
      "last_season_rank": 16,
      "active": true
    },
    {
      "id": 492,
      "name": 'Napoli',
      "code": 'NAP',
      "logo": 'https://media.api-sports.io/football/teams/492.png',
      "api_id": 492,
      "league_id": 2,
      "home_city": 'Napoli',
      "stadium": 'Stadio Diego Armando Maradona',
      "last_season_rank": 10,
      "active": true
    },
    {
      "id": 494,
      "name": 'Udinese',
      "code": 'UDI',
      "logo": 'https://media.api-sports.io/football/teams/494.png',
      "api_id": 494,
      "league_id": 2,
      "home_city": 'Udine',
      "stadium": 'Dacia Arena',
      "last_season_rank": 15,
      "active": true
    },
    {
      "id": 495,
      "name": 'Genoa',
      "logo": 'https://media.api-sports.io/football/teams/495.png',
      "api_id": 495,
      "league_id": 2,
      "home_city": 'Genova',
      "stadium": 'Stadio Comunale Luigi Ferraris',
      "last_season_rank": 11,
      "active": true
    },
    {
      "id": 496,
      "name": 'Juventus',
      "code": 'JUV',
      "logo": 'https://media.api-sports.io/football/teams/496.png',
      "api_id": 496,
      "league_id": 2,
      "home_city": 'Torino',
      "stadium": 'Allianz Stadium',
      "last_season_rank": 3,
      "active": true
    },
    {
      "id": 497,
      "name": 'AS Roma',
      "code": 'ROM',
      "logo": 'https://media.api-sports.io/football/teams/497.png',
      "api_id": 497,
      "league_id": 2,
      "home_city": 'Roma',
      "stadium": 'Stadio Olimpico',
      "last_season_rank": 6,
      "active": true
    },
    {
      "id": 498,
      "name": 'Sampdoria',
      "code": 'SAM',
      "logo": 'https://media.api-sports.io/football/teams/498.png',
      "api_id": 498,
      "league_id": 2,
      "home_city": 'Genova',
      "stadium": 'Stadio Comunale Luigi Ferraris',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 499,
      "name": 'Atalanta',
      "code": 'ATA',
      "logo": 'https://media.api-sports.io/football/teams/499.png',
      "api_id": 499,
      "league_id": 2,
      "home_city": 'Bergamo',
      "stadium": 'Gewiss Stadium',
      "last_season_rank": 4,
      "active": true
    },
    {
      "id": 500,
      "name": 'Bologna',
      "code": 'BOL',
      "logo": 'https://media.api-sports.io/football/teams/500.png',
      "api_id": 500,
      "league_id": 2,
      "home_city": 'Bologna',
      "stadium": "Stadio Renato Dall'Ara",
      "last_season_rank": 5,
      "active": true
    },
    {
      "id": 502,
      "name": 'Fiorentina',
      "code": 'FIO',
      "logo": 'https://media.api-sports.io/football/teams/502.png',
      "api_id": 502,
      "league_id": 2,
      "home_city": 'Firenze',
      "stadium": 'Stadio Artemio Franchi',
      "last_season_rank": 8,
      "active": true
    },
    {
      "id": 503,
      "name": 'Torino',
      "code": 'TOR',
      "logo": 'https://media.api-sports.io/football/teams/503.png',
      "api_id": 503,
      "league_id": 2,
      "home_city": 'Torino',
      "stadium": 'Stadio Olimpico Grande Torino',
      "last_season_rank": 9,
      "active": true
    },
    {
      "id": 504,
      "name": 'Verona',
      "code": 'VER',
      "logo": 'https://media.api-sports.io/football/teams/504.png',
      "api_id": 504,
      "league_id": 2,
      "home_city": 'Verona',
      "stadium": "Stadio Marc'Antonio Bentegodi",
      "last_season_rank": 13,
      "active": true
    },
    {
      "id": 505,
      "name": 'Inter',
      "code": 'INT',
      "logo": 'https://media.api-sports.io/football/teams/505.png',
      "api_id": 505,
      "league_id": 2,
      "home_city": 'Milano',
      "stadium": 'Stadio Giuseppe Meazza',
      "last_season_rank": 1,
      "active": true
    },
    {
      "id": 511,
      "name": 'Empoli',
      "code": 'EMP',
      "logo": 'https://media.api-sports.io/football/teams/511.png',
      "api_id": 511,
      "league_id": 2,
      "home_city": 'Empoli',
      "stadium": 'Stadio Carlo Castellani',
      "last_season_rank": 17,
      "active": true
    },
    {
      "id": 512,
      "name": 'Frosinone',
      "code": 'FRO',
      "logo": 'https://media-4.api-sports.io/football/teams/512.png',
      "api_id": 512,
      "league_id": 2,
      "home_city": 'Frosinone',
      "stadium": 'Stadio Benito Stirpe',
      "last_season_rank": 18,
      "active": false
    },
    {
      "id": 514,
      "name": 'Salernitana',
      "code": 'SAL',
      "logo": 'https://media.api-sports.io/football/teams/514.png',
      "api_id": 514,
      "league_id": 2,
      "home_city": 'Salerno',
      "stadium": 'Stadio Arechi',
      "last_season_rank": 20,
      "active": false
    },
    {
      "id": 515,
      "name": 'Spezia',
      "code": 'SPE',
      "logo": 'https://media.api-sports.io/football/teams/515.png',
      "api_id": 515,
      "league_id": 2,
      "home_city": 'La Spezia',
      "stadium": 'Stadio Alberto Picco',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 517,
      "name": 'Venezia',
      "logo": 'https://media.api-sports.io/football/teams/517.png',
      "api_id": 517,
      "league_id": 2,
      "home_city": 'Venezia',
      "stadium": 'Stadio Pierluigi Penzo',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 520,
      "name": 'Cremonese',
      "code": 'CRE',
      "logo": 'https://media.api-sports.io/football/teams/520.png',
      "api_id": 520,
      "league_id": 2,
      "home_city": 'Cremona',
      "stadium": 'Stadio Giovanni Zini',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 523,
      "name": 'Parma',
      "code": 'PAR',
      "logo": 'https://media.api-sports.io/football/teams/523.png',
      "api_id": 523,
      "league_id": 2,
      "home_city": 'Parma',
      "stadium": 'Stadio Ennio Tardini',
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 867,
      "name": 'Lecce',
      "code": 'LEC',
      "logo": 'https://media.api-sports.io/football/teams/867.png',
      "api_id": 867,
      "league_id": 2,
      "home_city": 'Lecce',
      "stadium": 'Stadio Comunale Via del Mare',
      "last_season_rank": 14,
      "active": true
    },
    {
      "id": 892,
      "name": 'Como',
      "code": 'COM',
      "logo": 'https://media.api-sports.io/football/teams/892.png',
      "api_id": 892,
      "league_id": 2,
      "home_city": 'Como',
      "stadium": 'Stadio Giuseppe Sinigaglia',
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 1579,
      "name": 'Monza',
      "code": 'MON',
      "logo": 'https://media.api-sports.io/football/teams/1579.png',
      "api_id": 1579,
      "league_id": 2,
      "home_city": 'Monza',
      "stadium": 'U-Power Stadium',
      "last_season_rank": 12,
      "active": true
    },
    # --------- LaLiga ---------------
    {
      "id": 529,
      "name": 'Barcelona',
      "code": 'BAR',
      "logo": 'https://media.api-sports.io/football/teams/529.png',
      "api_id": 529,
      "league_id": 3,
      "home_city": 'Barcelona',
      "stadium": 'Camp Nou',
      "last_season_rank": 2,
      "active": true
    },
    {
      "id": 530,
      "name": 'Atletico Madrid',
      "code": 'MAD',
      "logo": 'https://media.api-sports.io/football/teams/530.png',
      "api_id": 530,
      "league_id": 3,
      "home_city": 'Madrid',
      "stadium": 'Estadio Wanda Metropolitano',
      "last_season_rank": 4,
      "active": true
    },
    {
      "id": 531,
      "name": 'Athletic Club',
      "code": 'BIL',
      "logo": 'https://media.api-sports.io/football/teams/531.png',
      "api_id": 531,
      "league_id": 3,
      "home_city": 'Bilbao',
      "stadium": 'San Mamés Barria',
      "last_season_rank": 5,
      "active": true
    },
    {
      "id": 532,
      "name": 'Valencia',
      "code": 'VAL',
      "logo": 'https://media.api-sports.io/football/teams/532.png',
      "api_id": 532,
      "league_id": 3,
      "home_city": 'Valencia',
      "stadium": 'Estadio de Mestalla',
      "last_season_rank": 9,
      "active": true
    },
    {
      "id": 533,
      "name": 'Villarreal',
      "code": 'VIL',
      "logo": 'https://media.api-sports.io/football/teams/533.png',
      "api_id": 533,
      "league_id": 3,
      "home_city": 'Villarreal',
      "stadium": 'Estadio de la Cerámica',
      "last_season_rank": 8,
      "active": true
    },
    {
      "id": 534,
      "name": 'Las Palmas',
      "code": 'PAL',
      "logo": 'https://media-4.api-sports.io/football/teams/534.png',
      "api_id": 534,
      "league_id": 3,
      "home_city": 'Las Palmas de Gran Canaria',
      "stadium": 'Estadio de Gran Canaria',
      "last_season_rank": 15,
      "active": true
    },
    {
      "id": 536,
      "name": 'Sevilla',
      "code": 'SEV',
      "logo": 'https://media.api-sports.io/football/teams/536.png',
      "api_id": 536,
      "league_id": 3,
      "home_city": 'Sevilla',
      "stadium": 'Estadio Ramón Sánchez Pizjuán',
      "last_season_rank": 13,
      "active": true
    },
    {
      "id": 537,
      "name": 'Leganes',
      "code": 'LEG',
      "logo": 'https://media.api-sports.io/football/teams/537.png',
      "api_id": 537,
      "league_id": 3,
      "home_city": 'Leganés',
      "stadium": 'Estadio Municipal de Butarque',
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 538,
      "name": 'Celta Vigo',
      "code": 'CEL',
      "logo": 'https://media.api-sports.io/football/teams/538.png',
      "api_id": 538,
      "league_id": 3,
      "home_city": 'Vigo',
      "stadium": 'Abanca-Balaídos',
      "last_season_rank": 14,
      "active": true
    },
    {
      "id": 539,
      "name": 'Levante',
      "logo": 'https://media.api-sports.io/football/teams/539.png',
      "api_id": 539,
      "league_id": 3,
      "home_city": 'Valencia',
      "stadium": 'Estadio Ciudad de Valencia',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 540,
      "name": 'Espanyol',
      "code": 'ESP',
      "logo": 'https://media.api-sports.io/football/teams/540.png',
      "api_id": 540,
      "league_id": 3,
      "home_city": 'Cornella de Llobregat',
      "stadium": 'RCDE Stadium',
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 541,
      "name": 'Real Madrid',
      "code": 'REA',
      "logo": 'https://media.api-sports.io/football/teams/541.png',
      "api_id": 541,
      "league_id": 3,
      "home_city": 'Madrid',
      "stadium": 'Estadio Santiago Bernabéu',
      "last_season_rank": 1,
      "active": true
    },
    {
      "id": 542,
      "name": 'Alaves',
      "logo": 'https://media.api-sports.io/football/teams/542.png',
      "api_id": 542,
      "league_id": 3,
      "home_city": 'Vitoria-Gasteiz',
      "stadium": 'Estadio de Mendizorroza',
      "last_season_rank": 10,
      "active": true
    },
    {
      "id": 543,
      "name": 'Real Betis',
      "code": 'BET',
      "logo": 'https://media.api-sports.io/football/teams/543.png',
      "api_id": 543,
      "league_id": 3,
      "home_city": 'Sevilla',
      "stadium": 'Estadio Benito Villamarín',
      "last_season_rank": 7,
      "active": true
    },
    {
      "id": 546,
      "name": 'Getafe',
      "code": 'GET',
      "logo": 'https://media.api-sports.io/football/teams/546.png',
      "api_id": 546,
      "league_id": 3,
      "home_city": 'Getafe',
      "stadium": 'Coliseum Alfonso Pérez',
      "last_season_rank": 12,
      "active": true
    },
    {
      "id": 547,
      "name": 'Girona',
      "code": 'GIR',
      "logo": 'https://media.api-sports.io/football/teams/547.png',
      "api_id": 547,
      "league_id": 3,
      "home_city": 'Girona',
      "stadium": 'Estadi Municipal de Montilivi',
      "last_season_rank": 3,
      "active": true
    },
    {
      "id": 548,
      "name": 'Real Sociedad',
      "code": 'RSO',
      "logo": 'https://media.api-sports.io/football/teams/548.png',
      "api_id": 548,
      "league_id": 3,
      "home_city": 'Donostia-San Sebastián',
      "stadium": 'Reale Arena',
      "last_season_rank": 6,
      "active": true
    },
    {
      "id": 715,
      "name": 'Granada CF',
      "logo": 'https://media.api-sports.io/football/teams/715.png',
      "api_id": 715,
      "league_id": 3,
      "home_city": 'Granada',
      "stadium": 'Estadio Nuevo Los Cármenes',
      "last_season_rank": 19,
      "active": false
    },
    {
      "id": 720,
      "name": 'Valladolid',
      "code": 'VAL',
      "logo": 'https://media.api-sports.io/football/teams/720.png',
      "api_id": 720,
      "league_id": 3,
      "home_city": 'Avenida del Mundial 82',
      "stadium": 'Estadio Municipal José Zorrilla',
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 723,
      "name": 'Almeria',
      "code": 'ALM',
      "logo": 'https://media.api-sports.io/football/teams/723.png',
      "api_id": 723,
      "league_id": 3,
      "home_city": 'Calle de Belladona',
      "stadium": 'Estadio de los Juegos Mediterráneos',
      "last_season_rank": 20,
      "active": false
    },

    {
      "id": 724,
      "name": 'Cadiz',
      "code": 'CAD',
      "logo": 'https://media.api-sports.io/football/teams/724.png',
      "api_id": 724,
      "league_id": 3,
      "home_city": 'Cádiz',
      "stadium": 'Estadio Nuevo Mirandilla',
      "last_season_rank": 18,
      "active": false
    },
    {
      "id": 727,
      "name": 'Osasuna',
      "code": 'OSA',
      "logo": 'https://media.api-sports.io/football/teams/727.png',
      "api_id": 727,
      "league_id": 3,
      "home_city": 'Iruñea',
      "stadium": 'Estadio El Sadar',
      "last_season_rank": 11,
      "active": true
    },
    {
      "id": 728,
      "name": 'Rayo Vallecano',
      "code": 'RAY',
      "logo": 'https://media.api-sports.io/football/teams/728.png',
      "api_id": 728,
      "league_id": 3,
      "stadium": 'Estadio de Vallecas',
      "home_city": 'Madrid',
      "last_season_rank": 16,
      "active": true
    },
    {
      "id": 797,
      "name": 'Elche',
      "code": 'ELC',
      "logo": 'https://media.api-sports.io/football/teams/797.png',
      "api_id": 797,
      "league_id": 3,
      "home_city": 'Elche',
      "stadium": 'Estadio Manuel Martínez Valero',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 798,
      "name": 'Mallorca',
      "code": 'MAL',
      "logo": 'https://media.api-sports.io/football/teams/798.png',
      "api_id": 798,
      "league_id": 3,
      "home_city": 'Palma de Mallorca',
      "stadium": 'Visit Mallorca Estadi',
      "last_season_rank": 17,
      "active": true
    },
    # --------- Bundes ---------------
    {
      "id": 157,
      "name": 'Bayern Munich',
      "code": 'BAY',
      "logo": 'https://media.api-sports.io/football/teams/157.png',
      "api_id": 157,
      "league_id": 4,
      "home_city": 'München',
      "stadium": 'Allianz Arena',
      "last_season_rank": 3,
      "active": true
    },
    {
      "id": 159,
      "name": 'Hertha Berlin',
      "code": 'HER',
      "logo": 'https://media.api-sports.io/football/teams/159.png',
      "api_id": 159,
      "league_id": 4,
      "home_city": 'Berlin',
      "stadium": 'Olympiastadion Berlin',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 160,
      "name": 'SC Freiburg',
      "code": 'FRE',
      "logo": 'https://media.api-sports.io/football/teams/160.png',
      "api_id": 160,
      "league_id": 4,
      "home_city": 'Freiburg im Breisgau',
      "stadium": 'Europa-Park Stadion',
      "last_season_rank": 10,
      "active": true
    },
    {
      "id": 161,
      "name": 'VfL Wolfsburg',
      "code": 'WOL',
      "logo": 'https://media.api-sports.io/football/teams/161.png',
      "api_id": 161,
      "league_id": 4,
      "stadium": 'VOLKSWAGEN ARENA',
      "home_city": 'Wolfsburg',
      "last_season_rank": 12,
      "active": true
    },
    {
      "id": 162,
      "name": 'Werder Bremen',
      "code": 'WER',
      "logo": 'https://media.api-sports.io/football/teams/162.png',
      "api_id": 162,
      "league_id": 4,
      "stadium": 'wohninvest WESERSTADION',
      "home_city": 'Bremen',
      "last_season_rank": 15,
      "active": true
    },
    {
      "id": 163,
      "name": 'Borussia Monchengladbach',
      "code": 'MOE',
      "logo": 'https://media.api-sports.io/football/teams/163.png',
      "api_id": 163,
      "league_id": 4,
      "home_city": 'Mönchengladbach',
      "stadium": 'Stadion im BORUSSIA-PARK',
      "last_season_rank": 14,
      "active": true
    },
    {
      "id": 164,
      "name": 'FSV Mainz 05',
      "code": 'MAI',
      "logo": 'https://media.api-sports.io/football/teams/164.png',
      "api_id": 164,
      "league_id": 4,
      "home_city": 'Mainz',
      "stadium": 'MEWA ARENA',
      "last_season_rank": 13,
      "active": true
    },
    {
      "id": 165,
      "name": 'Borussia Dortmund',
      "code": 'DOR',
      "logo": 'https://media.api-sports.io/football/teams/165.png',
      "api_id": 165,
      "league_id": 4,
      "home_city": 'Dortmund',
      "stadium": 'Signal-Iduna-Park',
      "last_season_rank": 5,
      "active": true
    },
    {
      "id": 167,
      "name": '1899 Hoffenheim',
      "code": 'HOF',
      "logo": 'https://media.api-sports.io/football/teams/167.png',
      "api_id": 167,
      "league_id": 4,
      "home_city": 'Sinsheim',
      "stadium": 'PreZero Arena',
      "last_season_rank": 7,
      "active": true
    },
    {
      "id": 168,
      "name": 'Bayer Leverkusen',
      "code": 'BAY',
      "logo": 'https://media.api-sports.io/football/teams/168.png',
      "api_id": 168,
      "league_id": 4,
      "home_city": 'Leverkusen',
      "stadium": 'BayArena',
      "last_season_rank": 1,
      "active": true
    },
    {
      "id": 169,
      "name": 'Eintracht Frankfurt',
      "code": 'EIN',
      "logo": 'https://media.api-sports.io/football/teams/169.png',
      "api_id": 169,
      "league_id": 4,
      "home_city": 'Frankfurt am Main',
      "stadium": 'Deutsche Bank Park',
      "last_season_rank": 6,
      "active": true
    },
    {
      "id": 170,
      "name": 'FC Augsburg',
      "code": 'AUG',
      "logo": 'https://media.api-sports.io/football/teams/170.png',
      "api_id": 170,
      "league_id": 4,
      "home_city": 'Augsburg',
      "stadium": 'WWK Arena',
      "last_season_rank": 11,
      "active": true
    },
    {
      "id": 172,
      "name": 'VfB Stuttgart',
      "code": 'STU',
      "logo": 'https://media.api-sports.io/football/teams/172.png',
      "api_id": 172,
      "league_id": 4,
      "home_city": 'Stuttgart',
      "stadium": 'Mercedes-Benz-Arena',
      "last_season_rank": 2,
      "active": true
    },
    {
      "id": 173,
      "name": 'RB Leipzig',
      "code": 'LEI',
      "logo": 'https://media.api-sports.io/football/teams/173.png',
      "api_id": 173,
      "league_id": 4,
      "home_city": 'Leipzig',
      "stadium": 'Red Bull Arena',
      "last_season_rank": 4,
      "active": true
    },
    {
      "id": 174,
      "name": 'FC Schalke 04',
      "code": 'SCH',
      "logo": 'https://media.api-sports.io/football/teams/174.png',
      "api_id": 174,
      "league_id": 4,
      "home_city": 'Gelsenkirchen',
      "stadium": 'VELTINS-Arena',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 176,
      "name": 'VfL BOCHUM',
      "code": 'BOC',
      "logo": 'https://media.api-sports.io/football/teams/176.png',
      "api_id": 176,
      "league_id": 4,
      "home_city": 'Bochum',
      "stadium": 'Vonovia Ruhrstadion',
      "last_season_rank": 16,
      "active": true
    },
    {
      "id": 178,
      "name": 'SpVgg Greuther Furth',
      "logo": 'https://media.api-sports.io/football/teams/178.png',
      "api_id": 178,
      "league_id": 4,
      "home_city": 'Fürth',
      "stadium": 'Sportpark Ronhof Thomas Sommer',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 180,
      "name": 'FC Heidenheim',
      "code": 'HEI',
      "logo": 'https://media-4.api-sports.io/football/teams/180.png',
      "api_id": 180,
      "league_id": 4,
      "home_city": 'Heidenheim an der Brenz',
      "stadium": 'Voith-Arena',
      "last_season_rank": 8,
      "active": true
    },
    {
      "id": 181,
      "name": 'SV Darmstadt 98',
      "code": 'DAR',
      "logo": 'https://media-4.api-sports.io/football/teams/181.png',
      "api_id": 181,
      "league_id": 4,
      "home_city": 'Darmstadt',
      "stadium": 'Merck-Stadion am Böllenfalltor',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 182,
      "name": 'Union Berlin',
      "code": 'UNI',
      "logo": 'https://media.api-sports.io/football/teams/182.png',
      "api_id": 182,
      "league_id": 4,
      "home_city": 'Berlin',
      "stadium": 'Stadion An der Alten Försterei',
      "last_season_rank": 15,
      "active": true
    },
    {
      "id": 186,
      "name": 'FC St. Pauli',
      "code": 'PAU',
      "logo": 'https://media.api-sports.io/football/teams/186.png',
      "api_id": 186,
      "league_id": 4,
      "home_city": 'Hamburg',
      "stadium": 'Millerntor-Stadion',
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 188,
      "name": 'Arminia Bielefeld',
      "logo": 'https://media.api-sports.io/football/teams/188.png',
      "api_id": 188,
      "league_id": 4,
      "home_city": 'Bielefeld',
      "stadium": 'SchücoArena',
      "last_season_rank": '',
      "active": false
    },
    {
      "id": 191,
      "name": 'Holstein Kiel',
      "code": 'HOL',
      "logo": 'https://media.api-sports.io/football/teams/188.png',
      "api_id": 188,
      "league_id": 4,
      "home_city": 'Bielefeld',
      "stadium": 'SchücoArena',
      "last_season_rank": '',
      "active": true
    },
    {
      "id": 192,
      "name": 'FC Koln',
      "code": 'KOL',
      "logo": 'https://media.api-sports.io/football/teams/192.png',
      "api_id": 192,
      "league_id": 4,
      "home_city": 'Köln',
      "stadium": 'RheinEnergieStadion',
      "last_season_rank": '',
      "active": false
    }
  ]
)
