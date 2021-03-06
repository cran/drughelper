#' Drughelper Internal Functions
#'
#' @keywords internal
#' @name InternalFunctions
#' @import readr
#' @importFrom utils data
#' @return Internal outputs, called for side effects
#'

#' @rdname InternalFunctions
gittsv <- function() {


  requireNamespace("readr")
  dhdrugs <- read_delim("https://raw.githubusercontent.com/jaaaviergarcia/drughelper/main/dhdrugs.tsv",
                        "\t", escape_double = FALSE, trim_ws = TRUE)

  singleDrugSynonymsChembl<-c()
  load(paste0(tempdir(), "/singleDrugSynonymsChembl.rda"), envir = environment())

  for (i in 1:nrow(dhdrugs)){
    dhdrugs$synonyms[i] <- toupper(dhdrugs$synonyms[i])
  }

  dhdrugs$synonymsChembl <- singleDrugSynonymsChembl$Drug_synonyms


  for (j in 1:nrow(dhdrugs)){
    if (is.na(dhdrugs$synonyms[j]))
      dhdrugs$synonyms[j] <- dhdrugs$synonymsChembl[j]
    else
      dhdrugs$synonyms[j] <- paste(dhdrugs$synonymsChembl[j], dhdrugs$synonyms[j], sep=";;;")
  }

  dhdrugs <- dhdrugs[,-7]

  for (k in 1:nrow(dhdrugs)){

    vaux <- strsplit(dhdrugs$synonyms[k], ";;;")[[1]]
    vaux <- unique(vaux)
    dhdrugs$synonyms[k] <- paste(vaux, collapse = ";;;")

  }
  source("./R/AuxFunctions.R")
  dhdrugs <- updateTable(dhdrugs)

  dhdrugs$DrugHelper <- paste0("DH0",1:nrow(dhdrugs))

  dhdrugs <- subset(dhdrugs, select = c(8,2,1,4,5,6,7,3))


}



#' @rdname InternalFunctions
updateTable <- function(dhdrugs){

  for (i in 1:nrow(dhdrugs)){

    aux <- gsub("[[:blank:]]", "", dhdrugs$synonyms[i])
    dhdrugs$synonyms_formatted[i] <- gsub("[^[:alnum:];]", "", aux)

  }
  return(dhdrugs)

}


