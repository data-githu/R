■ 시각화 - 막대그래프 그리기

"머신러닝 수업때와 캐글에 데이터 분석시 사용하기 편하도록 함수로 만들어서 그래프 그리는 것을 자동화 시키기"

문제127. emp테이블의 월급으로 기본적인 막대그래프를 그리시오
barplot(emp$sal)

문제128. 위의 그래프의 제목을 Salary Bar Chart 라고 이름을 붙이시오!
barplot(emp$sal, main="Salary Bar Chart")

문제129. 막대그래프 x 축에 사원이름을 붙이시오.
barplot(emp$sal, main="Salary Bar Chart", names.arg=emp$ename)

문제130. 막대그래프의 x축과 y축의 이름을 각각 이름, 월급이라고 하시오!
barplot(emp$sal,  main="Salary Bar Chart", names.arg=emp$ename, xlab="이름", ylab="월급")

문제131. 막대그래프의 색을 변경하여 출력하시오!
barplot(emp$sal,  main="Salary Bar Chart", names.arg=emp$ename, xlab="이름", ylab="월급", col="Green Yellow")

문제132. 창업건수.csv를 R로 로드하고 치킨집의 창업건수를 막대그래프로 시각화하시오!
  create_cnt <- read.csv("창업건수.csv", header=T)
drop_cnt <- read.csv("폐업건수.csv",header=T)
create_cnt
View(create_cnt)

barplot(create_cnt$치킨, main="년도별 치킨집 창업건수", names.arg=create_cnt$년도, col = "Green Yellow", ylim=c(0,1600))

문제133. 치킨집의 폐업건수로 막대그래프를 그리시오!
drop_cnt <- read.csv("폐업건수.csv",header=T)

barplot( drop_cnt$치킨, main="년도별 치킨집 폐업건수",
         names.arg=drop_cnt$년도,  col="Green Yellow", density=80,
         ylim=c(0,4000)  )

문제134. 치킨집의 창업건수와 폐업건수를 같이 막대그래프로 시각화하시오!
create_cnt <- read.csv("창업건수.csv", header=T)
drop_cnt <- read.csv("폐업건수.csv", header=T)
x <- rbind( create_cnt$치킨집, drop_cnt$치킨집)
x

barplot( x , main="년도별 치킨집 폐업건수",
         names.arg=drop_cnt$년도,  col= c("Green Yellow","Hot pink") , 
         density=80, ylim=c(0,4000) , beside=T )

문제135.  카페가 얼마나 창업을 하고 얼마나 폐업을 하는지 막대 그래프로 시각화 하시오 !
create_cnt <- read.csv("창업건수.csv", header=T)
drop_cnt <- read.csv("폐업건수.csv", header=T)
x <- rbind( create_cnt$커피음료, drop_cnt$커피음료)

barplot( x , main="년도별 카페 창업과 폐업건수",
         names.arg=drop_cnt$년도,  col= c("Green Yellow","Hot pink") , 
         density=80, ylim=c(0,4000) , beside=T )

문제136.  위의 막대그래프를 앞으로 편하게 그릴 수 있도록 함수로 만들어서 실행되게 하시오 !
R 함수 생성 문법:
yys_auto <-  function() {
    create_cnt <- read.csv("창업건수.csv", header=T)
    drop_cnt <- read.csv("폐업건수.csv", header=T)
    x <- rbind( create_cnt$커피음료, drop_cnt$커피음료)
    
    barplot( x , main="년도별 카페 창업과 폐업건수",
             names.arg=drop_cnt$년도,  col= c("Green Yellow","Hot pink") , 
             density=80, ylim=c(0,4000) , beside=T )
  }

yys_auto()

문제137.   창업건수.csv 를 로드해서 치킨집의 창업건수를 막대 그래프로 그리는 함수를 생성하시오
a_bar <-  function()  {  
create_cnt <- read.csv("창업건수.csv", header=T)
  
barplot(create_cnt$치킨집 , main="치킨집 카페 창업건수",
          names.arg=create_cnt$년도,  col= "Green Yellow" , 
          density=80, ylim=c(0,1500) , beside=T )
}

a_bar() 

