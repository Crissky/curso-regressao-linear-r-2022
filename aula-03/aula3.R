# Carregando os dados

dados <- load(url(description = "https://www.ime.usp.br/~pam/dados.RData"))
attach(tab15_1)
summary(tab15_1)

View(tab15_1)

# Construção do modelo

fit.model <- lm(tempo_Y~acuidade_Z)
fit.model

summary(fit.model)

# Testando a Variancia
anova(fit.model)


## Gráficos de diagnosticos

X <- model.matrix(fit.model)
n <- nrow(X)
p <- ncol(X)
H <- X%*%solve(t(X)%*%X)%*%t(X)
h <- diag(H)
lms <- summary(fit.model)
s <- lms$sigma
r <- resid(lms)
ts <- r/(s*sqrt(1-h))
di <- (1/p)*(h/(1-h))*(ts^2)
si <- lm.influence(fit.model)$sigma
tsi <- r/(si*sqrt(1-h))
a <- max(tsi)
b <- min(tsi)


# Os 4 graficos em duas linhas e duas colunas

par(mfrow=c(2,2))

plot(h, xlab="indice", ylab="Medida h", pch=16,
     ylim=c(0,1), main="Pontos aberrantes")
cut <- 2*p/n
abline(cut,0,lty=2)
identify(h, n=4)

plot(di,xlab="Índice", ylab="Distância de Cook", pch=16,
     main= "Pontos influentes")
identify(di, n=4)

plot(tsi,xlab="Índice", ylab="Resíduo Padronizado",
     ylim=c(b-1,a+1), pch=16, main="Resíduos")
abline(2,0,lty=2)
abline(-2,0,lty=2)
identify(tsi, n=4)

plot(fitted(fit.model),tsi,xlab="Valor Ajustado", 
     ylab="Resíduo Padronizado", ylim=c(b-1,a+1), pch=16, main ="Resíduos")
abline(2,0,lty=2)
abline(-2,0,lty=2)
identify(fitted(fit.model),tsi, n=4)


## Gráfico de quantis com envelope ##
par(mfrow=c(1,1))
X <- model.matrix(fit.model)
n <- nrow(X)
p <- ncol(X)
H <- X%*%solve(t(X)%*%X)%*%t(X)
h <- diag(H)
si <- lm.influence(fit.model)$sigma
r <- resid(fit.model)
tsi <- r/(si*sqrt(1-h))

ident <- diag(n)
epsilon <- matrix(0,n,100)
e <- matrix(0,n,100)
e1 <- numeric(n)
e2 <- numeric(n)

for(i in 1:100){
  epsilon[,i] <- rnorm(n,0,1)
  e[,i] <- (ident - H)%*%epsilon[,i]
  u <- diag(ident - H)
  e[,i] <- e[,i]/sqrt(u)
  e[,i] <- sort(e[,i]) }

for(i in 1:n){
  eo <- sort(e[i,])
  e1[i] <- (eo[2]+eo[3])/2
  e2[i] <- (eo[97]+eo[98])/2 }

med <- apply(e,1,mean)
faixa <- range(tsi,e1,e2)

par(pty="s")
qqnorm(tsi,xlab="Percentil da N(0,1)",
       ylab="Residuo Studentizado", ylim=faixa, pch=16, main="Gráfico de envelope")
par(new=TRUE)
qqnorm(e1,axes=F,xlab="",ylab="",type="l",ylim=faixa,lty=1, main="")
par(new=TRUE)
qqnorm(e2,axes=F,xlab="",ylab="", type="l",ylim=faixa,lty=1, main="")
par(new=TRUE)
qqnorm(med,axes=F,xlab="",ylab="",type="l",ylim=faixa,lty=2, main="")
