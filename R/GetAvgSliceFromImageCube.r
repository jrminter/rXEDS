#' GetAvgSliceFromImageCube
#'
#' Get an average slice from a vector of channels in  a  \code{DataCube} object
#'
#' @param x The datacube object.
#' 
#' @param ch A vector of channels to average.
#' 
#' @param debug A logical to print info. Default \code{FALSE}.
#'
#' @return msa A numeric matrix (ct/ch).
#'
#' @keywords keywords
#'
#' @export
GetAvgSliceFromImageCube <- function(x, ch, debug=FALSE){
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
  # change to a float and average
  storage.mode(mat) <- "numeric"
  mat <- mat/as.numeric(length(ch))
  return(mat)
}