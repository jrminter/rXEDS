#' The \code{"Spectrum"} class creates the primary object for EDS data.
#'
#' It is created by the SingleMSA function.  It assumes 20 keV 
#' accelerating voltage and 10.0 nA of probe current unless
#' otherwise specified.
#'
#'  \section{Slots}{
#'    \describe{
#'      \item{title}{A character string title.}
#'
#'      \item{npoints}{An integer specifying the number of points.}
#' 
#'      \item{xunits}{A string, typically 'eV'.}
#'    
#'      \item{xperchan}{A numeric, typically '10.0'.}
#'    
#'      \item{offset}{A numeric, zero offset.}
#'    
#'      \item{beamkv}{A numeric, beam kv.}
#'    
#'      \item{probecur}{A numeric, probe current in nA.}
#'    
#'      \item{livetime}{A numeric, live time in sec.}
#'    
#'      \item{realtime}{A numeric, real time in sec.}
#'    
#'      \item{spectrum}{A vector of data values.}
#'    
#'      \item{composition}{A numeric, composition?.}
#'    
#'      \item{elements}{A string.}
#'    
#'      \item{net.counts}{A numeric, net counts.}
#'    
#'      \item{identity}{A character, whatever.}
#'    
#'      \item{position}{A numeric, specimen psoition.}
#'    }
#'  }
#' @name Spectrum-class
#' @rdname Spectrum-class
#' @exportClass Spectrum
 
setClass("Spectrum", 
         representation(title="character", npoints="numeric",
                        ncolumns="numeric", xunits="character",
                        xperchan="numeric", offset="numeric",
                        beamkv="numeric", probecur="numeric",
                        livetime="numeric", realtime="numeric",
                        spectrum="vector", composition="numeric",
                        elements="character", net.counts="numeric",
                        identity="character", position="numeric"),
         prototype = prototype(probecur=1.0, beamkv=20.0))
