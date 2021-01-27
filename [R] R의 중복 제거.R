■ R의 중복 제거 

오라클  ------------------------------  R 

distinct                              unique 


문제21.  부서번호를 출력하는데 중복을 제거해서 출력하시오 
library(data.table)
data.table( "부서번호"=unique(emp$deptno)  )

문제22.  직업을 출력하는데 중복을 제거해서 출력하시오 !
library(data.table)
data.table( "직업"=unique(emp$job)  )