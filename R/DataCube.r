#' The \code{"DataCube"} class s used for hyperspectral x-ray data cubes.
#'
#' It contains a slot for an "example" spectrum, which can be used to
#' set the calibration and meta-data for the data cube.  Values of probe
#' current are in  nanoamps (nA), values of pixel spacing are micrometers
#' per pixel (um/pix) and dwell time is in seconds (s).
#'
#' \section{Slots}{
#'   \describe{
#'     \item{data}{An array of data points.}
#'     \item{example.spec}{An example spectrum (class Spectrum).}
#'     \item{dimensions}{A numeric.}
#'     \item{rawfile}{A string (path to .raw file).}
#'     \item{record.by.image}{A logical.}
#'     \item{manufacturer}{A string.}
#'     \item{classification}{A matrix.}
#'     \item{dwell.time}{A numeric, time per px in sec.}
#'     \item{pixel.spacing}{A numeric, (um/px).}
#'     \item{probecur}{A numeric (nA).}
#'     \item{roi}{An object of class ROI.}
#'     \item{sum.images}{An array.}
#'     \item{temp.frame}{A data frame.}
#'   }
#' }
#' @name DataCube-class
#' @rdname DataCube-class
#' @exportClass DataCube
setClass("DataCube",
         representation(data="array",
                        example.spec="Spectrum",
                        dimensions="numeric",
                        rawfile="character",
                        record.by.image="logical",
                        manufacturer="character",
                        classification="matrix",
                        dwell.time="numeric",
                        pixel.spacing="numeric",
                        probecur="numeric",
                        roi="ROI",
                        sum.images="array",
                        temp.frame="data.frame"),
         prototype=prototype(probecur=1.0,
                             pixel.spacing=100,
                             dwell.time=1.0))