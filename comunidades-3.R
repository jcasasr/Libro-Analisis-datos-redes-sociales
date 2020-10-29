# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
karate <- read.graph(file="http://networkdata.ics.uci.edu/data/karate/karate.gml", format="gml");

# ejecutar agoritmo leading eigenvector
com <- cluster_leading_eigen(karate);
# asignar el color a cada comunidad y pintar los nodos
colbar <- rainbow(max(com$membership));
V(karate)$color <- colbar[com$membership];
# mostrar el grafo con las comunidades
plot(karate, vertex.label.dist=0);
# mostrar el dendograma
dendPlot(com);





#############
### Plots ###
load("data/layout-karate.RData");

setEPS();
postscript("plots/karate-community-lec.eps", width=8.0, height=8.0, pointsize=14);
par(mar=c(1, 1, 1, 1));
plot(karate, layout=layout, vertex.label.family="Helvetica");
dev.off();

setEPS();
postscript("plots/karate-dendogram-lec.eps", width=8.0, height=8.0, pointsize=14);
par(mar=c(1, 3, 1, 1));
dendPlot(com, family="Helvetica");
dev.off();
