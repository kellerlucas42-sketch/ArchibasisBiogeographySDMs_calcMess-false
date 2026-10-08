library(terra)
library(ENMeval)

agg_files <- list.files("agg_out", pattern = "\\.tif$", full.names = TRUE)
models <- rast(agg_files)
names(models) <- tools::file_path_sans_ext(basename(agg_files))

models        # check: 8 layers, one shared extent and resolution
nlyr(models)  # should be 8
ncell(models) # about 6.9 million if you aggregated by 5

D.niche <- calc.niche.overlap(models, "D", quiet = TRUE)
write.csv(D.niche, "D.niche.csv")

I.niche <- calc.niche.overlap(models, "I", quiet = TRUE)
write.csv(I.niche, "I.niche.csv")