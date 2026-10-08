library(terra)

files <- list.files("SDM_outputs", pattern = "_projection_cloglog\\.tif$",
                    recursive = TRUE, full.names = TRUE)
dir.create("agg_out", showWarnings = FALSE)

for (f in files) {
  r   <- rast(f)
  sp  <- sub("_projection_cloglog\\.tif$", "", basename(f))
  agg <- aggregate(r, fact = 5, fun = "mean", na.rm = TRUE)
  writeRaster(agg, file.path("agg_out", paste0(sp, ".tif")), overwrite = TRUE)
  message(sp, " done")
}