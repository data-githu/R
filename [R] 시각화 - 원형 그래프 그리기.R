■ 시각화 - 원형 그래프 그리기

문제138. 사원 테이블의 월급을 원형 그래프로 그리시오
pie(emp$sal)

문제139. 위의 그래프를 다시 출력하는데 누구의 월급인지 명시되게 출력하시오!
pie(emp$sal, main="Salary Pie Chart", labels=emp$ename, col=rainbow(15))

문제140. 위의 그래프의 월급에 비율을 붙여서 출력하시오!
sal_labels <- round(emp$sal/sum(emp$sal)*100, 1)
sal_labels
sal_labels2 <- paste(emp$ename, sal_labels, '%')
sal_labels2

pie(emp$sal, main="Salary Pie Chart", labels=sal_labels2, col=rainbow(15))
