■ R 의 정렬 작업 

오라클 -------------------  R  

order  by                  1. data frame 에서 order 옵션
                           2. doBy 패키지를 설치하고 orderBy 함수를 사용 

문제23. 이름과 월급을 출력하는데 월급이 높은 사원부터 출력하시오 !
emp[ 행 , 열 ]
emp[ order(emp$sal, decreasing=T), c("ename", "sal") ]

설명: dataframe 에 내장되어 있는 order 옵션을 사용하면 됩니다.

문제24. 이름과 입사일을 출력하는데 먼저 입사한 사원부터 출력하시오 !
emp[ order(emp$hiredate, decreasing=F), c("ename", "hiredate") ]

문제25.  직업이 SALESMAN 인 사원들의 이름과 월급과 직업을 출력하는 월급이 높은 사원부터 출력하시오 !
1.  직업이 SALESMAN 인 사원들의 이름과 월급을 출력해서 result 변수에 담는다
result <-  emp[ emp$job=='SALESMAN', c("ename", "sal", "job") ]

2.  result 변수의 월급을 높은 것부터 출력한다. 
result[ order(result$sal, decreasing=T), c("ename", "sal", "job") ]

문제26.  부서번호가 30번인 사원들의 이름과 월급과 입사일을 출력하는데  먼저 입사한 사원부터 출력하시오 !
result <-  emp[ emp$deptno == 30, c("ename", "sal", "hiredate") ]
result[ order(result$hiredate , decreasing=F),      ]  

문제27. doBy 패키지를 이용해서 이름과 월급을 출력하는데 월급이 높은 것부터 출력하시오 !
install.packages("doBy")
library(doBy)
orderby(~-sal, emp[     , c("ename","sal")] )

설명:  emp[     , c("ename","sal")]  이름과 월급을 출력하는 결과를 orderBy 함수에 넣고 정렬하고자하는 컬럼 sal 앞에 ~ 물결을 사용해서 정렬을 하면  됩니다.  ~ 다음에 마이너스(-) 를 붙여주면 높은것 부터 정렬됩니다. 

문제28.  직업이 ANALYST 가 아닌 사원들의 이름과 월급과 직업을 출력하는데 월급이 높은 사원부터 출력되게하시오 ! (doBy 패키지를 이용해서 하세요 ~ )
library(doBy)
orderBy( ~-sal,   emp[ emp$job !='ANALYST', c("ename", "sal", "job") ] )

문제29. 범죄 발생요일(crime_day.csv) 를 R 로 로드해서 토요일에 발생하는 범죄유형, 범죄건수를 출력하는데 범죄건수가 높은것 부터 출력하시오 !
crime_day <- read.csv("crime_day.csv")
result <- crime_day[ crime_day$DAY=='SAT',  c("C_T", "CNT") ]
library(doBy)
orderBy(~-CNT, result ) 

*변수의 목록 확인방법
ls()

*변수를 지우고 싶다면 ?
rm(result)
result 

문제30. 살인이 일어나는 장소와 건수를 출력하는데 건수가 높은 것 부터 출력하시오
crime_loc <- read.csv("crime_loc.csv")
head(crime_loc)
result <- crime_loc[ crime_loc$범죄=='살인', c("장소","건수") ]
library(doBy)
orderBy( ~-건수 , result ) 

문제31. 강도가 일어나는 장소와 건수를 출력하는데 건수가 높은 것 부터 출력하시오
crime_loc <- read.csv("crime_loc.csv")
head(crime_loc)
result <- crime_loc[ crime_loc$범죄=='강도', c("장소","건수") ]
library(doBy)
orderBy( ~-건수 , result ) 