date.time   <- function ()      { return( format(Sys.time(),"(%Y/%b/%d) %X") ) }
console.log <- function ( ... ) { cat(data.now(),...,"\n") }
