■ R 의 순위 출력
문법 : rank 함수

예제 : 이름, 월급, 월급에 대한 순위를 출력하시오!
data.table(이름=emp$ename, 월급=emp$sal, 순위=rank(-emp$sal, ties.method="min"))

설명 : rank 에 마이너스(-) 를 사용하면 월급이 높은것부터 출력됩니다.

ties.method 옵션
1. min : 오라클의 rank와 같다.
2. first : 오라클의 rank와 같은데 순위가 같은 데이터가 있으면 인덱스 순서가 먼저 나온 데이터를 높은 순위로 부여합니다.
3. max : 2등이 2명이면 둘다 3등으로 출력합니다.

x<-  data.table(이름=emp$ename, 월급=emp$sal, 순위=rank(-emp$sal, ties.method="min"))
library(doBy)
orderBy(~순위, x)

※ 오라클의 dense_rank 와 같은 함수는 무엇인가?
SQL> select ename, dense_rank() over (order by sal desc) 순위
from emp;

R> library(dplyr)
R> x <- data.table(이름=emp$ename, 월급 = emp$sal, 순위=dense_rank(-emp$sal))
R> library(doBy)
R> orderBy(~순위, x)

문제125. 월요일에 많이 발생하는 범죄, 건수, 순위를 출력하시오!
library(dplyr)
library(doBy)
crime_day <- read.csv("crime_day.csv")
c_mon <- crime_day[crime_day$DAY=='MON',]
x <- data.table(범죄 = c_mon$C_T, 건수 = c_mon$CNT, 순위=dense_rank(-c_mon$CNT))
orderBy(~순위, x)


문제126. 여성이 가장 많이 걸리는 암의 순위를 출력하시오!
cancer2 <- read.csv("cancer2.csv")
head(cancer2)
c <- cancer2[cancer2$성별=='여자' & cancer2$암종 != '모든암',]
c
View(c)
x <- data.table(암종=c$암종, 환자수=c$환자수, 순위=dense_rank(-c$환자수))
x2 <- orderBy(~순위, x)
x3 <- unique(x2)
View(x3)
