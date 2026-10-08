files <- list.files("SDM_outputs", pattern = "_variableImportance\\.csv$",
                    recursive = TRUE, full.names = TRUE)
vi <- do.call(rbind, lapply(files, function(f) {
  d <- read.csv(f)
  d$species <- sub("_variableImportance\\.csv$", "", basename(f))
  d
}))
write.csv(vi, "variable_importance_long.csv", row.names = FALSE)

# species x variable table of percent contribution
wide <- reshape(vi[, c("species", "variable", "percent.contribution")],
                idvar = "species", timevar = "variable", direction = "wide")
names(wide) <- sub("percent.contribution.", "", names(wide), fixed = TRUE)
write.csv(wide, "variable_contribution_wide.csv", row.names = FALSE)

# temperature vs precipitation (bio_1-11 temperature, bio_12-19 precipitation)
num <- as.numeric(sub("bio_", "", vi$variable))
vi$type <- ifelse(num <= 11, "temperature", "precipitation")
aggregate(percent.contribution ~ species + type, data = vi, FUN = sum)