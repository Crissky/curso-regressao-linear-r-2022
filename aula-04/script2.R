######### Script de Isabella - PREVISAO ########


# EXERCICIO 19, Secao 10-3, Triola ------

#Dados
trinta.d <- c(244, 260, 264, 264, 278, 318, 280)
um.d <- c(456, 614, 567, 943, 628, 1088, 536)


## Resposta 19 (Reta de regressão) -----
mod = lm(um.d ~ trinta.d)

# P-Valor maior que 0,05 (0.0746)
# modelo não ser para Regressão linear,
# pois a variáveis independente
# não pode prever a variável dependente.
summary(mod)  

# Neste caso, a média de Y é um bom preditor
mean(um.d)




# EXERCICIO 23, Secao 10-3, Triola ------

#Dados
co2 <- c(314, 317, 320, 326, 331, 339, 346, 354, 361, 369)
temp <- c(13.9, 14, 13.9, 14.1, 14, 14.3, 14.1, 14.5, 14.5, 14.4)



## Resposta 23 ----

mod2 = lm(temp ~ co2)
summary(mod2)  # P-Valor menos que 0,05 (0.000522)

# Visualizando o modelo
plot(temp ~ co2)  # Pontos
abline(mod2, col='red')  # Reta

# Prevendo manualmente
temperatura = 10.483081 + 0.010918 * 370.9
temperatura

# prevendo com a função predict
predict(mod2, data.frame(co2=370.9))



# EXERCICIO 26, Secao 10-3, Triola ------

#Dados
cric <- c(882, 1188, 1104, 864, 1200, 1032, 960, 900)
temper <- c(69.7, 93.3, 84.3, 76.3, 88.6, 82.6, 71.6, 79.6)


## Resposta 26 ----
mod3 = lm(temper ~ cric)
summary(mod3) # P-Valor menos que 0,05 (0.00457)

# Prevendo manualmente
27.62835 + 0.05227 * 3000

# prevendo com a função predict
predict(mod3, data.frame(cric=3000))



# EXERCICIO 13, Secao 10-3, Triola ------

# Dados
ipc <- c(30.2, 48.3, 112.3, 162.2, 191.9, 197.8)
pizza <- c(0.15, 0.35, 1, 1.25, 1.75, 2)


## Resposta 13 ----
mod4 = lm(pizza ~ ipc)
summary(mod4)  # P-Valor menos que 0,05 (0.000326)

# Visualização
plot(pizza ~ ipc)
abline(mod4, col='red')

# prevendo com a função predict
predict(mod4, data.frame(ipc=182.5))







# EXERCICIO 17, Secao 10-3, Triola ------

# Dados
largura <- c(7.2, 7.4, 9.8, 9.4, 8.8, 8.4)
peso <- c(116, 154, 245, 202, 200, 191)

mod5 = lm(peso ~ largura)
summary(mod5)

plot(peso ~ largura)
abline(mod5)

predict(mod5, data.frame(largura=9))

-156.88 + 40.18 * 9
-156.879 + 40.182 * 9
