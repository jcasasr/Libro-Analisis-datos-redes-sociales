# carga de la libreria
library(igraph);

# carga del grafo usado en las demostraciones
g <- read.graph(file="~/Dropbox/Research/Datasets/caida-2007/caida2007.gml", format="gml");

# plot log-log scale
dd <- degree.distribution(g, normalized=FALSE, cumulative=FALSE);
dd <- dd * length(degree(g));
  
setEPS();
postscript("plots/power-law-log.eps", width=6.0, height=4.0, pointsize=12);
par(mar=c(4, 5, 1, 1));
plot(dd, type='p', log='xy', col="red", family="Helvetica", main='', xlab='Grado', ylab='Frecuencia', yaxt="n", xaxt='n', cex.lab=1.2, cex.axis=1.2, cex.main=1.2, cex.sub=1.2);
axis(1, c(10^0,10^1,10^2,10^3,10^4), cex.axis=1.2) # length(degree.distribution(caida2007))
axis(2, c(10^0,10^1,10^2,10^3,10^4), cex.axis=1.2) # max(degree(caida2007))
dev.off();
