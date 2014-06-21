#' rs.plot.png
#'
#' A convenience function to plot a function to a png file in
#' directory '../png' from R studio after plotting to the screen
#' The function creates a new device, plots, and then restores the
#' old. device.
#'
#' @param pltFn A function to generate the plot.
#'
#' @param strFile The path for the file in ../png/...
#'
#' @param width The width in inches, defaults to 7.5
#'
#' @param height The height in inches, defaults to 5
#'
#' @param pts The point size to use. Defaults to 16
#'
#' @param dpi The dots per inch for the png. Defaults to 100
#'
#' @keywords keywords
#'
#' @export
rs.plot.png <- function(pltFn, strFile, width=7.5, height=5, pts=16, dpi=100){
  Sys.sleep(0.1)
  old <- dev.cur()
  dev.next()
  pngDir <- "../png"
  if (!file.exists(pngDir)) dir.create(pngDir, showWarnings = FALSE)
  if(file.exists(strFile)) file.remove(strFile)
  Sys.sleep(0.5)
  png(file=strFile, width=width*dpi, height=height*dpi, pointsize=pts)
  pltFn
  dev.off()
  dev.set(old)
}
