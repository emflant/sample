
# https://www.r-bloggers.com/installing-packages-without-internet/

#' Get package dependencies
#'
#' @param packs A string vector of package names
#'
#' @return A string vector with packs plus the names of any dependencies
getDependencies <- function(packs){
  dependencyNames <- unlist(
    tools::package_dependencies(packages = packs, db = available.packages(), 
                                which = c("Depends", "Imports"),
                                recursive = TRUE))
  packageNames <- union(packs, dependencyNames)
  packageNames
}
# Calculate dependencies
packages <- getDependencies(c("tidyverse", "rmarkdown", "lubridate", 
                              "mongolite", "DBI", "readxl", 
                              "jsonlite", "xml2", "httr", 
                              "rvest"))

# file.path(getwd(), "lib", "pkgFilenames.csv")

# Download the packages to the working directory.
# Package names and filenames are returned in a matrix.
# setwd("D:/my_usb/packages/")
pkgInfo <- download.packages(pkgs = packages, destdir = file.path(getwd(), "lib"), type = "win.binary")
# Save just the package file names (basename() strips off the full paths leaving just the filename)
write.csv(file = file.path(getwd(), "lib", "pkgFilenames.csv"), 
          basename(pkgInfo[, 2]), row.names = FALSE)


# Set working directory to the location of the package files
setwd("D:/my_usb/packages/")

# Read the package filenames and install
pkgFilenames <- read.csv("pkgFilenames.csv", stringsAsFactors = FALSE)[, 1]
install.packages(pkgFilenames, repos = NULL, type = "win.binary")