####################################
##                                ##
##    variantscanR R scipt        ##
##        manuscript              ##
##                                ##
####################################

# DOG 1
#######

# upload vcf file
require(dplyr)
library(variantscanR)
vcf <- vcfscanneR("variantscanR_raw_full_dataset.rename.vcf.gz", "Dog1")

# change chromosome notation
vcf_chr <- chromosomenameR(vcf,dog_chromosome_names)

# create annotation files
data("dog_BED_NCBI", package = "variantscanR")
data("dog_allfields_NCBI", package = "variantscanR")
BED_file_fully_annotated <- annotateR_NCBI(dog_BED_NCBI,dog_allfields_NCBI)

# process omia file
data("final_omia_dataset", package = "variantscanR")
refseq <- "CanFam3.1"
organism <- BSgenome.Cfamiliaris.UCSC.canFam3
variant_file_processed_1 <- pRocess(final_omia_dataset, BED_file_fully_annotated, refseq, QC = TRUE, organism, OMIA = TRUE)

# filter sample
require(stringr)
report <- variantfiltR(vcf_chr, variant_file_processed_1, BED_file_fully_annotated, "Labrador retriever")

# DOG 2
#######

# upload vcf file
require(dplyr)
library(variantscanR)
vcf <- vcfscanneR("variantscanR_raw_full_dataset.rename.vcf.gz", "Dog2")

# change chromosome notation
vcf_chr <- chromosomenameR(vcf,dog_chromosome_names)

# filter sample
require(stringr)
report <- variantfiltR(vcf_chr, variant_file_processed_1, BED_file_fully_annotated, "Labrador retriever")

# DOG 3
#######

# upload vcf file
require(dplyr)
library(variantscanR)
vcf <- vcfscanneR("variantscanR_raw_full_dataset.rename.vcf.gz", "Dog3")

# change chromosome notation
vcf_chr <- chromosomenameR(vcf,dog_chromosome_names)

# filter sample
require(stringr)
report <- variantfiltR(vcf_chr, variant_file_processed_1, BED_file_fully_annotated, "Labrador retriever")

# DOG 4
#######

# upload vcf file
require(dplyr)
library(variantscanR)
vcf <- vcfscanneR("variantscanR_raw_full_dataset.rename.vcf.gz", "Dog4")

# change chromosome notation
vcf_chr <- chromosomenameR(vcf,dog_chromosome_names)

# filter sample
require(stringr)
report <- variantfiltR(vcf_chr, variant_file_processed_1, BED_file_fully_annotated, "Labrador retriever")


# DIVERSITY

Breed <- c('Labrador retriever', 'Labrador retriever', 'Labrador retriever', 'Labrador retriever')
Breed <- as.data.frame(Breed)

diversity <- diveRsity("variantscanR_raw_full_dataset.rename.vcf.gz", Breed, "Dog1")

