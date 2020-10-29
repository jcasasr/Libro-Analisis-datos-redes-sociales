# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
karate <- read.graph(file="http://networkdata.ics.uci.edu/data/karate/karate.gml", format="gml");

# distancia media
average.path.length(karate, directed=FALSE);
# diametro de la red
get.diameter(karate, directed=FALSE);
# coeficiente de agrupamiento
transitivity(karate);