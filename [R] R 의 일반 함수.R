■ R 의 일반 함수 

Oracle -----------------------------  R  

1. nvl 함수                             is.na
2. decode 함수                          ifelse
3. case 함수                            ifelse 


문제49.  이름, 월급, 등급을 출력하는데 월급이 1500 이상이면 등급을 A 로 출력하고 아니면 B 로 출력하시오 !
R>  data.table( emp$ename, emp$sal,  ifelse( emp$sal >= 1500, 'A', 'B')  )

설명:  ifelse 는 결측치 데이터를 다른 데이터로 대체할 때 아주 유용한 함수 입니다.
머신러닝 시에 모델이 학습할 때 좋은 학습 데이터를 제공 하기 위하여 결측치에 값을 채워주는게 중요합니다. 


문제50.  이름, 월급, 보너스를 출력하는데 보너스가 입사한 년도가 1980 년도이면 A 로 출력하고 1981 년도이면 B 로 출력하고 1982 년도이면 C 로 출력하고 나머지 년도는 D 로 출력되게하시오 !
data.table( emp$ename, emp$sal, 
              ifelse( format( as.Date(emp$hiredate),'%Y')=='1980', 'A',
              ifelse( format( as.Date(emp$hiredate),'%Y')=='1981', 'B',
              ifelse( format( as.Date(emp$hiredate),'%Y')=='1982', 'C' ,'D')   ) ) ) 


문제51. student-mat.csv 를 내려받아서 R 로 로드하고 나이와 등급을 출력하는데 등급이 나이가  15 ~ 18 은 A , 19~20 은 B, 21~ 22은 C 로 출력하시오 !
setwd("C:\\data")
student <- read.csv("student-mat.csv")
# View(student)
# summary(student)
install.packages("data.table")
library(data.table)
data.table(student$age,   
           ifelse( student$age >= 15 &  student$age <= 18 ,'A',
           ifelse( student$age >= 19 &  student$age <= 20 ,'B','c')))
         


