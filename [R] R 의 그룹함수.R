■ R의 그룹함수

oracle   vs    R
max           max
min            min
sum           sum
avg            mean
count         length(세로), table(가로)

문제52. 최대월급을 출력하시오!
# 1. 워킹 디렉토리를 지정한다.
setwd("c:\\data")
# 2. 지정된 워킹 디렉토리를 확인합니다.
getwd()
# 3. emp.csv 를 로드하여 emp 데이터 프레임을 만든다.
emp <- read.csv("emp3.csv")
# 4. 최대월급을 구한다.
max(emp$sal)

문제53. 직업이 SALESMAN인 사원들의 최대월급을 구하세요.
setwd("c:\\data")
getwd()

emp <- read.csv("emp3.csv")
result <- emp[emp$job=='SALESMAN', "sal"]
max(result)

#한줄로 처리
max(emp[emp$job=="SALESMAN","sal"])

문제54. 20번 부서번호인 사원들 중에서의 최소월급을 출력하시오.
setwd("c:\\data")
getwd()

emp <- read.csv("emp3.csv")
min(emp[emp$deptno==20, "sal"])

문제55. 직업, 직업별 최대월급을 출력하시오!
SQL> select  job,  max(sal)
from  emp
group  by  job;


R> aggregate(sal~job, emp, max)

설명 : aggregate(계산될 컬럼~기준된 컬럼, 테이블명, 그룹함수명)


문제56. 부서번호, 부서번호별 토탈월급을 출력하시오!
aggregate(sal~deptno, emp, sum)

    deptno   sal
1     10  8750
2     20 10875
3     30  9400

문제57. 위에서 출력되고 있는 컬럼명을 한글로 부서번호, 토탈월급으로 변경하시오!
result <-aggregate(sal~deptno, emp, sum)
names(result) <- c('부서번호','토탈월급')
result

문제58. 위의 결과를 다시 출력하는데 토탈월급이 높은것 부터 출력하시오!
install.packages("doBy")
library(doBy)
result <-aggregate(sal~deptno, emp, sum)
names(result) <- c("부서번호","토탈월급")
orderBy(~-토탈월급, result)

     부서번호 토탈월급
2       20    10875
3       30     9400
1       10     8750


문제59. 직업, 직업별 인원수를 출력하시오
result <- aggregate(empno~job, emp, length)
names(result) <- c("직업", "인원수")
result

문제60. 위의 결과를 다시 출력하는데 인원수가 높은 것부터 출력하시오!
result <- aggregate(empno~job, emp, length)
names(result) <- c("직업", "인원수")
result
library(doBy)
orderBy(~-인원수, result)

문제61. 직업, 직업별 인원수를 가로로 출력하시오!
table(emp$job)

문제62. 위의 결과를 원형 그래프로 시각화하시오!
pie(table(emp$job),col=rainbow(14))

문제63. 부서번호, 직업, 부서번호별 직업별 토탈월급을 출력하시오!
aggregate(sal~deptno+job, emp, sum)

문제64. 입사한 년도(4자리), 입사한 년도별 평균월급을 출력하시오!
x <- aggregate(sal~format(as.Date(emp$hiredate),'%Y'), emp, mean)
names(x) <- c("입사한 년도", "평균월급")
x

문제65. 위의 결과에서 소수점 이하는 안나오게 하시오!
x$평균월급 <- trunc(x$평균월급)
x

설명 : x데이터 프레임의 평균월급의 값의 소수점 이하 버리고 x 데이터 프레임의 평균월급에 넣는다.
