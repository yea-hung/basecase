#' `base_when()`
#'
#' A base-R approximation of dplyr's `case_when()`. Unlike `case_when()`, `base_when()` returns a factor. The levels will be ordered according to the order included in `conditions`.
#' @param conditions conditions for defining the replacement values, specified as a named list, with each element in `'label'=logical_vector` format, with the levels listed in the desired order
#'
#' @returns a factor
#' @export
#'
#' @examples
#' nhanes$cholesterol<-base_when(list(
#'    'Desirable' = (nhanes$lbxtc<200),
#'    'Borderline high' = (nhanes$lbxtc>=200)&(nhanes$lbxtc<240),
#'    'High' = (nhanes$lbxtc>=240)
#' ))
base_when<-function(conditions){

  # define the new variable
  new_variable<-rep('',length(conditions[[1]]))

  # define the variable's groups
  for(position in 1:length(conditions)){
    new_variable[conditions[[position]]]<-names(conditions)[position]
  }

  # convert the variable to a factor
  new_variable<-factor(new_variable,levels=names(conditions))

  # return the object
  new_variable

}
