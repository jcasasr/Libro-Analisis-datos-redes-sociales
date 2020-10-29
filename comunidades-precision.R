# carga de la libreria
library(igraph);

# sources
source('functions/precision.R');
source('functions/log.R');

# carga del grafo usado en las demostraciones
karate <- read.graph(file="http://networkdata.ics.uci.edu/data/karate/karate.gml", format="gml");

# split final del conjunto (Zachary:1977:JAR)
final <- c(1,1,1,1,1,1,1,1,1,2,1,1,1,1,2,2,1,1,2,1,2,1,2,2,2,2,2,2,2,2,2,2,2,2);
colbar <- rainbow(max(final));
V(karate)$color <- colbar[final];
load("data/layout-karate.RData");

setEPS();
postscript("plots/karate-community-zachary.eps", width=8.0, height=8.0, pointsize=14);
par(mar=c(1, 1, 1, 1));
plot(karate, layout=layout, vertex.label.family="Helvetica");
dev.off();

# ejecutar algoritmo Girvan-Newman
test_ebc <- cluster_edge_betweenness(karate)$membership;
PrecisionScore(test_ebc, final);
test_ebc[test_ebc==3] <- 1; # 3 -> 1
test_ebc[test_ebc==4] <- 2; # 4 -> 2
PrecisionScore(test_ebc, final);
which(test_ebc != final);

# ejecutar algoritmo propagacion etiquetas
test_lpa <- cluster_label_prop(karate)$membership;
PrecisionScore(test_lpa, final);
which(test_lpa != final);

# ejecutar agoritmo leading eigenvector
test_lec <- cluster_leading_eigen(karate)$membership;
PrecisionScore(test_lec, final);
test_lec[test_lec==3] <- 1; # 3 -> 1
test_lec[test_lec==4] <- 2; # 4 -> 2
PrecisionScore(test_lec, final);
which(test_lec != final);

# ejecutar agoritmo Infomap
test_infomap <- cluster_infomap(karate)$membership;
PrecisionScore(test_infomap, final);
test_infomap[test_infomap==3] <- 2; # 3 -> 1
PrecisionScore(test_infomap, final);
which(test_infomap != final);
