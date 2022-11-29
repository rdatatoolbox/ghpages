#' ghpages: Deploy HTML Files on GitHub Pages
#' 
#' @description 
#' Example to show how to deploy HTML files on GitHub Pages.
#' 
#' @author Nicolas Casajus \email{nicolas.casajus@fondationbiodiversite.fr}
#' 
#' @date 2022/11/29



## Install Dependencies (listed in DESCRIPTION) ----

remotes::install_deps(upgrade = "never")


## Load Project Addins (R Functions and Packages) ----

pkgload::load_all()


## Global Variables ----

data(penguins, package = "palmerpenguins")

species <- as.character(unique(penguins$"species"))


## Knit homepage ----

rmarkdown::render(input = "index.Rmd", params = list(sp_names = species))


## Knit species pages ----

for (i in 1:length(species)) {
  
  rmarkdown::render(input       = here::here("species", "template.Rmd"), 
                    output_file = paste0(tolower(species[i]), ".html"),
                    output_dir  = here::here("species"),
                    params      = list(sp_name = species[i]))
}
