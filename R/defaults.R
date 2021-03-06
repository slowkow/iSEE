#' @name defaults 
#' @aliases redDimPlotDefaults
#' @aliases geneExprPlotDefaults
#' @aliases colDataPlotDefaults 
#' @aliases geneStatTableDefaults
#'
#' @title Parameter defaults 
#'
#' @description Create default settings for various panels in the iSEE interface.
#'
#' @param se A SingleCellExperiment object.
#' @param number An integer scalar, specifying the maximum number of 
#' panels of the corresponding type that can be added to the interface.
#'
#' @section Reduced dimension plot parameters:
#' \describe{
#' \item{\code{Type}:}{Integer, which entry of \code{reducedDims(se)} should be shown?
#' Defaults to 1, i.e., the first entry.
#' We use an index rather than the name, as the latter may not be unique.
#' }
#' \item{\code{XAxis}:}{Integer, which component should be shown on the x-axis?
#' Defaults to 1.}
#' \item{\code{YAxis}:}{Integer, which component should be shown on the y-axis?
#' Defaults to 2.}
#' }
#'
#' @section Gene expression plot parameters:
#' \describe{
#' \item{\code{GeneTable}:}{Character, what gene statistic table should be used to choose a gene to display on the y-axis?
#' Defaults to an empty string, which means that the first available table will be used.}
#' \item{\code{Assay}:}{Integer, which assay should be used to supply the expression values shown on the y-axis?
#' Defaults to 1, i.e., the first assay in \code{se}.
#' We use an index rather than the name, as the latter may not be unique.}
#' \item{\code{XAxis}:}{Character, what variable should be shown on the x-axis?
#' Defaults to \code{"None"}.}
#' \item{\code{XAxisColData}:}{Character, what column of \code{colData(se)} should be shown on the x-axis if \code{XAxis="Column data"}?
#' Defaults to the first entry of \code{colData(se)}.}
#' \item{\code{XAxisGeneText}:}{Character, which gene's expression should be shown on the x-axis if \code{XAxis="Gene text"}? 
#' Defaults to the name of the first row in \code{se}, using expression values specified in \code{Assay}.}
#' \item{\code{XAxisGeneTable}:}{Character, which gene statistic table should be used to choose a gene to put on the x-axis if \code{XAxis="Gene table"}? 
#' Defaults to an empty string, which means that the first available table will be used.}
#' }
#'
#' @section Column data plot parameters:
#' \describe{
#' \item{\code{YAxisColData}:}{Character, which column of \code{colData(se)} should be shown on the y-axis?
#' Defaults to the first entry of \code{colData(se)}.}
#' \item{\code{XAxis}:}{Character, what variable should be shown on the x-axis?
#' Defaults to \code{"None"}.}
#' \item{\code{XAxisColData}:}{Character, which column of \code{colData(se)} should be shown on the x-axis if \code{XAxis="Column data"}?
#' Defaults to the first entry of \code{colData(se)}.}
#' }
#'
#' @section Coloring parameters:
#' \describe{
#' \item{\code{ColorPanelOpen}:}{Logical, should the color parameter panel be open upon initialization?
#' Defaults to \code{FALSE}.}
#' \item{\code{ColorBy}:}{Character, what type of data should be used for coloring?
#' Defaults to \code{"None"}.}
#' \item{\code{ColorByColData}:}{Character, which column of \code{colData(se)} should be used for colouring if \code{ColorBy="Column data"}? 
#' Defaults to the first entry of \code{colData(se)}.}
#' \item{\code{ColorByGeneTable}:}{Character, which gene statistic table should be used to choose a gene to color by, if \code{ColorBy="Gene table"}? 
#' Defaults to an empty string, which means that the first available table will be used.}
#' \item{\code{ColorByGeneTableAssay}:}{Integer, which assay should be used to supply the expression values for colouring if \code{ColorBy="Gene table"}? 
#' Defaults to 1, i.e., the first assay in \code{se}.}
#' \item{\code{ColorByGeneText}:}{Character, which gene should be used to choose a gene to color by, if \code{ColorBy="Gene text"}? 
#' Defaults to an empty string, which means that the first available table will be used.}
#' \item{\code{ColorByGeneTextAssay}:}{Integer, which assay should be used to supply the expression values for colouring if \code{ColorBy="Gene text"}? 
#' Defaults to 1, i.e., the first assay in \code{se}.}
#' }
#'
#' @section Brushing parameters:
#' \describe{
#' \item{\code{BrushPanelOpen}:}{Logical, should the brushing parameter panel be open upon initialization?
#' Defaults to \code{FALSE}.}
#' \item{\code{BrushByPlot}:}{Character, which other plot should be used for point selection in the current plot? 
#' Defaults to an empty string, which means that no plot is used for point selection.}
#' \item{\code{BrushEffect}:}{Character, what is the effect of receiving a brush input?
#' Can be \code{"Restrict"}, where only the brushed points are shown; \code{"Color"}, where the brushed points have a different color; 
#' or \code{"Transparent"}, where all points other than the brushed points are made transparent. Defaults to \code{"Transparent"}.}
#' \item{\code{BrushColor}:}{Character, what color should be used for the brushed points when \code{BrushEffect="Color"}?
#' Defaults to \code{"red"}.}
#' \item{\code{BrushAlpha}:}{Numeric, what level of transparency should be used for the unbrushed points whe \code{BrushEffect="Transparent"}?
#' This should lie in [0, 1], where 0 is fully transparent and 1 is fully opaque. 
#' Defaults to 0.1.}
#' }
#' 
#' @section Other plot parameters:
#' \describe{
#' \item{\code{PlotPanelOpen}:}{Logical, should the plot parameter panel be open upon initialization?
#' Defaults to \code{FALSE}.}
#' \item{\code{ZoomData}:}{A list containing numeric vectors of length 4, containing values with names \code{"xmin"}, \code{"xmax"}, \code{"ymin"} and \code{"ymax"}.
#' These define the zoom window on the x- and y-axes.
#' Each element of the list defaults to \code{NULL}, i.e., no zooming is performed.}
#' }
#' 
#' @section Gene statistic table parameters:
#' \describe{
#' \item{\code{Selected}:}{Integer, containing the index of the row to be initially selected.
#' Defaults to the first row, i.e., 1.}
#' \item{\code{Search}:}{Character, containing the initial value of the search field.
#' Defaults to an empty string.}
#' \item{\code{SearchColumns}:}{A list containing character vectors of length equal to the number of columns in \code{rowData(se)},
#' specifying the initial value of the search field for each column.
#' All entries default to an empty string.}
#' }
#'
#' @return A DataFrame containing default settings for various parameters of each panel.
#'
#' @export
#'
#' @examples
#' library(scRNAseq)
#' data(allen)
#' class(allen)
#'
#' library(scater)
#' sce <- as(allen, "SingleCellExperiment")
#' counts(sce) <- assay(sce, "tophat_counts")
#' sce <- normalize(sce)
#' sce <- runPCA(sce)
#' sce
#'
#' redDimPlotDefaults(sce, number=5)
#' geneExprPlotDefaults(sce, number=5)
#' colDataPlotDefaults(sce, number=5)
#' geneStatTableDefaults(sce, number=5)
redDimPlotDefaults <- function(se, number) {
    waszero <- number==0 # To ensure that we define all the fields with the right types.
    if (waszero) number <- 1

    out <- new("DataFrame", nrows=as.integer(number))
    out[[.redDimType]] <- 1L
    out[[.redDimXAxis]] <- 1L
    out[[.redDimYAxis]] <- 2L
    
    out <- .add_general_parameters(out, se)
    if (waszero) out <- out[0,,drop=FALSE]
    return(out)
}

#' @rdname defaults 
#' @export
geneExprPlotDefaults <- function(se, number) {
    waszero <- number==0 
    if (waszero) number <- 1

    def_assay <- .set_default_assay(se)
    covariates <- colnames(colData(se))

    out <- new("DataFrame", nrows=as.integer(number))
    out[[.geneExprAssay]] <- def_assay
    out[[.geneExprXAxis]] <- .geneExprXAxisNothingTitle
    out[[.geneExprXAxisColData]] <- covariates[1] 
    out[[.geneExprXAxisGeneText]] <- ""
    out[[.geneExprXAxisGeneTable]] <- ""
    out[[.geneExprYAxisGeneText]] <- ""
    out[[.geneExprYAxisGeneTable]] <- ""
    out[[.geneExprYAxis]] <- .geneExprYAxisGeneTableTitle

    out <- .add_general_parameters(out, se)
    if (waszero) out <- out[0,,drop=FALSE]
    return(out)
}

#' @rdname defaults 
#' @export
colDataPlotDefaults <- function(se, number) {
    waszero <- number==0 
    if (waszero) number <- 1

    covariates <- colnames(colData(se))

    out <- new("DataFrame", nrows=as.integer(number))
    out[[.colDataYAxis]] <- covariates[1]
    out[[.colDataXAxis]] <- .colDataXAxisNothingTitle
    out[[.colDataXAxisColData]] <- ifelse(length(covariates)==1L, covariates[1], covariates[2])

    out <- .add_general_parameters(out, se)
    if (waszero) out <- out[0,,drop=FALSE]
    return(out)
}

#' @rdname defaults
#' @export
geneStatTableDefaults <- function(se, number) {
    waszero <- number==0 
    if (waszero) number <- 1

    out <- new("DataFrame", nrows=as.integer(number))
    out[[.geneStatSelected]] <- 1L
    out[[.geneStatSearch]] <- ""

    # Defining an empty search for each column of the rowData.
    colsearch <- character(ncol(rowData(se)))
    out[[.geneStatColSearch]] <- rep(list(colsearch), as.integer(number))

    if (waszero) out <- out[0,,drop=FALSE]
    return(out)
}

.override_defaults <- function(def, usr, can_brush=TRUE)
# Overriding the defaults with whatever the user has supplied.
{
    ndef <- nrow(def)
    nusr <- nrow(usr)
    stopifnot(ndef >= nusr) 
    replacement <- seq_len(nusr)

    for (x in colnames(usr)) {
        if (!x %in% colnames(def)) { 
            warning(sprintf("unknown field '%s' in user-specified settings", x))
            next 
        }

        # This method is safer than direct subset assignment, 
        # as it works properly for lists.
        tmp <- def[[x]]
        tmp[replacement] <- usr[[x]]
        def[[x]] <- tmp 
    }

    return(def)
}    

.add_general_parameters <- function(incoming, se) {
    def_assay <- .set_default_assay(se)
    def_cov <- colnames(colData(se))[1]

    incoming[[.plotParamPanelOpen]] <- FALSE
    incoming[[.colorParamPanelOpen]] <- FALSE
    incoming[[.brushParamPanelOpen]] <- FALSE

    incoming[[.colorByField]] <- .colorByNothingTitle
    incoming[[.colorByColData]] <- def_cov
    incoming[[.colorByGeneTable]] <- "" 
    incoming[[.colorByGeneTableAssay]] <- def_assay
    incoming[[.colorByGeneText]] <- "" 
    incoming[[.colorByGeneTextAssay]] <- def_assay

    incoming[[.brushByPlot]] <- ""
    incoming[[.brushEffect]] <- .brushTransTitle
    incoming[[.brushTransAlpha]] <- 0.1
    incoming[[.brushColor]] <- "red"
    incoming[[.brushData]] <- rep(list(NULL), nrow(incoming))

    incoming[[.zoomData]] <- rep(list(NULL), nrow(incoming))
    return(incoming)
}

.set_default_assay <- function(se) { 
    def_assay <- which(assayNames(se)=="logcounts")
    if (length(def_assay)==0L) {
        return(1L)
    } else {
        return(def_assay[1])
    }
}
