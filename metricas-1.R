# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
karate <- read.graph(file="http://networkdata.ics.uci.edu/data/karate/karate.gml", format="gml");
# generacion del grafico
plot(karate, layout=layout.fruchterman.reingold(karate));

degree(karate, v=c(1,17,28), normalized=TRUE);
betweenness(karate, v=c(1,17,28), normalized=TRUE);
closeness(karate, v=c(1,17,28), normalized=TRUE);


#############
### Plots ###
load("data/layout-karate.RData");

setEPS();
postscript("plots/karate.eps", width=8.0, height=8.0, pointsize=14);
par(mar=c(1, 1, 1, 1));
plot(karate, layout=layout, vertex.label.family="Helvetica");
dev.off();