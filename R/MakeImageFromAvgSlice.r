#' Make an image from a matrix of channels from an average slice of a \code{DataCube} object
#'
#' @param \code{x} The matrix.
#' 
#' @param \code{gamma} The gamma for the grayscale, defaults to 1.0.
#' 
#' @param \code{...} Additional graphics parameters.
#'
#' @return none
#'
#' @keywords keywords
#'
#' @export
#' 
MakeImageFromAvgSlice <- function(x, ..., gamma=1.0){
  min <- min(x)
  max <- max(x)
  yLabels <- rownames(x)
  xLabels <- colnames(x)
  title <-c()
  # check for additional function arguments
  if( length(list(...)) ){
    Lst <- list(...)
    if( !is.null(Lst$zlim) ){
      min <- Lst$zlim[1]
      max <- Lst$zlim[2]
    }
    if( !is.null(Lst$yLabels) ){
      yLabels <- c(Lst$yLabels)
    }
    if( !is.null(Lst$xLabels) ){
      xLabels <- c(Lst$xLabels)
    }
    if( !is.null(Lst$title) ){
      title <- Lst$title
    }
  }
  # check for null values
  if( is.null(xLabels) ){
    xLabels <- c(1:ncol(x))
  }
  if( is.null(yLabels) ){
    yLabels <- c(1:nrow(x))
  }
  
  layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(4,1), heights=c(1,1))
  
  # Red and green range from 0 to 1 while Blue ranges from 1 to 0
  # ColorRamp <- rgb( seq(0,1,length=256),  # Red
  #                   seq(0,1,length=256),  # Green
  #                   seq(1,0,length=256))  # Blue
  # ColorRamp <- heat.colors(256, alpha = 1)
  # 
  # JRM use gray colors
  ColorRamp <- gray.colors(256, start=0, end=1.0, gamma=gamma)
  ColorLevels <- seq(min, max, length=length(ColorRamp))
  
  # Reverse Y axis
  reverse <- nrow(x) : 1
  yLabels <- yLabels[reverse]
  x <- x[reverse,]
  
  # Data Map
  par(mar = c(3,5,2.5,2))
  image(1:length(xLabels), 1:length(yLabels), t(x), col=ColorRamp,
        xlab="", ylab="", axes=FALSE, zlim=c(min,max), useRaster=TRUE)
  if( !is.null(title) ){
    title(main=title)
  }
  # JRM - remove labels
  # axis(BELOW<-1, at=1:length(xLabels), labels=xLabels, cex.axis=0.7)
  # axis(LEFT <-2, at=1:length(yLabels), labels=yLabels, las= HORIZONTAL<-1, cex.axis=0.7)
  
  # Color Scale
  par(mar = c(3,2.5,2.5,2))
  image(1, ColorLevels,
        matrix(data=ColorLevels, ncol=length(ColorLevels),nrow=1),
        col=ColorRamp,
        xlab="",ylab="",
        xaxt="n")
  mtext("cts/ch", side=3, line=1)
  
  layout(1)
}
