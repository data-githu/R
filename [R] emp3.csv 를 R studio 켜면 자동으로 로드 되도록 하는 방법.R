■ emp3.csv 를 R studio 켜면 자동으로 로드 되도록 하는 방법
메모장을 관리자 권한으로 실행하고 

C:\Program Files\R\R-자신의버전번호\etc\Rprofile.site 파일을 엽니다.

그리고 맨 아래줄에 다음의 내용을 추가하고 저장한 다음 Rstudio 를 실행합니다.

library(utils)
setwd("d:\\data")
emp <- read.csv("emp3.csv")
emp