# countdeps

The goal of `countdeps` is to provide a simple helper function for counting the
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

```
✔ Using project: /Users/sean/Documents/Sandbox/adverse-events
◯ Counting Dependencies ... Hold on, this may take a moment!
◯ Almost done ...
✔ Found 17 top-level package dependencies and  70 implied package dependencies for a total 87 dependencies!

✔ Using packages from: /Library/Frameworks/R.framework/Versions/3.3/Resources/library

DBI             1.0.0
DT              0.4.18
bigrquery       1.0.0
blastula        0.2.1
callr           3.1.1.9000
dbplyr          1.2.1
dplyr           0.7.7
flexdashboard   0.5.1.1
formatR          1.5
ggplot2         3.0.0.9000
ggthemes        3.4.0
knitr           1.20
openfda         1.7.0.9000
rmarkdown       1.10
shiny           1.2.0
stringr         1.3.1
tufte            0.4
BH              1.65.0-1
MASS            7.3-45
Matrix          1.2-8
R6              2.2.2
RColorBrewer    1.1-2
Rcpp            0.12.19.3
assertthat      0.2.0
backports       1.1.2
base64enc       0.1-3
bindr           0.1.1
bindrcpp        0.2.2
cli             1.0.1.9000
colorspace      1.3-2
commonmark       1.5
crayon          1.3.4
crosstalk       1.0.0
curl             3.2
dichromat       2.0-0
digest          0.6.13
downloader       0.4
evaluate        0.10.1
...
```

## Details

This package uses the [packrat](https://github.com/rstudio/packrat) package to
determine the number of packages in use by a project. Packrat accomplishes this
task using a number of hueristics that scan code looking for things like
`library` calls.
