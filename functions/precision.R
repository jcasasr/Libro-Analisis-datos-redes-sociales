# Compute Precision value
#
PrecisionScore <- function(l1, l2) {
  logdebug("Computing precision #l1 = %d and #l2 = %d", length(l1), length(l2));
  
  # create table
  t <- array(data=NA, dim=c(length(l1), length(l2)));
  
  # inform table
  #logdebug("Creating table...");
  for(i in 1:length(l1)) {
    for(j in 1:length(l2)) {
      t[i, j] <- length(intersect(l1[[i]], l2[[j]])); 
    }
  }
  
  # search max coincidence
  #logdebug("Matching pairs...");
  p <- 0;
  while(max(t)>=0) {
    maxs <- which(t==max(t), arr.ind=TRUE);
    
    if(is.array(max)) {
      # hi ha varis maxims, seleccionar el mes adequat
      max_i <- max[1,1];
      max_j <- max[1,2];
      max_val <- max(t[max_i, -max_j]);
      for(r in 1:nrow(max)) {
        tmp_i <- max[1,1];
        tmp_j <- max[1,2];
        tmp_val <- max(t[tmp_i, -tmp_j]);
        if(tmp_val > max_val) {
          max_i <- tmp_i;
          max_j <- tmp_j;
          max_val <- tmp_val;
        }
      }
    } else {
      # nomes hi ha un maxim
      max_i <- maxs[1,1];
      max_j <- maxs[1,2];
    }
    # sum
    p <- p + t[max_i, max_j];
    
    #logdebug("Matching %d-%d = %d", max_i, max_j, t[max_i, max_j]);
    
    # remove
    t[max_i, ] <- -1;
    t[, max_j] <- -1;
  }
  
  # compute precision value
  total <- 0;
  for(i in 1:length(l1)) {
    total <- total + length(l1[[i]]);
  }
  
  precision <- p / total;
  logdebug("Precision value = %f [%s / %s]", precision, p, total);
  
  return(precision);
}