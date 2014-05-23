#' ReadDataCube
#' 
#' Read in a hyperspectral data cube in the Lispix .raw/.rpl file format.
#'
#' @param rplFile A file path to a Lispix \code{.rpl} file. Defaults
#' to a file chooser.
#' 
#' @param data.what The data type. Defaults to \code{integer}.
#' 
#' @param record.by.image A logical. Defaults to \code{TRUE}.
#' 
#' @param example.spec A logical to load an example spec. Defaults to \code{TRUE}.
#'
#' @return A datacube object object
#'
#' @keywords keywords
#'
#' @export
ReadDataCube <- function(rplFile=tk_choose.files(caption="Choose RPL File"),
                         data.what="integer", record.by.image=TRUE,
                         example.spec=TRUE){
  to.read <- file(rplFile,"rb")
  rpl <- read.table(rplFile,header=TRUE)
  pixelsX <- as.integer(as.character((rpl$value[which(rpl$key=="width")])))
  pixelsY <- as.integer(as.character((rpl$value[which(rpl$key=="height")])))
  NumImages <- as.integer(as.character((rpl$value[which(rpl$key=="depth")])))
  data.length <- as.integer(as.character((rpl$value[which(rpl$key=="data-length")])))
  data.type<-as.character((rpl$value[which(rpl$key=="data-type")]))
  if (data.type=="unsigned") data.type=FALSE else data.type=TRUE
  byte.order <- as.character((rpl$value[which(rpl$key=="byte-order")]))
  if (byte.order=="big-endian") byte.order="big" else byte.order="little"	
  PixelVectors <- pixelsX*pixelsY	#Number of pixels in images
  TotalValues = (pixelsX*pixelsY*NumImages)
  to.read = file(sub(".rpl",".raw",rplFile),"rb")
  Data <- readBin(to.read, what=data.what, n=TotalValues ,size=data.length,
                  endian=byte.order, signed=data.type)
  if (record.by.image==FALSE){
    mydim <- c(NumImages, pixelsX, pixelsY)
    dim(Data) <- mydim
  }
  if (record.by.image==TRUE){
    mydim <- c(pixelsX, pixelsY, NumImages)
    dim(Data) <- mydim
  }
  myexample <- new("Spectrum")
  if (example.spec==TRUE){
    myexample <- SingleMSA(spec=tk_choose.files(caption="Choose an example .msa file for this datacube"))
  }
  final<-new("DataCube", data=Data, example.spec=myexample, dimensions=mydim, 
             rawfile=as.character(to.read), record.by.image=record.by.image)
  close(to.read)
  return(final)
}
