# GitPeco
GitコマンドをPecoでそれっぽく動かす。前提条件にPeco必須。

##動作確認環境
MacOSX 10.11.3   
zsh

##利点
このGitPecoを使うことにより、Gitのコミットメッセージがある程度固定することが出来ます。
極力人が形式に沿うのではなく、機械が沿わせるのがいい的なことを[@ir77](https://github.com/ir77)さんから聞いた気がする（若干意味を履き違えてるかも）ので、作ってみました。

## 導入方法
.zshrcに

```
function gip() {
    ~/GitPeco.sh
}
alias 'gip'
```

(~/GitPeco.shは設置した場所に書き換えてください)
このエイリアスではgipというコマンドですが、使いやすいように適当に書き換えて使ってください。

## 使い方
がいらない用に簡単に操作出来るように作ってます。   
唯一説明が必要な場所といえば、コミットメッセージの部分。
最初に質問されるのがタイトル。
その次から質問されるのは、本文です。
何も入力しないで改行すれば、入力終了です。

この質問に沿って入力することで
```
[作業内容]タイトル

メッセージ1
メッセージ2
...
```
といった形式になります。
