# SDM Outputs 
---
## Niche Overlap Analysis
---
## Niche overlap results (CSV)
 
| File | Description |
|---|---|
| `D.niche.csv` | Schoener's D niche overlap for the 8 species, lower triangle only (the rest is NA). |
| `I.niche.csv` | Warren's I niche overlap, same layout. |
| `D.niche_full.csv` | The D matrix filled in symmetrically, with 1s on the diagonal. Use this one for the phylogenetic comparison. |
| `I.niche_full.csv` | The same for I. |
 
## Variable importance (CSV)
 
| File | Description |
|---|---|
| `variable_importance_long.csv` | One row per species and bioclim variable, with percent contribution and permutation importance. |
| `variable_contribution_wide.csv` | The same data as a species-by-variable table. `NA` means the variable was dropped by VIF selection; `0` means it was in the model but contributed nothing. |
 
## Scripts (R)
 
| File | Description |
|---|---|
| `agg.R` | Aggregates each species' suitability raster 5x (about 858 m to about 4.3 km) so the overlap analysis fits in memory. |
| `analysis.R` | Stacks the aggregated rasters and computes D and I with `calc.niche.overlap()`. |
| `clim.R` | Builds the variable importance tables above. |
| `phylocomp.R` | Phylogenetic comparison of niche overlap (in progress). |
 
## Raster files (GeoTIFF), `agg_out/`
 
One projected-suitability raster per species, aggregated 5x from each species' `_projection_cloglog.tif`:
 
- `Archibasis_crucigera.tif`
- `Archibasis_incisura.tif`
- `Archibasis_melanocyana.tif`
- `Archibasis_mimetes.tif`
- `Archibasis_oscillans.tif`
- `Archibasis_rebeccae.tif`
- `Archibasis_tenella.tif`
- `Archibasis_viola.tif`
 
