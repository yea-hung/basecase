#' `base_match()`
#'
#' A base-R approximation of dplyr's `case_match()`. Unlike `case_match()`, `base_when()` returns a factor. The levels will be ordered according to the order included in `codebook`.
#' @param original_variable the original variable
#' @param codebook the codebook, specified as a named vector, with each element in `'label'=level` format, with the levels listed in the desired order
#'
#' @returns a factor
#' @export
#'
#' @examples
#' ii$country<-base_match(ii$dmdborn4,c('USA'=1,'Other'=2))
base_match<-function(original_variable,codebook){

  # define the new variable
  new_variable<-factor(original_variable,codebook,names(codebook))

  # return the object
  new_variable

}
