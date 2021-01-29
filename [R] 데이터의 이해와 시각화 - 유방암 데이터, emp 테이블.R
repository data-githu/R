■ 데이터의 이해와 시각화 - 유방암 데이터

유방암 데이터는 위스콘신 대학교의 연구원이 기부했으며 유방 종양의 미세침흡인물 디지털 이미지에서 측정한 값이 들어있다. 이 값은 디지털 이미지에 존재하는 새포핵의 특성을 나타낸다. 569개의 암조직 검사 예시가 들어있으며 각 예시는 32개의 특징을 갖는다.

문제66. 머신러닝때 사용할 유방암 데이터를 R로 로드하고 전체 건수가 몇건인지 확인하시오!
wisc <- read.csv("wisc_bc_data.csv")
nrow(wisc) # 전체 건수확인
# [1] 569

ncol(wisc) #컬럼의 갯수확인
# [1] 32

str(wisc) # 데이터 프레임 구조 확인

설명 : diagnosis만 문자이고 나머지는 다 숫자인데 diagnosis는 유방암 환자가 양성(B)인지 악성인지(M)를 나타내는 라벨(정답) 컬럼입니다. 종속변수입니다.

문제67. 유방암 데이터에서 양성 환자가 몇명이고 악성 환자가 몇명인지 확인하시오!
세로 : aggregate(id~diagnosis,  wisc, length)
가로 : table(wisc$diagnosis)

문제68. 위의 결과를 원형그래프로 시각화 하시오!
pie(table(wisc$diagnosis))

문제69. 직업, 직업별 토탈월급을 가로로 출력하시오!
세로 : aggregate(sal~job, emp, sum)
가로 : tapply(emp$sal, emp$job, sum)

문제70. 위의 결과를 막대 그래프로 시각화 하시오!
x <- tapply(emp$sal, emp$job, sum)
barplot(x, main="직업별 토탈월급",col=rainbow(5))

문제71. 입사한 년도(4자리), 입사한 년도별 토탈월급을 출력하시오!
세로 : aggregate(sal ~ format( as.Date(emp$hiredate),'%Y'), emp, sum)
가로 : tapply(emp$sal, format( as.Date(emp$hiredate),'%Y'),sum)

문제72. 위의 결과를 막대 그래프로 시각화 하시오.
x<-tapply(emp$sal, format( as.Date(emp$hiredate),'%Y'),sum)
barplot(x,main="입사년도별 토탈월급",col=rainbow(5))

문제73. 부서번호별 직업별 토탈월급을 구하시오!
attach(emp)
tapply(sal, list(job, deptno),sum)

               10   20   30
ANALYST      NA   6000   NA
CLERK        1300 1900  950
MANAGER      2450 2975 2850
PRESIDENT    5000   NA   NA
SALESMAN     NA    NA  5600

설명 : attach(emp)를 사용했기 때문에 emp$sal, emp$job, emp$deptno 라고 안쓰고 sal, job, deptno로만 작성할 수 있었다.

위의 데이터를 가지고 그래프를 그리기 위해서는 NA 값이 없어야 합니다.
NA 값을 0으로 변경해보겠습니다.

문제74. 위의 결과의 NA를 숫자 0으로 출력되게하시오!
attach(emp)
x <- tapply(sal, list(job, deptno),sum)
x[is.na(x)] <- 0
x

문제75. 위의 결과에서 컬럼명만 출력하고 로우명만 출력하시오!
colnames(x)
rownames(x)

문제76. 위의 결과를 막대 그래프로 시각화 하시오!
barplot(x, col=rainbow(5), legend=rownames(x), beside=T, density=50)

legend : 그래프의 설명 박스, beside = T : 직업별로 각각의 막대그래프 그리기

문제77. 입사한 년도(4자리), 입사한 년도별 직업별 토탈월급을 출력하시오!
tapply(emp$sal, list(format(as.Date(emp$hiredate),'%Y'),emp$job),sum)

       ANALYST CLERK MANAGER PRESIDENT SALESMAN
1980      NA   800      NA        NA       NA
1981    3000   950    8275      5000     5600
1982    3000  1300      NA        NA       NA
1983      NA  1100      NA        NA       NA


문제78. 위의 결과에서 NA를 0으로 출력되게하시오!
x <- tapply(emp$sal, list( format(as.Date(emp$hiredate),'%Y'),emp$job),sum)
x[is.na(x)] <- 0
x

문제79. 위의 결과를 막대그래프로 그리시오!
barplot(x, col=rainbow(5), beside=T, density=50,legend=rownames(x) )

문제80. 입사한 년도(4자리)를 막대그래프의 x축으로 구성하고 막대그래프의 y축을 부서번호의 평균월급으로 구성되게 하는데 입사한 년도별로 부서번호 10,20,30 이 각각 그려지게 하시오!
x <- tapply(emp$sal, list(emp$deptno, format(as.Date(emp$hiredate),'%Y')),mean)
x[is.na(x)] <- 0
x

barplot(x, col=rainbow(5), beside=T, density=50,legend=rownames(x) )



문제81.  직업과 직업별 토탈월급을 가지고 원형(pie) 그래프를 그리시오 !
x <-  tapply(  emp$sal,  emp$job,  sum )
pie( x,  col=rainbow(5),  density=80 )

문제82. 위의 그래프를 3D로 그리시오
install.packages("plotrix")
library(plotrix)
pie3D(x, explode=0.1, lables=rownames(x))

설명 : explode는 벌어진 정도입니다.

문제83. 위의 그래프의 결과에 직업 옆에 비율도 같이 출력되게 하시오!
x <- tapply(emp$sal, emp$job, sum) # 직업별 토탈월급을 가로로 출력
x2 <- aggregate(sal~job, emp, sum) # 직업별 토탈월급을 세로로 출력 
pct <- round (x2$sal/sum(emp$sal)*100,1)
pct

job_label <- paste(x2$job,':',pct,'%')
job_label

pie3D(x, explode=0.1, labels = job_label) # 3D 로 원형 그래프 그리기 
pie(  x, labels=job_label ,col=rainbow(14))  # 그냥 원형 그래프 그리기 

문제84. 유방암 데이터의 diagnosis의 양성과 악성의 비율을 원형 그래프로 그리시오.
x <- tapply(wisc$id, wisc$diagnosis, length)
x2 <- aggregate(id~diagnosis,wisc,length)
pct <- round (x2$id/nrow(wisc)*100,1)
pct

w_label <- paste(x2$diagnosis,':',pct,'%')
w_label

pie(x, col=c('green','red'), labels = w_label)

설명 : 그래프를 그릴 때는 가로로 출력되는 결과 데이터를 가지고 그려야 합니다.
비율을 나타내는 라벨을 만들 때는 세로로 출력되는 결과 데이터를 가지고 만듭니다.

