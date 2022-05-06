##### Curso R #####
## Correlação

x <- c(1.290, 2.330, 1.800, 3.452, 5.890, 6.730, 8.600)
y <- c(0.1, 0.8, 0.6, 3, 5.1, 7.4, 8.6)

cor(x,y)

library(stats)

cor.test(x, y, method='pearson', alternative='two.sided')
cor.test(x, y, method='pearson', alternative='less')

graf <- plot(y~x)


#####Regress?o simples ######
x <- c(30, 35, 50, 54, 57, 70, 76, 78, 90, 92)
y <- c(38, 43, 32, 26, 33, 19, 27, 23, 14, 21)

# Calcular os coeficientes da reta de regressão
modelo <- lm(y~x)
ajuste <- lm(y~x)

# Gráfico dos pontos da reta ajustada
plot(y~x)

# Verificar se o modelo é razoável
ajuste <- lm(y~x)
abline(ajuste)

summary(ajuste)


##### ANOVA #####
# Usando seus dados no R

getwd()

# Muda diretório
# setwd()

# Lendo CSV
medicamento <- read.csv("anova1.csv", sep=';', header=T)
medicamento

View(medicamento)

# A função do R que executa a ANOVA é a AOV ou lm
modeloanova <- aov(HORAS ~ REMEDIO, data=medicamento)
modeloanova

summary(modeloanova)
