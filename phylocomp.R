D <- as.matrix(read.csv("D.niche.csv", row.names = 1))
D[upper.tri(D)] <- t(D)[upper.tri(D)]
diag(D) <- 1
write.csv(D, "D.niche_full.csv")

I <- as.matrix(read.csv("I.niche.csv", row.names = 1))
I[upper.tri(I)] <- t(I)[upper.tri(I)]
diag(I) <- 1
write.csv(I, "I.niche_full.csv")