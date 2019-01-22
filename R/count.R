
#' Count Dependencies
#'
#' @param dir The project directory containing the code you'd like to scan for dependencies
#' @param keepLockfile Whether or not to create a packrat lock file in the directory with the identified dependencies
#' @export
countdeps <- function(dir = ".", keepLockfile = FALSE) {
  stopifnot(fs::dir_exists(dir))
  wd <- getwd()
  tryCatch({
    setwd(dir)
    ui_check("Using project:", fs::fs_path(fs::path_abs(dir)))
    create_lockfile()
    toplevel <- count_toplevel()
    all <- process_lockfile()
    if (!keepLockfile) {
      fs::dir_delete(paste0(dir, "/packrat"))
    }
    print_results(all, toplevel)
  }, error = function(e) {
    cat(crayon::red(e))
    cleanup(wd)
  }, finally = function() {
    cleanup(wd)
  })

}

cleanup <- function(wd, keepLockFile = FALSE) {
  try({
      fs::dir_delete("packrat")
  })
  setwd(wd)
}


create_lockfile <- function() {
  ui("Counting Dependencies ... Hold on, this may take a moment!")
  suppressMessages({
    packrat:::snapshotImpl(".",
                           snapshot.sources = FALSE,
                           prompt = FALSE,
                           verbose = FALSE )
  })
  ui("Almost done ...")
}

#' Determines which of the dependencies are directly
#' referenced in the user's code
#' @noRd
count_toplevel <- function() {
  packrat:::dirDependencies(getwd())
}

#' @return  A data frame with columns 'names' (package names) and 'versions' (package versions)
process_lockfile <- function() {
  pkgs <- packrat:::readLockFilePackages("packrat/packrat.lock")
  data.frame(
    names = names(pkgs),
    version = sapply(pkgs, function(l){l$version})
  )
}
