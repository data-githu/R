■ R의 변환함수

오라클  --------------------------  R  

to_char                      as.character
to_number                as.integer 
to_date                      as.Date 

format 함수 


문제44. 이름, 입사한 요일을 출력하시오 !
SQL> select  ename, to_char( hiredate, 'day')
from   emp;

R> data.table( emp$ename,  format( as.Date(emp$hiredate), '%A')  )

※  format 의  옵션 
%A : 요일
%Y : 년도 4자리
%y :  년도 2자리 
%m : 달 
%d :  일 


문제45.  11월에 입사한 사원들의 이름과 입사일을 출력하시오 !
SQL> select  ename, hiredate
from  emp
where to_char(hiredate,'mm') = '11' ;

R> emp[ format( as.Date(emp$hiredate),'%m')=='11', c("ename", "hiredate") ] 


문제46. 오늘 부터 100달 뒤에 돌아오는 날짜를 출력하시오 !
SQL> select  add_months( sysdate, 100 )
from  dual;

R> Sys.Date() +  months(100)  

설명 :  days(숫자), months(숫자), years(숫자)  


문제47.  오늘 부터 100달 뒤에 돌아오는 날짜의 요일을 출력하시오 !
SQL> select  to_char( add_months( sysdate, 100) , 'day')
from  dual;

R> format(  Sys.Date() +  months(100)  ,'%A' )


문제48.  내가 무슨 요일에 태어났는지 출력하시오 !
SQL> select  to_char( to_date('1993/11/05','RRRR/MM/DD'), 'day')
from  dual;

R> format(  as.Date('1993/11/05') , '%A' )