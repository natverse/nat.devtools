#' Setup pkgdown according to natverse conventions
#'
#' @param config_file The name of the pkgdown config file (default
#'   \code{"_pkgdown.yml"})
#' @param github Whether to use github to build the pkgdown site (default
#'   \code{TRUE})
#'
#' @return a \code{list} describing the pkgdown config
#' @export
nat_setup_pkgdown <- function(config_file = "_pkgdown.yml", github=TRUE) {
  f=usethis::proj_path(config_file)
  if(!file.exists(f)){
    usethis::ui_done("Setting up pkgdown with {ui_code('usethis::use_pkgdown()')}")
    if(github)
      usethis::use_pkgdown_github_pages()
    else
      usethis::use_pkgdown()
  }
  y=yaml::read_yaml(f)
  if(is.null(y$navbar))
    y$navbar <- pkgdown::template_navbar(usethis::proj_get())$navbar
  else {

    if(is.null(y$navbar$structure$right) || is.null(y$navbar$components)){
      usethis::ui_todo("Please upgrade your pkgdown navbar structure with',
                       ' {ui_code('pkgdown::template_navbar()')}")
      return(invisible())
    }
  }
  y$navbar$structure$right=union("natverse", y$navbar$structure$right)
  y$navbar$components$natverse=list(text = "natverse", href = "https://natverse.github.io")

  help=usethis::proj_path('.github/SUPPORT.md')
  if(!file.exists(help)) {
    usethis::ui_done("Setting up help file with {ui_code('use_nat_support()')}")
    use_nat_support()
  }
  if(file.exists(help) && !'help' %in% unlist(y$navbar$structure)) {
    y$navbar$structure$left=append(y$navbar$structure$left, 'help')
    y$navbar$components$help <- list(text = "Help", href = "SUPPORT.html")
  }
  usethis::write_over(f, yaml::as.yaml(y))
  invisible(y)
}
