■ 시각화 - 라인 그래프 그리기
시간 순서에 따른 데이터의 변화를 볼 때 유용한 그래프

문제141. 아래의 데이터로 plot(점) 그래프를 그리시오.
cars <- (1,3,6,4,9)
plot(cars)

문제142. 위의 그래프에 파란색 선을 그리시오.
cars <- c(1,3,6,4,9)
plot(cars, type='o', col='blue')

설명 : type ='o' -> 선을 그어라

문제143. 차와 트럭의 판매된 대수를 라인 그래프로 시각화하시오!
cars <- c(1,3,6,4,9)
trucks <- c(2,5,4,5,12)

plot(cars, type='o', col='blue', ylim=c(0,12))

그래프의 창을 닫지 말고 바로 이어서 아래의 코드를 실행하시오.

lines(trucks, type='o', pch=22, lty=2, col='red')

설명 : pch=21 -> 동그라미, pch=22 -> 네모, lty=1 -> 직선, lty=2 -> 점선

문제144. 가로축을 월, 화, 수, 목, 금으로 변경하시오.
cars <- c(1,3,6,4,9)
trucks <-c(2,5,4,5,12)
plot(cars, type='o', col='blue', ylim=c(0,12),axes =FALSE, ann=FALSE)
lines(trucks, type='o', pch=22, lty=2, col='red')

설명 : axes = FALSE -> x축과 y축을 지워라/ ann=FALSE -> 축이름을 지워라

*새로운 축을 생성하는 방법
axis(1, at=1:5, lab=c("mon","tue","wed","thu","fri")) #x축생성
axis(2) #y축생성

*레전드 붙이기
legend(2, 10, c('car','truck'),col=c('blue','red'),cex=0.8, pch=21:22, lty=1:2)

설명 : cex는 글씨크기, 레전드 안에 pch 21(동그라미), pch 22(네모), lty 1(직선), lty 2(점선)을 표시한다.

문제145. 치킨집의 창업건수를 이용해서 라인 그래프를 그리시오. x축을 연도로 두고 y축을 창업건수로 두고 만드시오!
create_cnt <- read.csv("창업건수.csv", header=T)
plot(create_cnt$치킨집, type='o', col='blue', axes=FALSE, ann=FALSE)
axis(1,at=1:10, lab=create_cnt$년도)
axis(2)
legend(8, max(create_cnt$치킨집),'창업',col='blue', cex=0.8, pch=21, lty=1)

문제146. 치킨집의 창업건수와 폐업건수를 같이 출력되게 하시오 (라인 그래프로 그리시오 !)
create_cnt <- read.csv("창업건수.csv", header=T)
drop_cnt <- read.csv("폐업건수.csv", header=T)

plot( drop_cnt$치킨집, type='o', col='red', axes=FALSE, ann=FALSE, pch=22, lty=2 )
lines( create_cnt$치킨집, type='o', col='blue', pch=21, lty=1 )

axis( 1,  at=1:10,  lab= create_cnt$년도 )
axis(2)  # y 축 생성 

legend( 8, max(drop_cnt$치킨집) , c('폐업','창업') , col= c('red','blue'), cex=0.8,  pch=22:21, lty=2:1  )

문제147. 막대그래프, 원형그래프, 라인그래프 이렇게 3가지를 그렸는데 이 세가지 그래프를 쉽게 실행할 수 있도록 함수로 만드시오.
auto_bar() : 창업/폐업 막대 그래프 실행
auto_pie() : 사원 테이블의 월급 비율 원형 그래프 실행
auto_line() : 창업/폐업 라인 그래프 실행

# auto_bar() : 카페의 창업/폐업 막대 그래프 실행
auto_bar <-  function() {
  create_cnt <- read.csv("창업건수.csv", header=T)
  drop_cnt <- read.csv("폐업건수.csv", header=T)
  x <- rbind( create_cnt$커피음료, drop_cnt$커피음료)
  
  barplot( x , main="년도별 카페 창업과 폐업건수",
           names.arg=drop_cnt$년도,  col= c("Green Yellow","Hot pink") , 
           density=80, ylim=c(0,4000) , beside=T )
}

auto_bar()

# auto_pie() : 사원 테이블의 월급 비율 원형 그래프 실행
auto_pie <-  function() {
  sal_labels <- round(emp$sal/sum(emp$sal)*100, 1)
  sal_labels
  sal_labels2 <- paste(emp$ename, sal_labels, '%')
  sal_labels2
  
  pie(emp$sal, main="Salary Pie Chart", labels=sal_labels2, col=rainbow(15))
}
auto_pie()


# auto_line() : 치킨집의 창업/폐업 라인 그래프 실행
auto_line <-  function() {
  create_cnt <- read.csv("창업건수.csv", header=T)
  drop_cnt <- read.csv("폐업건수.csv", header=T)
  
  plot( drop_cnt$치킨집, type='o', col='red', axes=FALSE, ann=FALSE, pch=22, lty=2 )
  lines( create_cnt$치킨집, type='o', col='blue', pch=21, lty=1 )
  
  axis( 1,  at=1:10,  lab= create_cnt$년도 )
  axis(2)  # y 축 생성 
  
  legend( 8, max(drop_cnt$치킨집) , c('폐업','창업') , col= c('red','blue'), cex=0.8,  pch=22:21, lty=2:1  )
}
auto_line()

