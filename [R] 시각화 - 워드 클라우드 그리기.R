■ 시각화 - 워드 클라우드 그리기

감정분석을 위한 시각화로 워드 클라우드를 사용합니다.

※ R 로 워드클라우드를 그리려면 R java 를 설치해야합니다.

1. 아래의 사이트에서 java64비트를 다운받습니다.
http://www.java.com/en/download/manual.jsp

2. 자바 설치시 대상 폴더 변경으로 설치

3. 아래와 같이 환경 설정을 합니다.
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_281")

4. R java를 설치합니다.
install.packages("rJava")
library(rJava)


문제164.  jobs.txt 를 워드 클라우드로 시각화 하시오 !
.libPaths()
install.packages("KoNLP")
install.packages(c('stringr','hash','tau','Sejong','RSQLite','devtools'),type="binary")
install.packages("remotes")

remotes::install_github('haven-jeon/KoNLP',upgrade="never",INSTALL_opts=c("--no-multiarch"),force=TRUE)

library(rJava)
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("plyr")

library(KoNLP)
library(wordcloud)
library(plyr)


useSejongDic() # 세종 사전에 있는 한글을 R 로 로드하는 명령어

setwd("c:\\data") # 워킹디렉토리를 소환
winter<-readLines('jobs.txt')

nouns<-extractNoun(winter) #명사 단어만 추출
nouns<-unlist(nouns)
nouns<-nouns[nchar(nouns)>=2] # 단어중에 2철자 이상인 것만
cnouns<-count(nouns) # 단어별 건수를 출력한다.

# 색깔 추가

pal<-brewer.pal(6,"Dark2")
pal<-pal[-(1)]

# 글씨 폰트 설정
windowsFonts(malgun=windowsFont("맑은 고딕"))

wordcloud(words=cnouns$x, # 단어
           freq=cnouns$freq, # 단어 빈도수
           colors=pal, # 색깔
           min.freq=3, # 빈도수가 3개 이상인것만 시각화 
           random.order=F, # F로 하게 되면 큰글씨부터 출력이 되면서
           family="malgun") # 중앙에서 퍼지게 한다.
