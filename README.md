# Odaidon(WIP)
Odaidonはお絵かきのお題を出してくれるrubotyです。
Odaidon is a ruboty gives drawing theme in mastodon.

## To do list
- [ ] 話しかけられたら、オウム返しする
  - [ ] テスト
  - [x] オウム返し
- [ ] mastodonに住み着く
- [ ] 覚えているお題をすべて返信する
- [ ] お題を与えられたら、覚える
- [ ] お題を頼まれたら、ランダムにひとつ返信する
  - [ ] お題はその日一日同じお題を返信する
- [ ] お題関連の機能をgemにする

## Development
### 起動
```
$ bundle exec ruboty -l parrot.rb
```

### 終了
```
> exit
```

### オウム返し
```
> ruboty parrot hello!
You said "hello!"
```