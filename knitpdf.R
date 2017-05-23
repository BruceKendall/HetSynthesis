knitpdf <- function(fname){
#    require(knitr)
    require(rmarkdown)

#   Aliases for .Rmd and .pdf files
    inRmd <- paste(fname,".Rmd",sep="")
    inpdf <- paste(fname,".pdf",sep="")
#
#   Make the documents
    render(inRmd,pdf_document())
    shell.exec(inpdf)
}
