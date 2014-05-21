#' Mirror a maxtix.
#' 
#' From http://www1.maths.lth.se/help/R/image/
#'
#' @param \code{x} input matrix.
#'
#' @return  The mirrored matrix
#'
#' @keywords keywords
#'
#' @export
mirror.matrix <- function(x) {
  xx <- as.data.frame(x)
  xx <- rev(xx)
  xx <- as.matrix(xx)
  return(xx)
}
