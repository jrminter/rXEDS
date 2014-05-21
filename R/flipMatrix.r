#' Flip matrix (upside-down)
#' 
#' From http://www1.maths.lth.se/help/R/image/
#'
#' @param \code{x} input matrix.
#'
#' @return  The rotated matrix
#'
#' @keywords keywords
#'
#' @export
flip.matrix <- function(x) {
  xx <- mirror.matrix(rotate180.matrix(x))
  return(xx)
}