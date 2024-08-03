# Football MyTeam

## About

`Football MyTeam`は、ユーザーが応援しているチームのリーグ戦・試合情報を簡単に知ることができるサービスです。

ユーザーが登録したチームの試合日程と試合結果、リーグ戦の順位や勝ち点等をひと目で確認することができます。

[![Image from Gyazo](https://i.gyazo.com/f34215196b6da01b989d16cf55a177b8.png)](https://gyazo.com/f34215196b6da01b989d16cf55a177b8)

応援しているチームの他にライバルチームも登録することができます。
欧州カップ戦出場権争いや残留争いをしているチームを登録すれば、日々の順位争いと今後の順位変動を予測することに役立ちます。

## アーキテクチャ

[![Image from Gyazo](https://i.gyazo.com/055e0a6c5c7f75040b7bf1f7906f7321.png)](https://gyazo.com/055e0a6c5c7f75040b7bf1f7906f7321)

## ERD
[![Image from Gyazo](https://i.gyazo.com/39194ff110f61d299f82a98f84befbdc.png)](https://gyazo.com/39194ff110f61d299f82a98f84befbdc)

## Setup

### initialization

```
$ https://github.com/R-Tsukada/football-myteam.git
```

```
$ cd football-myteam
```

```
$ bin/setup
```

### environment variable

以下のサイトでアカウント登録をし、APIキーを取得する

```
https://www.api-football.com/
```

APIキーを登録するために `.env` を作成する

```
$ touch .env
```

```
# Example of '.env'

HOST = 'v3.football.api-sports.io'
KEY = '********************************' APIキーを入力

```

### seed

```
$ bin/rails db:seed
```

### Lint & Prettier & rubocop

```
$ bundle exec bin/lint
```

### RSpec

```
$ bundle exec rspec
```

### Run

```
$ bin/rails s
```
