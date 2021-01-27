■ R 의 연산자 총정리

1. 산술연산자 : * / + -
2. 비교연산자 : >, <, >=, <=, ==, !=
3. 논리연산자 : & (and -> 벡터화 된 연산), && (and 벡터화 되지 않은 연산), | (or 벡터화된 연산), || (or 백터화 되지 않은 연산) ! (not)

예 : 
x <- c(1,2,3)
x
(x > c(1,1,1)) & (x < c(3,3,3))
  FALSE TRUE FALSE
  
예 :
x <- 1
x
((x>-2) && (x<2))
  
설명:  combine 을 사용하면 백터화 된것입니다.


* 연결 연산자

오라클 --------------------- R
  ||                       paste
  
문제9. 아래의 SQL을 R로 구현하시오
SQL > select ename || '의 직업은 ' || job
      from emp;
  
R > paste( emp$ename, '의 직업은 ', emp$job)
  
1. data.table 패키지를 설치한다.
  install.packages("data.table")
  
2. data.table 을 사용하겠다고 지정한다.
  library(data.table)
  
3. data.table 을 사용한다.
  data.table( emp$ename, ' 의 직업은 ' , emp$job )
  
* 기타 비교 연산자 
  
  오라클 ------------------------ R  
  
  1.  in                                 %in%
  2.  like                               grep
  3.  is null                            is.na
  4.  between  .. and               emp$sal >= 1000  & emp$sal <= 3000

  
문제10. 직업이 SALESMAN, ANALYST 인 사원들의 이름과 월급과 직업을 출력하시오
문법:  emp[ 행,  열 ]
emp[ emp$job %in%  c("SALESMAN","ANALYST"), c("ename","sal", "job") ]
  
문제11. 직업이 SALESMAN, ANALYST 가 아닌 사원들의 이름과 월급과 직업을 출력하시오 !
emp[ ! emp$job %in%  c("SALESMAN","ANALYST"), c("ename","sal", "job") ]
  
문제12. 부서번호가 10번, 20번인 사원들의 이름과 월급과 부서번호를 출력하시오!
emp[ emp$deptno  %in%  c(10,20), c("ename", "sal", "deptno")  ]
  
문제13.  커미션이 null 인 사원들의 이름과 월급과 커미션을 출력하시오 !
emp[ is.na(emp$comm),  c("ename", "sal", "comm") ]
  
설명: 1. NA (결손값) -------->  is.na()
      2. NaN (비수치) --------> is.nan()
             ↓
          Not a Number 
  
      3. NULL (아무것도 없다) -----> is.null()
  
설명:  머신러닝 학습시에는 결손값을 다른 값으로 대체하는 것이 아주 중요합니다.
  
문제14. 커미션이 NA 가 아닌 사원들의 이름과 월급과 커미션을 출력하시오 !
emp[ ! is.na(emp$comm),  c("ename", "sal", "comm") ]
  
문제15. 월급이 1000 에서 3000 사이인 사원들의 이름과 월급을 출력하시오 !
SQL > SELECT  ename, sal
       from  emp
      where  sal  between  1000  and 3000;
  
R >  emp[ emp$sal >= 1000  &  emp$sal <= 3000 , c("ename", "sal") ]
  > str(emp$sal)
int [1:14] 5000 2850 2450 2975 1250 1600 1500 950 1250 3000 ...
  
문제16. 월급이 1000 에서 3000 사이가 아닌 사원들이 이름과 월급을 출력하시오 !
emp[ ! ( emp$sal >= 1000  &  emp$sal <= 3000 ), c("ename", "sal") ]
  
문제17. 이름의 첫번째 철자가 A 로 시작하는 사원들의 이름과 월급을 출력하시오 !
emp[ grep("^A", emp$ename) , c("ename", "sal") ] 
  
설명: ^ 는 시작을 나타냅니다.
  
문제18. 이름의 끝글자가 T 로 끝나는 사원들의 이름과 월급을 출력하시오 !
emp[ grep("T$", emp$ename),  c("ename", "sal") ]
  
설명: $ 는 끝을 나타냅니다.  
  
문제19. 이름의 두번째 철자가 M 인 사원들의 이름과 월급을 출력하시오 !
emp[ grep("^.M", emp$ename), c("ename", "sal") ] 
  
설명:  점(.) 은 자릿수 하나 입니다.
  
문제20. 이름의 세번째 철자가 L 인 사원들의 이름과 월급을 출력하시오 !
emp[ grep("^..L", emp$ename), c("ename", "sal") ]
