


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

# Description

## Description des colonnes
lang <- apply(X=tab,MARGIN=2,FUN=sum)
lang

tot <- sum(tab)
tot

lang_pct<-100*lang/tot
lang_pct

## Description des lignes
pop_dept <- apply(X=tab,MARGIN=1,FUN=sum)
pop_dept

tot <- sum(tab)
tot

pop_dept_pct<-100*pop_dept/tot
pop_dept_pct


# Chi-2

## réalisation et stockage du test du chi2
monchi2 <-chisq.test(x=tab)

## Affichage minimal
monchi2


# AFC avec FactoMiner
library(FactoMineR)

## Réalisation et stockage de l'AFC
monAFC <- CA(tab)

## Inertie par axe
iner<-monAFC$eig
iner

## Contrib langues
ctr_lang<-monAFC$col$contrib
ctr_lang[,1:4]

## Coord langues
coo_lang<-monAFC$col$coord
coo_lang[,1:4]

## Quali langues
qua_lang<-monAFC$col$cos2
qua_lang[,1:4]


## Contrib dept
ctr_dept<-monAFC$row$contrib
ctr_dept[,1:4]

## Coord dept
coo_dept<-monAFC$row$coord
coo_dept[,1:4]

## Quali dept
qua_dept<-monAFC$dept$cos2
qua_dept[,1:4]

# Graphiques jolis
plot.CA(x=monAFC,
        axes = c(1,2),
        autoLab = "yes")

plot.CA(x=monAFC,
        axes = c(3,4),
        autoLab = "yes")


# CAH sur coord factorielles

## Classification langues

HCPC(res=monAFC,cluster.CA = "columns",nb.clust = 5)


## Classification département

HCPC(res=monAFC,cluster.CA = "rows",nb.clust = 3)


