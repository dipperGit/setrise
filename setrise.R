
setrise <- function(loc, now = TRUE, mtime){
#setrise関数 20220325
#都道府県名を入力すれば、実行日前後日の出日の入り時刻を計算できる。

#使い方
#調査や釣りなどに活躍！（?）
#以下を実行した後、
#source("https://raw.githubusercontent.com/dipperGit/setrise/br1/setrise.R", encoding="UTF-8")
#setrise("北海道")
#と都道府県名を入力すればOK

#なお、手動の場合は
#setrise("北海道", now=FALSE, mtime = c("2020-03-25"))
#のように、now=FALSEにして、mtime=で年月日を入力
  
#都道府県ごとの緯度経度入力
pref <- c("北海道","青森県","岩手県","宮城県","秋田県","山形県", "福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県", "鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県", "沖縄県" )
lat <- c(43.06417,  40.82444,  39.70361,  38.26889,  39.71861,  38.24056,  37.75,  36.34139,  36.56583,  36.39111,  35.85694,  35.60472,  35.68944,  35.44778,  37.90222,  36.69528,  36.59444,  36.06528,  35.66389,  36.65139,  35.39111,  34.97694,  35.18028,  34.73028,  35.00444,  35.02139,  34.68639,  34.69139,  34.68528,  34.22611,  35.50361,  35.47222,  34.66167,  34.39639,  34.18583,  34.06583,  34.34028,  33.84167,  33.55972,  33.60639,  33.24944,  32.74472,  32.78972,  33.23806,  31.91111,  31.56028,  26.2125)
lon <- c(141.34694, 140.74, 141.1525, 140.87194, 140.1025, 140.36333, 140.46778, 140.44667, 139.88361, 139.06083, 139.64889, 140.12333, 139.69167, 139.6425, 139.02361, 137.21139, 136.62556, 136.22194, 138.56833, 138.18111, 136.72222, 138.38306, 136.90667, 136.50861, 135.86833, 135.75556, 135.52, 135.18306, 135.83278, 135.1675, 134.23833, 133.05056, 133.935, 132.45944, 131.47139, 134.55944, 134.04333, 132.76611, 133.53111, 130.41806, 130.29889, 129.87361, 130.74167, 131.6125, 131.42389, 130.55806, 127.68111)

#データフレーム整形
df <- data.frame(pref = pref, lat = lat, lon = lon)

#パッケージの読み込みはpkgch関数で管理
source("https://raw.githubusercontent.com/dipperGit/pkgch/br1/pkgch.R", encoding="UTF-8")

#pkgch関数の出力結果を非表示に。
#https://jundoll.hatenablog.com/entry/2014/06/28/220324
invisible( capture.output(pkgch("suncalc")))

#現在時刻を入力
if(now == TRUE){
now2 <- Sys.Date()
}else {
  now2 <- as.Date(mtime)
}
#手動の場合は、
#now <- as.POSIXct("2022-03-25")
#のように書く。

#loc <- "北海道"
tar <- df[df$pref == loc,]

#場所から日の出日の入り時間を計算
time <- getSunlightTimes(date=now2, lat = tar$lat[1], lon = tar$lon[1], tz="JAPAN" )

#時間だけを引き抜けるように加工 
time$dsunset <- as.character(time$sunset)
time$dsunset <- substring(time$dsunset, nchar(time$dsunset)-7, nchar(time$dsunset))

time$dsunrise <- as.character(time$sunrise)
time$dsunrise <- substring(time$dsunrise, nchar(time$dsunrise)-7, nchar(time$dsunrise))

#結果を表示

#macの場合
if(grepl("macOS", sessionInfo()$running) == TRUE){
cat(paste(now2, "の", as.factor(tar$pref), "の", "\n","日の出時間は", time$dsunrise, "\n", "日の入り時間は", time$dsunset, "です。", sep="" ) )
}else{
  #windowsの場合
  cat(paste(now2, "の", as.factor(tar$pref), "の", "¥n","日の出時間は", time$dsunrise, "¥n", "日の入り時間は", time$dsunset, "です。", sep="" ) )
}

}#おわりんこ
