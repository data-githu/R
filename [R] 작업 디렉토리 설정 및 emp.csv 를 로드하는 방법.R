■ 작업 디렉토리 설정 및 emp.csv 를 로드하는 방법

setwd("c:\\data")
getwd() 

emp3.csv 를 c 드라이브 밑에 data 폴더 밑에 둔다.

emp <-  read.csv("emp3.csv", header=T)
emp

emp 데이터의 월급으로 원형 그래프를 그리시오 !
  
pie(emp$sal, col=rainbow(14))