■ R 의 문자함수 

오라클            vs            R 

upper                          toupper
lower                          tolower
substr                         substr
replace                       gsub


문제32. 이름과 직업을 출력하는데 소문자로 출력하시오 !
library(data.table)
data.table(이름=tolower(emp$ename), 직업=tolower(emp$job) )

문제33. 이름을 출력하고 그 옆에 이름의 첫번째 철자부터 세번째 철자까지 출력되게 하시오 !
SQL> select  ename,  substr(ename, 1, 3)
from   emp;

R>   library(data.table)
data.table( 이름=emp$ename, 철자=substr(emp$ename,1,3)  )

설명:  substr( 변수, 시작, 끝 )

문제34.  이름, 월급을 출력하는데 월급을 출력할 때에 숫자 0 을 * 로 출력하시오 
SQL> select  ename,  replace( sal, 0, '*' )
from   emp;

R>  data.table( 이름=emp$ename, 월급= gsub( 0, '*', emp$sal)  ) 

설명: gsub(변경전, 변경후, 변수)

문제35. 이름, 월급을 출력하는데 월급을 출력할 때에 숫자 0, 1, 2 를 * 로 출력하시오

SQL> select  ename, regexp_replace( sal, '[0-2]', '*')
from  emp;

R>  data.table( 이름=emp$ename, 월급= gsub( '[0-2]', '*', emp$sal)  ) 
