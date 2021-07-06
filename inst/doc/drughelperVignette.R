## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval= FALSE-------------------------------------------------------------
#  install.packages("drughelper")
#  

## ---- eval=TRUE---------------------------------------------------------------
library(drughelper)

vectorofdrugs <- c("Procaine", "Furazosin", "Embelin", "NotADrug")

## ---- eval=FALSE--------------------------------------------------------------
#  downloadAbsentFile()
#  

## ---- eval = FALSE------------------------------------------------------------
#  checkDrugSynonym(vectorofdrugs)
#  

## ---- eval = TRUE, echo = FALSE, message = FALSE------------------------------
library(PharmacoGx)
library(drughelper)

data("GDSCsmall")
data("CCLEsmall")
data("CMAPsmall")

vector_CCLE <- rownames(CCLEsmall@drug)
vector_GDSC <- rownames(GDSCsmall@drug)
vector_CMAP <- rownames(CMAPsmall@drug)

# DRUG RESPONSES (BeatAML)
load("../data/drugResponse.rda")

vDrugResponse <- Drug_response$inhibitor
vBeatAML<- unique(vDrugResponse)

table_CCLE <- checkDrugSynonym(vector_CCLE)
table_GDSC <- checkDrugSynonym(vector_GDSC)
table_CMAP <- checkDrugSynonym(vector_CMAP)
table_BEAT <- checkDrugSynonym(vBeatAML)

## ---- eval = TRUE, message = FALSE--------------------------------------------
head(checkDrugSynonym(vector_CCLE))
head(checkDrugSynonym(vector_GDSC))
head(checkDrugSynonym(vector_CMAP))
head(checkDrugSynonym(vBeatAML))


