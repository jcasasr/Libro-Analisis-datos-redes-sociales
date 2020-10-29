# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
polblogs <- read.graph(file="http://networkdata.ics.uci.edu/data/polblogs/polblogs.gml", format="gml");

# mostrar solo los vertices con grado > 100
polblogs_red <- induced_subgraph(polblogs, which(degree(polblogs)>100));

# red original
plot(polblogs, layout=layout_with_fr, vertex.size=5);
# red reducida
plot(polblogs_red, layout=layout_with_fr, vertex.size=5);





#############
### Plots ###
setEPS();
postscript("plots/representacion-2.eps", width=8.0, height=4.0, pointsize=10);
par(mar=c(1, 1, 1, 1));
par(mfrow=c(1,2));
plot(polblogs, layout=layout_randomly, vertex.label="", vertex.size=5, main="Red original");
plot(polblogs_red, layout=layout_with_fr, vertex.label="", vertex.size=5, main="Red reducida");
dev.off();