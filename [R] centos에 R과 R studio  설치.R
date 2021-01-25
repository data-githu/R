■ centos에 R과 R studio  설치

문제1. centos7에서 R과 Rstudio를 설치하고 아래와 같이 R studio를 이용해서 emp 테이블을 출력하세요.
0) 기초 작업
Root 권한 획득
$su -
  암호 :
  
Repository 내역 확인
#yum repolist

EPEL 설치, 업데이트
#yum install epel-release
#yum update


1) R 설치하기
yum 명령어로 R 설치
#yum install R -y

R실행
#R


2) RStudio Server 설치하기
RStudio Server 최신 버전을 확인
(https://rstudio.com/products/rstudio/download-server/)

#wget https://download2.rstudio.org/server/centos6/x86_64/rstudio-server-rhel-1.2.5019-x86_64.rpm
#yum install rstudio-server-rhel-1.2.5019-x86_64.rpm


3)  RStudio Server 실행하기
RStudio Server가 service로 등록되어 실행되고 있는지를 확인한다.
#systemctl status rstudio-server.service

Firefox를 열어 주소창에'http://localhost:8787'을 입력 후, 
RStudio Server를 설치했던 계정으로 로그인
출처: <https://flipdata.tistory.com/35> 
  
[root@centos~]#exportDISPLAY=192.168.19.31:0.0
[root@centos~]#firefox http://localhost:8787
Running without a11y support!
  
R스튜디오 창
setwd("/home/scott")
emp <- read.csv("emp2.csv")
emp
