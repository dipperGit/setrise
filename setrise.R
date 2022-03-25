#setrise関数

source("https://raw.githubusercontent.com/dipperGit/pkgch/br1/pkgch.R", encoding="UTF-8")
pkgch()

##GoogleMapAPIを用いたジオコーディング
#http://www.okadajp.org/RWiki/?Rでジオコーディング
address<-"沖縄県那覇市久米２丁目４番１４号"
returnform<-"xml"#xmlorjson
key<-"ABQIAAAA7Qa-RE_JYtVliR9OTauOexScAlgT1OMB91Iojh4cvnPDirRWVBRkKoWJQNoMN19LbzuRx7z0aIWHTQ"#ここはGoogleAPIでもらったkeyを登録
text1<-"http://maps.google.com/maps/geo?q="
text2<-"&output="
text3<-"&key="
savefile<-"c:\\geocode.xml"
EncodeAddress<-paste(c("",charToRaw(iconv(address,"CP932","UTF-8"))),collapse="%")#なかまさんのURLエンコード
URLText<-paste(text1,EncodeAddress,text2,returnform,text3,key,sep="")
download.file(URLText,savefile)