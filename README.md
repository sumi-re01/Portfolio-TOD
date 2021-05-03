# Trip On a Day
![logo1](https://user-images.githubusercontent.com/76669464/114664898-53d28600-9d37-11eb-8ea8-4911f279d1a9.png)

## サイト概要

TODは旅行の 1 日の日程を管理するアプリです。  
予定を立てても順番通りにいかないことも多いと思うので、やりたいことを自由に移動させて気ままな旅ライフをサポートします。  
いろんな人たちと旅の記憶や見どころを共有してみてください！

※2021年5月3日現在以下urlよりアクセスできます。

https://trip-on-a-day.com
※現在EC2で起動時間を12:00-18:00で設定しています。
### サイトテーマ

「ちいさな発見も大事にする」サイト

### テーマを選んだ理由

xx:xx ◯◯ に行く  
xx:yy △△ へ移動  
...  
のような予定表だと思わぬ掘り出し場があったときに予定が練り直しにくい！と感じているかたも多いのではないでしょうか？  
Trouver は 気ままに旅を楽しむ + やり忘れをなくす ために予定を動かして自由度の高い予定表を作成できる機能を持った web アプリケーションになっております。
また投稿機能も備え、旅の最中にふらりと道を外れたら意外と良い場所があった！という体験を共有し、旅ライフを盛り上げられればと考えこのアプリケーションを作りました。

### ターゲットユーザ

マイペースに旅を楽しみたい人

### 主な利用シーン

旅行に行けない間に他の方の投稿を眺めたりすることで次の旅行のプランにつなげることができる。
旅行中に 1 日の流れを一目でわかるように、急なアクシデントが起こっても自分のペースで楽しめる計画づくりに利用していただけます。

## 設計書

[テーブル定義書](https://docs.google.com/spreadsheets/d/1dEdgay9_17TdhS86fL5NNz_GVxSBzqoNvfXdN3fBZXk/edit?usp=sharing)
[ER 図](https://drive.google.com/file/d/1Dt7o6957U0a1JR7h3u-ma-1MHZqGPgd8/view?usp=sharing)

- ユーザー登録/ログイン機能(devise)
- SNS 認証機能
- ゲストログイン
- 日程表(Sortable, Ajax)
- 投稿機能
  - 画像投稿機能(ImageMagick, refile-mini_magick)
  - Google Map API
- 検索機能
- ブックマーク機能

## 機能一覧

<https://docs.google.com/spreadsheets/d/1wtoO4Gqmq-3DD85Eyp4Ur_n9ePESO568cGIGGAifYLE/edit?usp=sharing>

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby(2.6.3),SQL
- フレームワーク：Ruby on Rails(5.2.5)
- JS ライブラリ：jQuery
- IDE：Cloud9

## 使用素材

[FIND47](https://find47.jp/)
