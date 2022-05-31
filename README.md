# Football MyTeam
## About
`Football MyTeam`は、あなたが応援しているチームのリーグ戦・試合情報を簡単に知ることができるサービスです。

あなたが応援しているチームの試合日程と試合結果、リーグ戦の順位や勝ち点等をひと目で確認することができます。

<img width="1436" alt="Football" src="https://user-images.githubusercontent.com/62058863/171133695-e7becaa9-2f16-45a0-88a4-cee9604fac8a.png">


応援しているチームの他にライバルチームも登録することができます。
欧州カップ戦出場権争いや残留争いをしているチームを登録すれば、日々の順位争いと今後の順位変動を予測することに役立ちます！

## Setup
- initialization

```
https://github.com/R-Tsukada/football-myteam.git
```

```
cd football-myteam
```

```
bin/setup
```

- environment variable

1. 以下のサイトでアカウント登録をし、APIキーを取得する

  https://www.api-football.com/
  
2. APIキーを登録するために `.env` を作成する
```
  touch .env
```

```
example

HOST = 'v3.football.api-sports.io'
KEY = '********************************' 1で取得したAPIキーを入力

```

### seed
```
bin/rails db:seed
```

### Lint & Prettier & rubocop

```
bundle exec bin/lint
```

### RSpec

```
bundle exec rspec
```

### Run

```
bin/rails s
```

## Demo

1. [Football MyTeam](https://football-myteam.herokuapp.com/)にアクセスし、アカウントを作成してください

<img width="1429" alt="Football" src="https://user-images.githubusercontent.com/62058863/171121840-36dbf580-bc30-4a12-86d2-6718298c4b4f.png">


<img width="1414" alt="Football" src="https://user-images.githubusercontent.com/62058863/171122040-29f7df41-b975-470d-b3f8-efa4f8c6e89d.png">

2. あなたが応援しているチームが所属しているリーグを選択してください

[![Image from Gyazo](https://i.gyazo.com/4edb9c8e1a75581b2a3d3d464c4a93a3.gif)](https://gyazo.com/4edb9c8e1a75581b2a3d3d464c4a93a3)

3. リーグを1つ選ぶとチームのリストが表示されます。そのリストの中からあなたが応援しているチームを選択してください

[![Image from Gyazo](https://i.gyazo.com/6504e8e91e876fd3d9f9a3877ff89ef8.gif)](https://gyazo.com/6504e8e91e876fd3d9f9a3877ff89ef8)

4. あなたがライバルだと考えているチームを選択する方法を選んでもらいます。「何を選んだらいいか分からない」という方は、[昨シーズンの順位が近いチームを選ぶ]か[本拠地が近いチーム]を選択してください。ライバルチームを自分で選びたい場合は[自分でライバルチームを選ぶ]を選択してください。
  
[![Image from Gyazo](https://i.gyazo.com/9557f2ea97938fc1724b3e2c9ff002b1.gif)](https://gyazo.com/9557f2ea97938fc1724b3e2c9ff002b1)

5. [自分でライバルチームを選ぶ]を選択した場合は最大で3チームまで選ぶことができます。

[![Image from Gyazo](https://i.gyazo.com/d9437f233147bfe241066659b28be362.gif)](https://gyazo.com/d9437f233147bfe241066659b28be362)

6. 応援しているチームとライバルチームを登録したら、登録したチームのリーグ戦情報と直近3試合の日程表が表示されます。

<img width="1436" alt="Football" src="https://user-images.githubusercontent.com/62058863/171133537-919d01d1-c58f-4481-a78c-ebb1af56a9d9.png">

7. 登録したチームをクリックするとより多くの試合情報が表示されます。

[![Image from Gyazo](https://i.gyazo.com/90addbc3ef8dc17e942b607edc639b13.gif)](https://gyazo.com/90addbc3ef8dc17e942b607edc639b13)

8 .[登録しているチームを変更する]をクリックするとチームを選び直すことができます。

[![Image from Gyazo](https://i.gyazo.com/4c61cac6a2fe304a3ed655b922c6d698.gif)](https://gyazo.com/4c61cac6a2fe304a3ed655b922c6d698)

9. オフシーズン中はリーグ戦情報と試合日程は表示されません。

<img width="1423" alt="Football" src="https://user-images.githubusercontent.com/62058863/171130927-73b463d8-6b80-45fd-9cfb-cd058d4881ad.png">

