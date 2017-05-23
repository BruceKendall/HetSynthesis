knitpdf <- function(fname){
    require(knitr)
    require(markdown)

#   Aliases for .md, .html, and .pdf files
    inRmd <- paste(fname,".Rmd",sep="")
    inmd <- paste(fname,".md",sep="")
    inhtml <- paste(fname,".html",sep="")
    inpdf <- paste(fname,".pdf",sep="")
#
#   Make the documents
    knit(inRmd)
    markdownToHTML(inmd, inhtml, options=c("use_xhml"))
    pandoc(inhtml, format='latex')
}
