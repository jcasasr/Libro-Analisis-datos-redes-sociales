# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
karate <- read.graph(file="http://networkdata.ics.uci.edu/data/karate/karate.gml", format="gml");

# disposicion aleatoria
plot(karate, layout=layout_randomly(karate));
# disposicion en circulo
plot(karate, layout=layout_in_circle(karate));
# disposicion utilizando escalado multidimensional
plot(karate, layout=layout_with_mds(karate));
# disposicion basada en fuerzas del metodo GEM
plot(karate, layout=layout_with_gem(karate));





#############
### Plots ###
setEPS();
postscript("plots/representacion-1.eps", width=8.0, height=8.0, pointsize=10);
par(mar=c(1, 1, 1, 1));
par(mfrow=c(2,2));
plot(karate, layout=layout_randomly, vertex.label.family="Helvetica", main="layout_randomly");
plot(karate, layout=layout_in_circle, vertex.label.family="Helvetica", main="layout_in_circle");
plot(karate, layout=layout_with_mds, vertex.label.family="Helvetica", main="layout_with_mds");
plot(karate, layout=layout_with_gem, vertex.label.family="Helvetica", main="layout_with_gem");
dev.off();