■ R을 이용하여 기본 데이터 검색

문제2. emp.csv 를 리눅스에 /home/scott에 올리고 emp.csv를 로드해서 emp 데이터 프레임을 만드시오.

리눅스에서 ...

setwd("/home/scott")
emp <-  read.csv("emp3.csv")
emp

윈도우에서...

setwd("c:\\data")
emp <- read.csv("emp3.csv")
emp

문제3.  emp 데이터 프레임에서 이름과 월급을 출력하시오 !
문법:  emp[ 행, 열 ]

emp[    ,  c("ename", "sal") ]
             ↑
       combine

문제4.  월급이 3000 인 사원들의 이름과 월급을 출력하시오 !
emp[ emp$sal==3000, c("ename","sal") ]

문제5.  월급이 2000 이상인 사원들의 이름과 월급을 출력하시오 !
emp[emp$sal>=2000,c("ename","sal")]

문제6. 직업이 SALESMAN 인 사원들의 이름과 월급과 직업을 출력하시오 !
emp[ emp$job=='SALESMAN', c("ename", "sal", "job") ]

문제7. 1981년 12월 11일에 입사한 사원들의 이름과 입사일을 출력하시오 !
emp[emp$hiredate=='1981-12-11 0:00', c("ename","hiredate")]

문제8. emp 데이터 프레임의 구조를 확인하시오 !
str(emp)

'data.frame':	14 obs. of  9 variables:
 $ index   : int  1 2 3 4 5 6 7 8 9 10 ...
 $ empno   : int  7839 7698 7782 7566 7654 7499 7844 7900 7521 7902 ...
 $ ename   : chr  "KING" "BLAKE" "CLARK" "JONES" ...
 $ job     : chr  "PRESIDENT" "MANAGER" "MANAGER" "MANAGER" ...
 $ mgr     : int  NA 7839 7839 7839 7698 7698 7698 7698 7698 7566 ...
 $ hiredate: chr  "1981-11-17 0:00" "1981-05-01 0:00" "1981-05-09 0:00" "1981-04-01 0:00" ...
 $ sal     : int  5000 2850 2450 2975 1250 1600 1500 950 1250 3000 ...
 $ comm    : int  NA NA NA NA 1400 300

설명: emp 데이터 프레임의 hiredate 가 chr (문자형) 이므로 검색할 때 문자 그대로 검색하면 됩니다. 