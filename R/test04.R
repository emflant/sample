install.packages("devtools")
require(devtools)
install_github('ramnathv/rCharts')
require(rCharts)

## Example 1 Facetted Scatterplot
names(iris) = gsub("\\.", "", names(iris))
iris

# rCharts uses a formula interface to specify plots, just like the lattice package.
# lattice 패키지의 표현식을 따르며, 

# y축 : SepalLength
# x축 : SepalWidth
# Species 별로 차트 나누어 구성.
rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', type = 'point')


hair_eye = as.data.frame(HairEyeColor)
hair_eye
r1 <- rPlot(Freq ~ Hair | Eye, color = 'Eye', data = hair_eye, type = 'bar')
r1$print()
require(reshape2)
uspexp <- melt(USPersonalExpenditure)
names(uspexp)[1:2] = c("category", "year")
x1 <- xPlot(value ~ year, group = "category", data = uspexp, type = "line-dotted")
x1$print("chart4")
x1

xPlot(value ~ year, group = "category", data = uspexp, type = "line-dotted")
rPlot(value ~ year, group = "category", data = uspexp, type = "line-dotted")
uspexp

# https://www.statmethods.net/index.html
