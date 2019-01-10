# countdeps

The goal of countdeps is to provide a simple helper function for counting the
number of package dependencies in a project.

## Installation

You can install the development version of `countdeps`:

``` r
devtools::install_github('slopp/countdeps')
```

## Example

To count the number of dependencies, simply run this command in your project
directory:

``` r
countdeps::countdeps()
```

## Details

This package uses the [packrat](https://github.com/rstudio/packrat) package to
determine the number of packages in use by a project. Packrat accomplishes this
task using a number of hueristics that scan code looking for things like:
`library` calls.
