#' rotate90.matrix
#' 
#' Rotate a matrix 90 degrees clockwise.
#' 
#' From http://www1.maths.lth.se/help/R/image/
#'
#' @param x input matrix.
#'
#' @return The rotated matrix
#'
#' @keywords keywords
#'
#' @export
#' @include mirrorMatrix.r
rotate90.matrix <- function(x) {
  a <- t(mirror.matrix(x))
  return(a) 
}