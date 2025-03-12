#' `base_match()`
#'
#' A base-R approximation of dplyr's `case_match()`. Unlike `case_match()`, `base_when()` returns a factor. The levels will be ordered according to the order included in `codebook`.
#' @param original_variable the original variable
#' @param codebook the codebook, specified as a named vector in "label=level" format, with the levels listed in the desired order
#'
#' @returns a factor
#' @export
#'
#' @examples
#' dmdborn4_codebook<-c('USA'=1,'Other'=2)
#' ii$country<-base_match(ii$dmdborn4,dmdborn4_codebook)
base_match<-function(original_variable,codebook){
  
  # define the new variable
  new_variable<-factor(old_variable,codebook,names(codebook))

  # return the object
  new_variable
  
}