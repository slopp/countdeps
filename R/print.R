


ui_check <- function(...) {
  phrase <- do.call(paste, list(...))
  cat(paste(crayon::green(clisymbols::symbol$tick), phrase, sep = " "))
  cat("\n")
}

ui <- function(phrase) {
  cat(paste(crayon::red(clisymbols::symbol$circle)), phrase, sep = " ")
  cat("\n")
}

#' @param all  A data frame with columns 'names' and 'versions'
#' @param toplevel A vector of package names
print_results <- function(all, toplevel) {
  tot <- nrow(all)
  top <- length(toplevel)
  deps <- nrow(all) - length(toplevel)
  ui_check(
    "Found",
    crayon::green(top),
    "top-level package dependencies and ",
    crayon::blue(deps),
    "implied package dependencies for a total",
    crayon::red(tot),
    "dependencies!"
  )
  cat("\n")
  ui_check("Using packages from:", .libPaths())
  cat("\n")
  toplevelpkgs <- all[(all$names %in% toplevel),]
  deps <- all[!(all$names %in% toplevel),]
  print_pkgs(toplevelpkgs, "green")
  cat("\n")
  print_pkgs(deps, "blue")
}

print_pkgs <- function(pkgs, color) {
  style <- crayon::make_style(color)
  cat(style(
    paste(
      stringr::str_pad(pkgs$names,15, side = "right"),
      stringr::str_pad(pkgs$version, 4),
      collapse = "\n")
  ))
}
