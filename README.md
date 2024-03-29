# アプリケーション名
Group Calendar

## 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.3.6
- Docker, Docker Compose
- Amazon EC2
- Capistrano（自動デプロイ）

# アプリケーション概要
スケジュール管理アプリです。

マイページのカレンダーに、自分が参加しているグループのカレンダーの情報も反映されるので、仕事のスケジュールもプライベートの用事も1つのカレンダーで管理できます。

同じグループメンバーにも同じスケジュールが登録されるので、グループの誰かがスケジュールを把握していなかったという事態を防げます。

またチャット機能も実装しているので、グループメンバーや他のユーザーとコミュニケーションが取れます。

ちなみに自分の英語の勉強も兼ねて、アプリ内の言語は英語に統一しています。

# URL
https://group-calendar.net/

# テスト用アカウント
トップページの「Log in as a guest」ボタン一発でログインできます。

# 利用方法
<center>スケジュール登録</center>

[![Image from Gyazo](https://i.gyazo.com/592fb215fd2e4604ffed7351af3dcd97.gif)](https://gyazo.com/592fb215fd2e4604ffed7351af3dcd97)

<center>グループ作成</center>

[![Image from Gyazo](https://i.gyazo.com/f666c9b401abd554e293ec8bea212d96.gif)](https://gyazo.com/f666c9b401abd554e293ec8bea212d96)

<center>チャット（グループ内）</center>

[![Image from Gyazo](https://i.gyazo.com/51a62eaaf36299a5348168e1e956b2d8.gif)](https://gyazo.com/51a62eaaf36299a5348168e1e956b2d8)


# 目指した課題解決
主に仕事とプライベートの境目があまりないフリーランスや自営業の方をターゲットとして、家族や友人、様々なビジネスプロジェクトなどグループごとのスケジュールを管理しつつ、それらを1つのカレンダーに集約することを目指しました。

グループごとに使用しているコミュニケーションツールが異なると、スケジュールをバラバラに管理しなければならない状態が課題だと感じていたからです。

それを解決できるアプリケーションを作りたいと思い、Group Calendarを開発しました。

今後は、副業推進などの社会的背景から個人で活動する人が増えることが予想され、プロジェクトごとに仕事をする機会が増えることを見越したアプリです。

# 洗い出した要件

| 実装したい機能 | 要件  |
| ------- | --- |
| ユーザー機能  | - ユーザー登録できる<br>- SNS認証できる<br>- ユーザー登録している場合ログインできる<br>- ユーザー情報を編集できる<br>- ログアウトできる<br>- 友達登録できる<br>- 友達同士でチャットができる |
| カレンダー機能 | - スケジュールを登録できる<br>- 登録したスケジュールを表示できる<br>- グループで登録したスケジュールを個人のカレンダーに表示できる <br>- グループカレンダーの詳細ページでチャットができる |
| グループ機能  | - グループを作成できる<br>- 自分でグループを作成した場合、自動でそのグループに参加できる<br>- グループに参加しないとグループのカレンダーが見れない<br>- グループ内でチャットができる|


# 実装した機能
- ユーザー機能
  - ユーザー登録
  - SNS認証
  - ユーザー編集
  - ゲストログイン
  - メイト（友だち機能）
  - メイトチャット
- カレンダー機能
  - カレンダー登録
  - カレンダー表示
  - カレンダー共有
  - カレンダーチャット（グループのカレンダーのみ）
- グループ機能
  - グループ作成
  - グループ編集
  - グループ参加
  - グループチャット

# アピールポイント
## 1. スケジュールをマイページで一括管理

このアプリで一番実現したかったことが、全てのスケジュールをマイページに集約することです。

家族や友達、仕事のチームなど、自分が参加しているグループのスケジュールをマイページのカレンダーに集約して表示することで、1つのカレンダーで自分の全てのスケジュールを管理できるようにしました。

マイページのカレンダーでは、グループカレンダーからのスケジュールは、「どこのグループ」のスケジュールなのかが「by グループ名」で明記されます。

<img src="https://i.gyazo.com/7bb72490712070d10d9c5905a0ed0a92.png" style="border: 1px solid #000;">

当然ですが、グループのカレンダーを開けば、そのグループだけのスケジュールが表示されます。

<img src="https://i.gyazo.com/7a53b17859bf214a9d2799e5ab2a25b5.png" style="border: 1px solid #000;">

## 2. レスポンシブ対応（モバイルファースト）のデザイン

いつでもどこでもスケジュールを登録できるよう、スマホでの使用を想定していたため、モバイルファーストのデザインを実装しました。

<center>スマホサイズの画面(767px未満）</center>

<center><img src="https://i.gyazo.com/054352c70cb6bbdb810bb3fbd829b49f.png" width="320px" style="border: 1px solid #000;"> <img src="https://i.gyazo.com/825d159fa28476b34eb92362788cd4cf.png" width="320px" style="border: 1px solid #000;"></center>

<center>タブレット以上のサイズの画面(767px以上)</center>

<center><img src="https://i.gyazo.com/a303ff2845625c828882835856c88445.png" width="640px" style="border: 1px solid #000;"></center>
<center><img src="https://i.gyazo.com/dc71111ac550a2238351f8afeca3d7d0.png" width="640px" style="border: 1px solid #000;"></center>

## 3. 保守性

アプリの保守性を高めるため、重複するコードは極力集約して部分テンプレートにしています。

<img src="https://i.gyazo.com/5c050a389d65391929e01a276252ab87.png" >
<img src="https://i.gyazo.com/3c70a91d08a94216d555d1fa2710666e.png" >
<img src="https://i.gyazo.com/2060297c6a0d2c7e751912a4e1383338.png" >
<img src="https://i.gyazo.com/ced2dff2af6e313c0f86f6a95b62f114.png" >


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/0c2a3cdb838ebda5bcfa3183e1b0ca0b.png)](https://gyazo.com/0c2a3cdb838ebda5bcfa3183e1b0ca0b)

# 今後の課題

## テストの充実
機能を増やすことばかりしていて、途中からテストの実装をおざなりにしてしまったので、単体テストの充実に加えて、統合テストも可能なら実装したいです。

## 通知機能の実装
アプリ内には「Notification」というリンクがあるのですが、まだ実装できていません。
将来的には、参加しているグループの未読チャットやメイトリクエストがあったときに通知されるようにしたいです。

## フロントへのReact導入
フロントにモダンな技術を導入してアピールしたいと思い、Reactを導入するつもりです。