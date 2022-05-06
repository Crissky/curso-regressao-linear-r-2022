dados <- load(url(description = "https://www.ime.usp.br/~pam/dados.RData"))
attach(tab15_1)
tab15_1

?lm

modelo <- lm(tempo_Y ~ acuidade_Z)
summary(modelo)

predict(modelo, data.frame(acuidade_Z=90))

162.0789 -0.6421*90
