■  R 의 조인 문법

Oracle             vs                  R 

equi join
non equi join                       merge 
outer  join
self  join


문제85. dept.csv 를 R에 로드하고 이름과 부서위치를 출력하시오!
dept <- read.csv("dept.csv")
x <- merge(emp, dept, by = 'deptno')
x [, c("ename","loc")]


문제86. 부서위치가 DALLAS 인 사원들의 이름과 월급과 부서위치를 출력하시오!
dept <- read.csv("dept.csv")
x <- merge(emp, dept, by = 'deptno')
x [x$loc=="DALLAS", c("ename","loc")]


문제87. 커미션이 NA인 사원들의 이름과 부서위치와 커미션을 출력하시오!
x <- merge(emp,dept,by="deptno")
x[is.na(x$comm),c("ename","loc","comm")]


문제88. 아래의 SQL의 결과를 R로 구현하시오!
SQL> select e.ename, d.loc
from emp e, dept d
where e.deptno(+) = d.deptno;

R> x <- merge(emp,dept, by="deptno", all.y=T)
x[          , c("ename", "loc") ] 

설명:   all.y=T 는 dept 테이블 쪽에 데이터가 모두 나오게 해라


문제89. 아래의 SQL의 결과를 R로 구현하시오!
SQL> select e.ename, d.loc
from emp e, dept d
where e.deptno = d.deptno(+);

R> x <- merge(emp,dept,by="deptno",all.x=T)


문제90. 아래의 SQL의 결과를 R로 구현하시오!
SQL> select e.ename, d.loc
from emp e full outer join dept d
on (e.deptno=d.deptno);

R> x <- merge(emp,dept,by="deptno",all=T)
x[         , c("ename", "loc") ]

문제91. 이름을 출력하고 그 옆에 자기의 직속상사의 이름을 출력하시오!
SQL> select 사원.ename, 관리자.ename
from emp 사원, emp 관리자
where 사원.mgr = 관리자.empno;

R> x <- merge(emp, emp, by.x="mgr", by.y="empno")
x [ , c("ename.x","ename.y")]

문제92. 위의 결과를 다시 출력하는데 자기의 월급이 본인의 직속상사의 월급보다 더 큰 사원들만 출력하시오!
R> x[x$sal.x > x$sal.y , c("ename.x", "ename.y")]

문제93. 위의 결과 데이터인 사원이름과 직속상사의 이름을 출력하는데 데이터를 가지고 사원테이블의 조직도를 그리시오.
install.packages("igraph")
library(igraph)
x<- merge(emp, emp, by.x="mgr", by.y = "empno")
a<-x[ ,c("ename.x","ename.y")]
a
b <-graph.data.frame(a,directed=T)
plot(b)

문제94. 위의 그래프를 구글의 googleVis를 이용해서 시각화 하시오!
install.packages("googleVis")
library(googleVis)

a <- merge(emp,emp, by.x="empno",by.y="mgr", all.y=T)
org <- gvisOrgChart(a, idvar="ename.y",parentvar="ename.x", options=list(width=600, height=250, size='middle',allowCollapse=T))

plot(org)


문제95. 부서위치, 부서위치별 토탈월급을 출력하시오!
세로 : 
x <- merge(emp, dept, by="deptno", all=T)
aggregate(x$sal~x$loc, x, sum, na.action=na.pass)

가로 : 
x <- merge(emp, dept, by="deptno", all=T)
tapply(x$sal, x$loc, sum)

문제96. 위의 결과를 막대그래프로 시각화 하시오!
x <- merge(emp, dept, by="deptno", all=T)
x2 <- tapply(x$sal, x$loc, sum)
x2
barplot(x2, col=rainbow(4),ylim=c(0,12000))

문제97. 아래와 같이 부서위치별 년도별 토탈월급을 출력하시오!
       1980    1981     1982    1983
BOSTON
CHICAGO
DALLAS
NEW YORK 


install.packages("lubridate")
library(lubridate)
year(emp$hiredate)

x <- merge(emp, dept, by="deptno", all=T)
tapply(x$sal, list(x$loc, year(x$hiredate)),sum)

문제98. 위의 결과를 다시 출력하는데 NA 대신에 0으로 출력되게하시오!
x <- merge(emp, dept, by="deptno", all=T)
x2 <- tapply(x$sal, list(year(x$hiredate),x$loc),sum)
x2[is.na(x2)] <- 0
x2

문제99. 위의 결과를 막대그래프로 시각화 하시오!
x <- merge(emp, dept, by="deptno", all=T)
x2 <- tapply(x$sal, list(year(x$hiredate),x$loc),sum)
x2[is.na(x2)] <- 0
x2
barplot(x2, col=rainbow(4),beside=T, legend=rownames(x2),ylim=c(0,10000))

문제100. 지하철 1-4호선 승하차 승객수.csv파일을 R로 로드해서 line이라는 이름으로 데이터프레임을 생성하시오!
line<- read.csv("1-4호선승하차승객수.csv", header=T)
head(line)

문제101. 위의 line에서 line_no 를 중복제거해서 출력하시오!
line<- read.csv("1-4호선승하차승객수.csv", header=T)
unique(line$line_no)

문제102. 위의 지하철 승하차수 정보를 가지고 구글 모션차트를 그리시오!
line <- read.csv("1-4호선승하차승객수.csv", header = T)
t1 <- gvisMotionChart (line, idvar="line_no", timevar="time")
plot(t1)

문제103. 부서번호, 부서번호별 토탈월급을 출력하는데 아래의 SQL 처럼 전체 토탈월급이 출력되게 하시오!
SQL> select deptno, sum(sal)
from emp
group by rollup(deptno)

R> rbind(aggregate(sal~deptno, emp, sum), c(" ",sum(emp$sal)))

설명 : rbind 는 두개의 결과를 위아래로 출력하고 싶을때 사용하는 함수
cbind는 두개의 결과를 양옆으로 출력하고 싶을때 사용하는 함수

문제104. cbind 를 사용해서 아래의 두개의 결과를 하나로 출력하시오!
a=aggregate(sal~deptno, emp, sum)
b=aggregate(sal~deptno, emp, mean)

cbind(a,b$sal)

문제105. 위의 결과의 컬럼명을 아래와 같이 출력되게하시오!
     부서번호 토탈월급   평균월급
1     10      8750       2916.667
2     20     10875      2175.000
3     30      9400      1566.667

a=aggregate(sal~deptno, emp, sum)
b=aggregate(sal~deptno, emp, mean)
x<-cbind(a,b$sal)
names(x) <- c("부서번호","토탈월급","평균월급")
x

문제106. 아래의 SQL의 결과를 R로 구현하시오!
SQL> select  job, sum(sal)  as 토탈월급, 
max(sal)  as  최대월급,
min(sal)  as   최소월급,
avg(sal)  as   평균월급,
count(*)  as   인원수
from  emp
group   by  job;


a=aggregate(sal~job, emp, sum)
b=aggregate(sal~job, emp, max)
c=aggregate(sal~job, emp, min)
d=aggregate(sal~job, emp, mean)
e=aggregate(sal~job, emp, length)

x<-cbind(a,b$sal,c$sal,d$sal,e$sal)
names(x) <- c("직업","토탈월급","최대월급","최소월급","평균월급","인원수")
x