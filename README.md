setrise関数

都道府県名を入力すれば、実行日日の出・日の入り時刻を計算できる。調査や釣りなどに活躍！（?）

・使い方

以下を実行した後、
 
source("https://raw.githubusercontent.com/dipperGit/setrise/br1/setrise.R", encoding="UTF-8")


setrise("北海道")
 
と都道府県名を入力すればOK


なお、手動の場合は


setrise("北海道", now=FALSE, mtime = c("2020-02-15"))


のように、now=FALSEにして、mtime=で年月日を入力
