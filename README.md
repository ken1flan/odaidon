# Odaidon(WIP)
Odaidonはお絵かきのお題を出してくれるrubotyです。
Odaidon is a ruboty gives drawing theme in mastodon.

## To do list
- [x] 話しかけられたら、オウム返しする
  - [x] テスト
  - [x] オウム返し
- [x] mastodonに住み着く
- [ ] 覚えているお題をすべて返信する
- [ ] お題を与えられたら、覚える
- [ ] お題を頼まれたら、ランダムにひとつ返信する
  - [ ] お題はその日一日同じお題を返信する
- [ ] お題関連の機能をgemにする

## Development
### .envの準備
`dot.env`を`.env`という名前でコピーします。
`.env`の下記項目を環境に合わせて変更してください。

| 環境変数名 | 説明 |
| --- | --- |
| RUBOTY_NAME | mastodonのアカウント名 |
| MASTODON_URL | mastodonのURL |
| MASTODON_TOKEN | mastodonアカウントにread/writeで設定したアプリのアクセストークン |
| ODAIDON_HASHTAG | お題を出したときにつけるハッシュタグ |

### 起動
#### redis
```
$ bin/start_redis.sh
```

#### ruboty
```
$ bin/start_ruboty.sh
```

### お題のロード
```
> @odaidon load themes
Load 194 themes.
```

### お題をもらう
```
> @odaidon give theme
"trollface"
#odaidon
```