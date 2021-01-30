■ R 의 집합연산자

오라클      vs      R
union all         rbind
union             rbind + unique
intersect         intersect
minus            minus

문제107. 아래의 SQL 의 결과를 R로 구현하시오!
SQL> select ename, sal, deptno
from emp
where deptno in (10, 20)
union all
select ename, sal, deptno
from emp
where deptno = 20;

R> rbind(emp[ emp$deptno %in% c(10, 20) , c("ename", "sal", "deptno")] ,emp[ emp$deptno == 20 , c("ename","sal","deptno")])

설명: rbind 는 두개의 결과를 위아래로 묶어서 출력하는 함수 

문제108. 아래의 SQL을 R로 구현하시오!
SQL> select job, sum(sal)
from emp
group by job
union all
select null as job, sum(sal)
from emp;

R> rbind(aggregate(sal~job, emp, sum),c(" ", sum(emp$sal)))

문제109. 아래의 SQL의 결과를 R로 구현하시오!
SQL> select ename, sal, deptno
from emp
where deptno in (10,20)
union
select ename, sal, depnto
from emp
where deptno == 10;

R> x <- unique(rbind(emp[ emp$deptno %in% c(10, 20) , c("ename", "sal", "deptno")] , emp[ emp$deptno == 10 , c("ename","sal","deptno")]))
library(doBy)
orderBy(~ename, x)


설명 : SQL의 union의 경우는 두 SQL 의 결과를 위아래로 연결하면서 첫번째 컬럼인 ename을 기준으로 데이터를 정렬하고 중본된 데이터를 제거합니다.

union all과 union의 차이점? 
1. 중복된 데이터 제거
2. 데이터 정렬

문제110. 아래의 SQL을 R로 구현하시오!
SQL> select ename, sal, deptno
from emp
where deptno in (10,20)
minus
select ename, sal, deptno
from emp
where deptno = 10 ;

R> 
install.packages("dplyr")
library(dplyr)
x <-  setdiff(emp[ emp$deptno %in% c(10,20) , c("ename", "sal", "deptno") ], 
            emp[ emp$deptno==10 , c("ename", "sal", "deptno") ]  )
library(doBy)
orderBy(~ename, x)

설명:  R 에 내장되어있는 setdiff 함수를 사용하면 안되고 dplyr 패키지의 setdiff 를 이용해야 합니다.

문제111. 아래의 SQL의 결과를 R로 구현하시오!
SQL> select ename, sal, deptno
from emp
where deptno in (10,20)
intersect
select ename, sal, deptno
from emp
where deptno = 10;

R> x<- intersect (emp[ emp$deptno %in% c(10, 20) , c("ename", "sal", "deptno")] , emp[ emp$deptno == 10 , c("ename","sal","deptno")])
library(doBy)
orderBy(~ename, x)
