# Authors@R: person("Prof. A. Roles", email = "", role = c("aut", "cre"))

 # remotes::install_github("aroles/biol210")
# run above if updated R otherwise package will not be found
# also install any packages needed, check ps7key
 # pkgs remotes, pkgdown, here, gt, kableExtra

library(here)
library(fs)
library(pkgdown)

# remember to knit to html before running the below; if knit to word then you may have character conversion issues

# pkgdown::build_site_github_pages()
# 
# base_sheets <- file.path(here::here(), 'sheets')
# articles_sheets <- file.path(here::here(), 'docs', 'articles', 'sheets')
# 
# fs::dir_copy(base_sheets, articles_sheets)

# 1. Rebuild only changed files without wiping the docs directory
pkgdown::build_site_github_pages(clean = FALSE, lazy = TRUE)

# 2. Sync sheets only if the source directory is newer than the target
base_sheets <- here::here('sheets')
articles_sheets <- here::here('docs', 'articles', 'sheets')

if (!dir_exists(articles_sheets) || 
    file_info(base_sheets)$modification_time > file_info(articles_sheets)$modification_time) {
      dir_copy(base_sheets, articles_sheets, overwrite = TRUE)
}
