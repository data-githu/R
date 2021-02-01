■ 시각화 - 지도 그래프 그리기

map 패키지를 설치하고 중국지도만 확대해서 출력하시오!
install.packages("maps")
install.packages("mapproj")
library(maps)
libarary(mappro)
map("world")
map("world","china")

문제163. 미국지도를 시각화하시오!
map("world","USA")