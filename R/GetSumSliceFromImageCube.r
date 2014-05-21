#' Get a sum slice from a vector of channels in  a  \code{DataCube} object
#'
#' @param \code{x}The datacube object.
#' 
#' @param \code{ch} A vector of channels to average.
#' 
#' @param \code{debug} A logical to print info. Default \code{FALSE}.
#'
#' @return \code{msa} An integer matrix (total cts/ch).
#'
#' @keywords keywords
#'
#' @export
GetSumSliceFromImageCube <- function(x, ch, debug=FALSE){
  if(debug){
    print(dim(x@data))
    print(ch)
    print(ch[1])
  }
  mat <- as.matrix(x@data[,,ch[1]])
  for(i in 2:length(ch)){
    theCh <- ch[i]
    tmp <- as.matrix(x@data[,, theCh])
    mat <- mat + tmp
  }
  return(mat)
}