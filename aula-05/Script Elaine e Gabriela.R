##### Curso R ######
## Correlacao

x<-c(1.290, 2.330, 1.800, 3.452, 5.890, 6.730, 8.600)
y<-c(0.1, 0.8, 0.6, 3, 5.1, 7.4, 8.6)

cor(x,y)

library(stats)
cor.test(x,y, method = "pearson", alternative="two.sided")
cor.test(x,y, method = "pearson", alternative="less")
graf<-plot(y~x) #plota o gr�fico de dispers�o dos dados


#####Regress�o simples ######
x<-c(30, 35, 50, 54, 57, 70, 76, 78, 90, 92)
y<-c(38, 43, 32, 26, 33, 19, 27, 23, 14, 21)

## [A] Calculando os coeficientes da reta de regress�o

# cria o modelo de y em fun��o de x, armazena no objeto modelo e 
#exibe o objeto modelo
modelo<- lm(y~x)
ajuste<-lm(y~x)

## [B] Gr�fico dos pontos da reta ajustada

plot(y~x)
ajuste<-lm(y~x)
abline(ajuste)

##[C] Verifica se modelo � razoav�l 

summary(ajuste)


##### ANOVA #####
# Usando seus dados no R
# Se estiver no formato .csv, use:
medicamento <- read.csv("anova1.csv",sep=";", header=T)
medicamento

# Se estiver no formato .txt, use:
# medicamento2 <- read.delim("anova.txt")

# OBS: lembre-se de especificar o argumento sep = ";"
# Caso a configura��o do seu computador esteja com separador decimal como ",", 
#chame a tabela da seguinte maneira no R:
#medicamento3 <- read.csv2("anova.csv", dec = ",")

# Visualize sua planilha de dados
View(medicamento)

#Aplicando a Anova para um �nico fator
#A fun��o do R que executa a ANOVA � a aov ou lm.
# exemplo: aov(V.Dependente ~ V.Independente , data=dados)
modeloanova <- aov(HORAS ~ REMEDIO, data =medicamento)

modeloanova

# Fun��o summary forncece mais informa��es em rela��o ao modelo
summary(modeloanova)