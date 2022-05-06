###############################################################################

################################### CURSO R ###################################

################################## PREVISÃO ###################################

###############################################################################

## Leitura dos dados

dados <- load(url(description = "https://www.ime.usp.br/~pam/dados.RData"))

attach(tab15_1)

tab15_1

?lm

modelo <- lm(tempo_Y ~ acuidade_Z)

summary(modelo)

## PREVISÃO

## tempo_Y = 162.0789 - 0.6421 * acuidade_Z

162.0789 - 0.6421 * 90

?predict

acuidade_nova <- data.frame(acuidade_Z=90)

predict(modelo, acuidade_nova)


acuidade_nova <- read.csv("acuidade.csv")

predict(modelo,acuidade_nova)

predict(modelo)


###############################################################################

################################## OBRIGADA ###################################

###############################################################################