# README

- ## アプリ名

  ## 「Chottosokomade!!」

  ジブリの名作「となりのトトロ」のメイちゃんの一言から発想を得ました。

- ## なぜ作ったのか

  近年「ポケモン GO」や「ドラクエウォーク」といったゲームを通じて街中の散策を楽しむ方が増えたように感じます。
  そういった散歩を楽しむ方同士でおすすめの散歩スポットを共有できるアプリを作りたいと考えました。

  人との接触を抑えながら、体を動かして気分転換できる散歩は今後ますます需要が拡大すると予想されます。
  また、私自身もどこかに足を伸ばしたいけれど、目的地が思い浮かばないということがあるためこういったアプリがあったらいいなと思い、このアプリの作成に至りました。

- ## 使い方

  - 1,ユーザー登録
    お名前、メールアドレス、パスワードを入力してユーザー登録を完了させてください。
    ![chottosokomade usage(1)](https://user-images.githubusercontent.com/78243094/212095853-ff3b8c7e-c235-44ce-b0c2-0b6f10e2ae2a.png)
  - 2,現在位置情報取得
    [デモ](#デモ)を参考に現在位置情報取得&保存してください。
    ![chottosokomade usage(2)](https://user-images.githubusercontent.com/78243094/212095879-931fcc24-e326-4b9e-a75c-6573f56020ab.png)
  - 3,投稿・探索・閲覧を楽しんでください！散歩で健康ライフを！
    ![chottosokomade usage(3)](https://user-images.githubusercontent.com/78243094/212096217-1052cbf5-2ee3-402f-b5d2-21a63df3ff3f.png)

- ## デモ

  ### 現在位置情報取得

  - 現在位置を保存することでより快適にアプリを利用できます！
    ![デモユーザー1-Chottosokomade__](https://user-images.githubusercontent.com/78243094/212093005-d93a9669-43cf-4485-ad1c-9a8b7f383555.gif)

- ## ER 図

  ![er graph](https://user-images.githubusercontent.com/78243094/211824664-b4db43a3-a720-495d-9075-2a6b40c84632.png)

- ## 機能一覧

  このアプリは大きく分けて「投稿」、「探索」、「投稿スポット閲覧」の ３つの機能をメインとします。

  ### 投稿(https://chottosokomade.uk/spots/new)

  - おすすめスポット名(Name)
    公園/レストラン/カフェ/景色がいい場所/ショッピングセンター などなど

  - 投稿者コメント(Comment)
    おすすめの楽しみ方や訪問に最適な時期・時間、
    その場所にまつわるエピソード・豆知識なんかもあったら、訪れた際により楽しめるかもしれません！

  - 住所(Address)
    地図で表示する際に必要になります。住所や施設名を記入してください。

  - キーワードタグ設定(Tag list)
    シチュエーション、見頃や最寄駅 などタグは自由に設定できます。

  - 写真(Images)
    イメージ画像最大 3 枚まで添付することができます。
    せっかく撮った思い出の場所の写真、みんなに共有しませんか？

  ### 探索(https://chottosokomade.uk/searches/search)

  - フリーワード探索
    スポット、ユーザーの一括検索が可能です。

  - 人気のタグで探索
    紐づけられているキーワードタグの上位 20 件を表示しています。
    気になるワードに導かれて冒険してみては…？？

  - 周辺探索（約 3km 圏内のスポット）
    往復にちょうどいい距離「半径 3km 圏内」のスポットを最大 4 件表示しています。
    お手軽に散歩を楽しみたい人も、近場を探索したい人にもピッタリ！

  ### 投稿スポット閲覧(https://chottosokomade.uk/spots)

  - スポット名

  - 投稿者コメント

  - 住所

  - キーワードタグ

  - お気に入り
    ハートマークのアイコンです。
    気に入った/気になったスポットにいいねすることで、マイページのお気に入りタブからいつでも見られるようになります。

  - 所在地マップ(Google Map)
    スポットの所在地をマップ表示します。
    現在地を登録している場合は、現在地からの徒歩での所要時間・経路を表示します。

  - レビューコメント
    実際に行ったことがある人、行ってみた人、行ってみたい人のさまざまな感想を投稿できます。
    感想の共有の場としても利用できます！

- ## こだわりポイント

  視覚的なわかりやすさを重視してアプリを作成しました。
  特にこだわった点は、スポット詳細画面のマップです。

  - Google Map との API 連携でルートを想像可能に
    散歩ならではの楽しみとしてコースの景色が挙げられます。埋め込まれている Google Map の機能を用いて
    人型のアイコンをドラッグ＆ドロップして地図上に置くことで、ルートの雰囲気を想像することができるようになっています。
    スポット所在地はもちろん、そこに至るまでの徒歩での所要時間、歩行経路を一目でわかるようになっています！

    ![chottosokomade Map1](https://user-images.githubusercontent.com/78243094/212068279-4b58ba4c-742c-41b3-bd96-ae8d1d1d4dce.png)
    ![chottosokomade Map2](https://user-images.githubusercontent.com/78243094/212068309-0f7c18d9-38ec-4c0f-b2a2-b8bb45d83021.png)

  - 周辺のスポットをおすすめ！！
    現在位置の 3km 圏内にあるスポットを「探索画面」にて最大 4 件お勧めしています。
    往復の散歩にちょうどいい距離にあるスポットを現在位置を登録するだけで見つけることができます。
    家の近場に思わぬ穴場を見つけられるかもかもしれません。

    ![chottosokomade nearSpot](https://user-images.githubusercontent.com/78243094/212070884-9be61827-df08-4835-80c5-cbcd5cb35d32.png)

  - 気になるユーザーの投稿を見逃さない！
    「follow」ボタンを押すことで[フォロー中のユーザー投稿](https://chottosokomade.uk/spots/following_users_spots)にユーザーの投稿が追加されます。あなたの投稿、見逃さない…！

    ![chottosokomade follow](https://user-images.githubusercontent.com/78243094/212101453-33d0bc06-22e9-4d24-ab6e-dbdf9e731019.png)

    #### フォロー中のユーザー投稿(https://chottosokomade.uk/spots/following_users_spots)

    ![chottosokomade following](https://user-images.githubusercontent.com/78243094/212102106-8cf0d8b7-5220-45cc-99f7-033f187c3bf2.png)

# chottosokomade
