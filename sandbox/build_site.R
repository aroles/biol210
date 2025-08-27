# Authors@R: person("Prof. A. Roles", email = "", role = c("aut", "cre"))

# remotes::install_github("aroles/biol210")
# run above if updated R otherwise package will not be found
# also install any packages needed, check ps7key

pkgdown::build_site_github_pages()

base_sheets <- file.path(here::here(), 'sheets')
articles_sheets <- file.path(here::here(), 'docs', 'articles', 'sheets')

fs::dir_copy(base_sheets, articles_sheets)
