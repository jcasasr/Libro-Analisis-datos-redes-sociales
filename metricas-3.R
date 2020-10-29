# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
karate <- read.graph(file="http://networkdata.ics.uci.edu/data/karate/karate.gml", format="gml");

# valores de centralidad basada en la intermediación
ebc <- edge.betweenness(karate, directed=FALSE);
# nodes are proportional to their degree value
plot(karate, layout=layout.fruchterman.reingold(karate), edge.width=(ebc/max(ebc))*10);


#############
### Plots ###
load("data/layout-karate.RData");

setEPS();
postscript("plots/karate-ebc.eps", width=8.0, height=8.0, pointsize=14);
par(mar=c(1, 1, 1, 1));
plot(karate, layout=layout, vertex.label.family="Helvetica", edge.width=(ebc/max(ebc))*10);
dev.off();