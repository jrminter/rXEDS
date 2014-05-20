#' The \code{"ROI"} class is used to set up a region of interest for simple integration and peak summing.
#'
#' It can be created by the ROI function or directly.
#' 
#' \section{Slots}{
#'   \describe{
#'     \item{elements}{A character string of elements.}
#'     \item{start}{A vector of starting.}
#'     \item{end}{A vector of ending.}
#'    }
#' }
#' @name ROI-class
#' @rdname ROI-class
#' @exportClass ROI

setClass("ROI",
         representation(elements="character",start="vector",end="vector"))