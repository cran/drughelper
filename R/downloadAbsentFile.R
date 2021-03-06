
#' @title Download data from Chembl
#' @description If it has not been downloaded yet, downloads data of drugs
#' @param dir Name of the directory where data is downloaded
#' @return A dataset of drugs downloaded in current temp directory.
#' @importFrom utils download.file
#' @export

downloadAbsentFile <- function (dir = tempdir()){

  if(!file.exists(paste0(tempdir(),"/dhdrugs.RData"))) {

    URL <- "https://raw.githubusercontent.com/jaaaviergarcia/drughelper/main/dhdrugs.RData"
    download.file(URL ,destfile = paste0(tempdir(), "/dhdrugs.RData"))
    URL2 <- "https://raw.githubusercontent.com/jaaaviergarcia/drughelper/main/singleDrugSynonymsChembl.rda"
    download.file(URL2 ,destfile = paste0(tempdir(), "/singleDrugSynonymsChembl.rda"))
  }
}



