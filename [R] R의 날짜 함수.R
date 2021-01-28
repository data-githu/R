■ R의 날짜 함수 

오라클             vs                      R 

sysdate                                 Sys.Date()
add_months                          difftime
months_between                내장함수 없음
last_day                                내장함수 없음
next_day                               내장함수 없음 


문제41.  오늘날짜를 출력하시오 !
Sys.Date()  


문제42. 이름, 입사한 날짜 부터 오늘까지 총 몇일 근무했는지 출력하시오 !
SQL>  select  ename,  sysdate - hiredate
from  emp;

R>  data.table( emp$ename,  Sys.Date() - as.Date(emp$hiredate ) )


문제43. 오늘 날짜의 달의 마지막 날짜를 출력하시오 !
SQL> select  last_day( sysdate ) 
        from  dual;

R>  install.packages("lubridate")
library(lubridate)
ceiling_date( Sys.Date(), "months")  - days(1) 

설명:  오늘의 날짜의 달의 천장 날짜(다음달 1일의 날짜)
floor_date( Sys.Date(),"months" )  ------------> 2021-01-01
Sys.Date()             ---------------->  2021-01-18
ceiling_date( Sys.Date() ,"months") ---------->  2021-02-01
