########## INTRODUÇÃO AO R ##########

# --- Criando variáveis no R ---

variavel1 <- c(1,2,3,4,4,3,2,1)
variavel2 <- c(5,6,7,8,4,3,12,1)
variavel3 <- c(9,10,11,12,10,10,14,12)
variavel4 <- c(24,31,33,15,10,10,24,27)


# --- Forma correta de criar um vetor não númerico ---

opiniao <- c("sim", "sim", "não", "não")
opiniao

# --- Forma errada de criar um vetor não numérico ---
vetorerrado <- c(sim,nao,nao,sim)

# --- Criando matriz ---
banco_de_dados <- matrix(c(variavel1, variavel2, variavel3, variavel4), ncol=4, byrow=F)
banco_de_dados = cbind(variavel1, variavel2, variavel3, variavel4)
banco_de_dados


# --- Importando banco de dados utilizando 
# Usar "Import Dataset" da aba Environment
# Ler o banco de dados "Exemplo1.xlsx"

# Lendo uma variável do banco de dados

Exemplo1$X
mean(Exemplo1$X)
sd(Exemplo1$X)

Exemplo1$Y

# Fazendo gráfico de dispersão
Exemplo1.lm <- lm(Exemplo1$Y~Exemplo1$X)
plot(Exemplo1$X, Exemplo1$Y, xlab="Variável X", ylab="Variável Y",
     main="Gráfico de dispersão")

abline(Exemplo1.lm, col="red", lwd=2)


# --- Pacote Rcmdr ---

install.packages("Rcmdr", dependence=T)

# Formas de importar bibliotecas (require ou library)
require(Rcmdr)
# library(Rcmdr)
