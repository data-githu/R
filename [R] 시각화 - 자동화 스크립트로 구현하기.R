■ 시각화 - 자동화 스크립트로 구현하기

bar <- function() {      # R 에서 함수 만드는 코드 

  fname <- file.choose()  #  윈도우 탐색기 여는 코드

  table <- read.csv(fname, header=T, stringsAsFactor=F )

  print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드

  xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
  ycol_num <- as.numeric(readline('y축 컬럼 번호: ')) # 번호 물어보기 

  xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
  ycol <- colnames(table[ycol_num])   # y축 컬럼명을 담는 코드 

  xcol2 <- table[,xcol] # 예: emp[, "empno"] 
  ycol2 <- table[,ycol] #  y 축 컬럼의 데이터를 ycol2 에 넣는다. 
  y_max <- max(ycol2)  + 100

  barplot(ycol2, main=paste(xcol,'과',ycol,'의 막대 그래프'), names.arg=xcol2,
        col=c('Green Yellow'), density=80, ylim= c(0,y_max) , beside=T)
}


문제148.위에막대그래프 자동화 코드를 이용해서 원형 그래프 자동화 함수를 생성하시오!(함수 이름은 pie2)
pie2 <- function() {      # R 에서 함수 만드는 코드 

  fname <- file.choose()  #  윈도우 탐색기 여는 코드

  table <- read.csv(fname, header=T, stringsAsFactor=F )

  print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드

  xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
  ycol_num <- as.numeric(readline('y축 컬럼 번호: ')) # 번호 물어보기 

  xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
  ycol <- colnames(table[ycol_num])   # y축 컬럼명을 담는 코드 

  xcol2 <- table[,xcol] #  x 축 컬럼의 데이터를 xcol2 에 넣는다. 
  ycol2 <- table[,ycol] #  y 축 컬럼의 데이터를 ycol2 에 넣는다. 

  y_labels <- round( ycol2/ sum(ycol2) *100, 1)
  y_labels2 <-paste(xcol2, y_labels, '%')

  pie( ycol2 , main=paste(ycol ,'의 원형 그래프') , labels=y_labels2, col=rainbow(15) ) 

}


문제149.아래의 메뉴 코드를 실행하시오 !
x1 <- menu( c('막대 그래프', '원형 그래프') )
x1

문제150.  아래의 switch 코드를 실행하시오 !
my_func <- function() {  
  
  bar <- function() {      # R 에서 함수 만드는 코드 
    
    fname <- file.choose()  #  윈도우 탐색기 여는 코드
    
    table <- read.csv(fname, header=T, stringsAsFactor=F )
    
    print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드
    
    xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
    ycol_num <- as.numeric(readline('y축 컬럼 번호: ')) # 번호 물어보기 
    
    xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
    ycol <- colnames(table[ycol_num])   # y축 컬럼명을 담는 코드 
    
    xcol2 <- table[,xcol] # 예: emp[, "empno"] 
    ycol2 <- table[,ycol] #  y 축 컬럼의 데이터를 ycol2 에 넣는다. 
    y_max <- max(ycol2)  + 100
    
    barplot(ycol2, main=paste(xcol,'과',ycol,'의 막대 그래프'), names.arg=xcol2,
            col=c('Green Yellow'), density=80, ylim= c(0,y_max) , beside=T)
  }
  
  
  pie2 <- function() {      # R 에서 함수 만드는 코드 
    
    fname <- file.choose()  #  윈도우 탐색기 여는 코드
    
    table <- read.csv(fname, header=T, stringsAsFactor=F )
    
    print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드
    
    xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
    ycol_num <- as.numeric(readline('y축 컬럼 번호: ')) # 번호 물어보기 
    
    xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
    ycol <- colnames(table[ycol_num])   # y축 컬럼명을 담는 코드 
    
    xcol2 <- table[,xcol] #  x 축 컬럼의 데이터를 xcol2 에 넣는다. 
    ycol2 <- table[,ycol] #  y 축 컬럼의 데이터를 ycol2 에 넣는다. 
    
    y_labels <- round( ycol2/ sum(ycol2) *100, 1)
    y_labels2 <-paste(xcol2, y_labels, '%')
    
    pie( ycol2 , main=paste(ycol ,'의 원형 그래프') , labels=y_labels2, col=rainbow(15) ) 
    
  }
  
  x1 <- menu( c('막대 그래프', '원형 그래프'),
              title=" 숫자를 선택하세요 ~ "  )
  switch( x1,
          gp1 = {   bar()   },
          gp2 = {   pie2()  }
  )
}   

my_func()


문제151.  cars2.csv  를 생성하고 cars2.csv 의 시계열 데이터로 라인 그래프를 그리시오 !
cars <- read.csv("cars.csv")
y_max <- max(cars$cnt2) + 3
plot( cars$cnt2, type='o', col='blue', ylim=c(0,y_max), axes=FALSE, ann=FALSE )
axis( 1,  at=1:5,  lab=cars$date2 )
axis(2)  # y 축 생성 
legend( 2, 10, 'car', col='blue', cex=0.8, pch=21, lty=1  ) 


문제152.  위의 스크립트를 이용해서 윈도우에서 csv 파일을 불러와서 라인 그래프를 그리는 함수를 line2 라는 이름을 생성하시오 !

line2 <- function() {      # R 에서 함수 만드는 코드 
  
  fname <- file.choose()  #  윈도우 탐색기 여는 코드
  
  table <- read.csv(fname, header=T, stringsAsFactor=F )
  
  print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드
  
  xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
  ycol_num <- as.numeric(readline('y축 컬럼 번호: ')) # 번호 물어보기 
  
  xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
  ycol <- colnames(table[ycol_num])   # y축 컬럼명을 담는 코드 
  
  xcol2 <- table[,xcol] #  x 축 컬럼의 데이터를 xcol2 에 넣는다. 
  ycol2 <- table[,ycol] #  y 축 컬럼의 데이터를 ycol2 에 넣는다.
  
  y_max2 <- max(ycol2) -1
  y_max <- max(ycol2)  +3 
  y_max 
  plot( ycol2, type='o', col='blue', ylim=c(0,y_max), axes=FALSE, ann=FALSE )
  
  axis( 1,  at=1:5,  lab= xcol2 )
  axis(2)  # y 축 생성 
  legend( 2, y_max2,  table , col='blue', cex=0.8, pch=21, lty=1  ) 
  
}

문제153.  my_func 함수(그래프 통합 코드 함수) 에 line2  함수로 만든 라인 그래프를 세번째로 추가 시키시오.
문제150번 코드 전체를 가져옵니다.

my_func <- function() {  

bar <- function() {      # R 에서 함수 만드는 코드 
  
  fname <- file.choose()  #  윈도우 탐색기 여는 코드
  
  table <- read.csv(fname, header=T, stringsAsFactor=F )
  
  print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드
  
  xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
  ycol_num <- as.numeric(readline('y축 컬럼 번호: ')) # 번호 물어보기 
  
  xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
  ycol <- colnames(table[ycol_num])   # y축 컬럼명을 담는 코드 
  
  xcol2 <- table[,xcol] # 예: emp[, "empno"] 
  ycol2 <- table[,ycol] #  y 축 컬럼의 데이터를 ycol2 에 넣는다. 
  y_max <- max(ycol2)  + 100
  
  barplot(ycol2, main=paste(xcol,'과',ycol,'의 막대 그래프'), names.arg=xcol2,
          col=c('Green Yellow'), density=80, ylim= c(0,y_max) , beside=T)
}


pie2 <- function() {      # R 에서 함수 만드는 코드 
  
  fname <- file.choose()  #  윈도우 탐색기 여는 코드
  
  table <- read.csv(fname, header=T, stringsAsFactor=F )
  
  print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드
  
  xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
  ycol_num <- as.numeric(readline('y축 컬럼 번호: ')) # 번호 물어보기 
  
  xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
  ycol <- colnames(table[ycol_num])   # y축 컬럼명을 담는 코드 
  
  xcol2 <- table[,xcol] #  x 축 컬럼의 데이터를 xcol2 에 넣는다. 
  ycol2 <- table[,ycol] #  y 축 컬럼의 데이터를 ycol2 에 넣는다. 
  
  y_labels <- round( ycol2/ sum(ycol2) *100, 1)
  y_labels2 <-paste(xcol2, y_labels, '%')
  
  pie( ycol2 , main=paste(ycol ,'의 원형 그래프') , labels=y_labels2, col=rainbow(15) ) 
  
}

line2 <- function() {      # R 에서 함수 만드는 코드 
  
  fname <- file.choose()  #  윈도우 탐색기 여는 코드
  
  table <- read.csv(fname, header=T, stringsAsFactor=F )
  
  print(data.table(colnames(table))) # 컬럼명을 번호와 함께 출력하는 코드
  
  xcol_num <- as.numeric(readline('x축 컬럼 번호: ')) # 번호 물어보기
  ycol_num <- as.numeric(readline('y축 컬럼 번호: ')) # 번호 물어보기 
  
  xcol <- colnames(table[xcol_num])   # x축 컬럼명을 담는 코드
  ycol <- colnames(table[ycol_num])   # y축 컬럼명을 담는 코드 
  
  xcol2 <- table[,xcol] #  x 축 컬럼의 데이터를 xcol2 에 넣는다. 
  ycol2 <- table[,ycol] #  y 축 컬럼의 데이터를 ycol2 에 넣는다.
  
  y_max2 <- max(ycol2) -1
  y_max <- max(ycol2)  +3 
  y_max 
  plot( ycol2, type='o', col='blue', ylim=c(0,y_max), axes=FALSE, ann=FALSE )
  
  axis( 1,  at=1:5,  lab= xcol2 )
  axis(2)  # y 축 생성 
  legend( 2, y_max2,  table , col='blue', cex=0.8, pch=21, lty=1  ) 
  
}

x1 <- menu( c('막대 그래프', '원형 그래프', '라인 그래프' ),
            title=" 숫자를 선택하세요 ~ "  )
switch( x1,
        gp1 = {   bar()   },
        gp2 = {   pie2()  },
        gp3 = {   line2() } 
)
}   