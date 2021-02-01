■ 시각화 - 히스토그램 그래프 그리기 
히스토그램은 하나의 속성에 대한 데이터의 분포를 시각적으로 표현하는 그래프

예제: 머신러닝 R 책의 2장의 히스토그램 그래프 설명의 예제 

중고차 가격 데이터 : usedcars.csv  

usedcars <- read.csv("usedcars.csv")
View(usedcars)

1. 전체 건수를 확인합니다.
nrow(usedcars) 

2. 컬럼이 몇개 인지 확인합니다.
ncol(usedcars) 

3. 각 컬럼들의 데이터에 대한 통계정보를 확인하시오.
summary(usedcars)

4. 중고차 가격에 대해서 히스토그램 그래프를 그리시오 !
hist(usedcars$price)

5. 히스토그램 x 축의 간격이 좀더 이해하기 쉽게 나올 수 있도록 그래프를 조정하시오 
hist(usedcars$price, at=seq(0, 24000, by=2000),breaks= seq(0, 24000, by=2000) )


문제154.   중고차의 마일리지로 히스토그램 그래프를 그리시오 !
setwd("c:\\data")
usedcars <- read.csv("usedcars.csv",header = T, stringsAsFactors = T)

hist( usedcars$mileage, 
      , breaks=seq(0, max(usedcars$mileage)*1.1 , by=10000) , 
      main="중고차 주행거리", col='GreenYellow', density=80 )

문제155. 위의 그래프 코드를 함수로 생성해서 윈도우 탐색기가 열리게 하면서 데이터를 불러와서 히스토그램 그래프가 그려지게 하시오 ! ( 함수이름:  hist2  )
hist2 <- function() {      # R 에서 함수 만드는 코드 
  
  fname <- file.choose()  #  윈도우 탐색기 여는 코드
  
  table <- read.csv(fname, header=T, stringsAsFactor=F )
  
  print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드
  
  xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
  
  xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
  
  xcol2 <- table[,xcol] #  x 축 컬럼의 데이터를 xcol2 에 넣는다. 
  max_m = max(xcol2)*1.1 
  
  hist( xcol2 , main= paste(xcol,'의 히스토그램 그래프') , col='orange', density=80 )
  
}
