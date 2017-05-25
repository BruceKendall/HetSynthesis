Rmd2pdf <- function(arg) {
    require(knitr)
    argrmd <- paste(arg, ".Rmd", sep="")
    filemd <- paste(arg, ".md", sep="")
    filepdf <- paste(arg, ".pdf", sep="")
    knit(argrmd)
    pandoc(filemd, format="latex")
    system(paste("open ", filepdf))
}
