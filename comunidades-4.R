# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
karate <- read.graph(file="http://networkdata.ics.uci.edu/data/karate/karate.gml", format="gml");

# ejecutar agoritmo Infomap
com <- cluster_infomap(karate);
# asignar el color a cada comunidad y pintar los nodos
colbar <- rainbow(max(com$membership));
V(karate)$color <- colbar[com$membership];
# mostrar el grafo con las comunidades
plot(karate, vertex.label.dist=0);






#############
### Plots ###
load("data/layout-karate.RData");

setEPS();
postscript("plots/karate-community-infomap.eps", width=8.0, height=8.0, pointsize=14);
par(mar=c(1, 1, 1, 1));
plot(karate, layout=layout, vertex.label.family="Helvetica");
dev.off();
