■ R 의 서브쿼리 구현

*오라클의 서브쿼리의 종류 3가지
1. 단일행 서브쿼리
2. 다중행 서브쿼리
3. 다중 컬럼 서브쿼리

문제112. JONES의 월급보다 더 많은 월급을 받는 사원들의 이름과 월급을 출력하시오.
SQL> select ename, sal
from emp
where sal>(select sal from emp where ename = 'JONES')

R> jones_sal <- emp[emp$ename == 'JONES' ,c("sal")]
jones_sal
emp[emp$sal > jones_sal, c("ename","sal")]


문제113. 아래의 SQL을 R로 구현하시오!
SQL> select ename, sal
from emp
where sal = (select max(sal) from emp);

R> max_sal <- max(emp[ ,"sal"])
emp[emp$sal == max_sal, c("ename","sal")]

문제114. 전국에서 등록금이 가장 비싼 학교이름과 등록금을 출력하시오!
univ <- read.csv("전국_대학별등록금통계_현황.csv")
univ_max <- max(univ$등록금)
univ[univ$등록금 == univ_max, c("학교명","등록금")]

문제115. KING에게 보고하는 사원들의 이름과 월급을 출력하시오!
king_empno <- emp[emp$ename=='KING', "empno"]
emp[emp$mgr==king_empno, c("ename","sal")]
na.omit(emp[emp$mgr==king_empno, c("ename","sal")])

문제116. 관리자인 사원들의 이름을 출력하세요.
SQL>select ename
from emp
where empno in (select mgr from emp);

R> 
install.packages("data.table")
library(data.table)
data.table(이름=emp[emp$empno %in% emp$mgr, "ename"])

설명 : 관리자번호가 사원번호인 사원들을 출력


문제117. 관리자가 아닌 사원들의 이름을 출력하시오!
SQL> select ename
from emp
where empno not in (select mgr from emp where mgr is not null);

R> 
install.packages("data.table")
library(data.table)
data.table(이름=emp[! emp$empno %in% emp$mgr, "ename"])

문제118. 아파트에서 가장 많이 발생하는 범죄유형이 무엇인지 출력하시오!
crime_loc <- read.csv("crime_loc.csv")
head(crime_loc)
x<- crime_loc[crime_loc$장소=='아파트',c("범죄","건수")]             
x[x$건수==max(x$건수),]

문제119. 지하철에서 가장 많이 발생하는 범죄 유형이 무엇인지 출력하시오!
crime_loc <- read.csv("crime_loc.csv")
head(crime_loc)
x<- crime_loc[crime_loc$장소=='지하철',c("범죄","건수")]             
x[x$건수==max(x$건수),]

문제120. 지하철에서 발생하는 범죄유형과 건수를 출력하는데 건수가 높은 것부터 출력하시오!
crime_loc <- read.csv("crime_loc.csv")
head(crime_loc)
x<- crime_loc[crime_loc$장소=='지하철',c("범죄","건수")]             
library(doBy)
orderBy(~-건수,x)

문제121. 위의 결과에서 첫번째 행만 출력하시오!
crime_loc <- read.csv("crime_loc.csv")
head(crime_loc)
x<- crime_loc[crime_loc$장소=='지하철',c("범죄","건수")]             
library(doBy)
x2 <- orderBy(~-건수,x)
x2[1,]

문제122. 문제 120번 결과에서 첫번쨰 행부터 세번째 행까지 출력하시오!
crime_loc <- read.csv("crime_loc.csv")
head(crime_loc)
x<- crime_loc[crime_loc$장소=='지하철',c("범죄","건수")]             
library(doBy)
x2 <- orderBy(~-건수,x)
x2[c(1:3),]

문제123. 강력범죄가 가장 많이 발생하는 요일은 언제인가?
crime_day <- read.csv("crime_day.csv")
x <- crime_day[trimws(crime_day$C_C)=="강력범죄",]
library(doBy)
x2 <- orderBy(~-CNT,x)
x2[1,"DAY"]

설명 : trimws 함수 --> 양쪽 공백을 제거하는 함수

문제124. 살인기수가 많이 발생하는 요일을 1위부터 3위까지 출력하시오!
crime_day <- read.csv("crime_day.csv")
x <- crime_day[trimws(crime_day$C_T)=="살인기수",]
library(doBy)
x2 <- orderBy(~-CNT,x) # CNT(건수) 크기가 큰 순으로 정렬하여 x2에 담는다.
x2[c(1:3),"DAY"] # x2에 담은 값에서 1~3 행만, 그중에서 "DAY"에 해당하는 값만 출력한다.

