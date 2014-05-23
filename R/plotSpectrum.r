#' Plot an MSA spectrum
#'
#' From Jeff Davis at NIST
#'
#' @param x The Spectrum object \code{x}.
#' 
#' @param ... Additional graphical argument list.
#'
#' @param yzoom A factor \code{yzoom}. To zoom y axis, default 1
#' 
#' @param maxEnergy The maximum energy to display, default 10000 ev.
#'
#' @return A plot.
#' 
#' @seealso \code{\link{plot}}
#' 
#' @export
#' @docType methods
#' @rdname spectrum-plot-methods
#'
setMethod("plot", "Spectrum", function(x,...,yzoom=1,maxEnergy=10000){
  par(mfrow=c(1,1))
  xaxis=seq(from=-abs(x@offset),
            to=(x@npoints*x@xperchan-abs(x@offset)-x@xperchan),
            by=x@xperchan)
  if (x@xunits=="keV") xaxis<-xaxis*1000
  counts=x@spectrum
  plot(x=xaxis, y=counts[1:length(xaxis)], xlab="Energy (eV)",
       ylab="Counts", main=x@title, type="l", col="red", lwd=2,
       ylim=c(0,(max(x@spectrum,na.rm=TRUE))/yzoom),
       xlim=c(0,maxEnergy))
}
)
