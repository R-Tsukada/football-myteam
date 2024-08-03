```mermaid
erDiagram
  users ||--|| favorites : "userは1つのチームを登録"
  users ||--o{ competitors :"userは最大3チーム登録"

  users {
    bigint id PK
    string email UK "NOT NULL(Indexed)"
    string encrypted_password "default:"", NOT NULL"
    string reset_password_token
    datetime reset_password_sent_at
    datetime remember_created_at
    timestamp created_at "NOT NULL"
    timestamp updated_at "NOT NULL"
    string provider
    string uid
  }

teams ||--|| favorites : "1チームだけ登録できる"
  favorites {
    bigint id PK
    bigint user_id FK "NOT NULL (Indexed)"
    bigint team_id FK "NOT NULL (Indexed)"
    timestamp created_at "NOT NULL"
    timestamp updated_at "NOT NULL"
  }

teams ||--o{ competitors : "最大3チーム選択可能"
 competitors {
    bigint id PK
    bigint user_id FK "NOT NULL (Indexed)"
    bigint team_id FK "NOT NULL (Indexed)"
    timestamp created_at "NOT NULL"
    timestamp updated_at "NOT NULL"
  }

leagues ||--o{ teams : "一つのリーグに複数のチームが存在"
  
  teams {
    bigint id PK
    integer api_id UK "NOT NULL (Indexed)"
    string name "NOT NULL (Indexed)"
    string logo "NOT NULL (Indexed)"
    string home_city "NOT NULL"
    bigint league_id FK "(Indexed)"
    timestamp created_at "NOT NULL"
    timestamp updated_at "NOT NULL"
    string stadium
    integer last_season_rank
  }
  
  leagues {
    bigint id PK
    string name UK "NOT NULL(Indexed, UK)"
    string logo UK "NOT NULL(Indexed, UK)"
    integer api_id
    timestamp created_at "NOT NULL"
    timestamp updated_at "NOT NULL"
  }


teams ||--o{ matches : "一つのチームに複数のmatchesが存在する"
  matches {
    bigint id PK
    string season "NOT NULL"
    date date "NOT NULL"
    string competitor_name "NOT NULL"
    string competitor_logo "NOT NULL"
    string team_name "NOT NULL"
    string team_logo "NOT NULL"
    string home_score
    string away_score
    string home_and_away "NOT NULL"
    string home_team_name
    string away_team_name
    string home_logo
    string away_logo
    bigint team_id FK "Indexed"
    timestamp created_at "NOT NULL"
    timestamp updated_at "NOT NULL"
  }

teams ||--|| standings : "一つのチームに一つのstanding"
  standings {
    bigint id PK
    bigint team_id FK "NOT NULL(Indexed)"
    string team_name "NOT NULL"
    string team_logo "NOT NULL"
    integer rank "NOT NULL"
    integer points "NOT NULL"
    integer played "NOT NULL"
    timestamp created_at "NOT NULL"
    timestamp updated_at "NOT NULL"
  }
```