# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
karate <- read.graph(file="http://networkdata.ics.uci.edu/data/karate/karate.gml", format="gml");

# lista de algoritmos a testear
modularity(edge.betweenness.community(karate))
modularity(multilevel.community(karate))
modularity(leading.eigenvector.community(karate));
modularity(infomap.community(karate));
modularity(walktrap.community(karate));
