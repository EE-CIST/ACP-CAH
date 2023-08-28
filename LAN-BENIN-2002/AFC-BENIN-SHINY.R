


# Chargement des données Bénin
don <- read.csv("LAN-BENIN-2013/LAN-BENIN-2002-NIV1.csv", sep=";")

# Affichage du tableau
don

head(don)
tail(don)


# Mise en forme pour factoMiner
## Choisir les variables actives
tab <- don[,c(3:11)]
## Donner un label aux lignes
row.names(tab)<-don$admin1
tab

# Chargemennt de FactomineR et Factoshiny
library(FactoMineR)
library(explor)
library(Factoshiny)

# Réalisation de l'AFC sans affichage
AFC<-CA(X = tab,graph = F,ncp = 8)
explor(AFC)

#Factoshiny(AFC)



