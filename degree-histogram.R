dh <- c(0,3,3,4,1,1);
xs <- 0:5;

setEPS();
postscript("plots/ejem-hist-grados.eps", width=6.0, height=4.0, pointsize=12);
par(mar=c(4, 5, 1, 1));
plot(x=xs, y=dh, type='b', col="red", family="Helvetica", main='', xlab='Grado', ylab='Frecuencia', cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5);
dev.off();