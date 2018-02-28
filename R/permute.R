#' Permutations
#'
#' A permutation is a version of the data set where _some_ columns have been
#'  arranged in a random order. 

#'
#' @inheritParams vfold_cv
#' @param times The number of permutations. 
#' @param ... One or more selector functions to choose which
#'  variables will be randomized within the data. Unquoted variable
#'  names and `dplyr` selectors (e.g. [tidyselect::starts_with()],
#'  [tidyselect::ends_with()], [tidyselect::contains()],
#'  [tidyselect::matches()], [tidyselect::num_range()],
#'  [tidyselect::everything()], and [tidyselect::one_of()], etc.)
#'  can be used. At least one column should be specified.
#' @export
#' @return An tibble with classes `permutation`, `rset`, `tbl_df`,
#'  `tbl`, and `data.frame`. The results include a column for the
#'  data split objects and a column called `id` that has a character
#'  string with the permutation identifier.
#' @details There is no notion of an assessment set for this
#'  technique. [assessment()] will return the original data frame
#'  with no rows.
#' @examples
#' set.seed(75483)
#' 
#' permute(mtcars, mpg)
#' 
#' library(dplyr)
#' permute(iris, starts_with("Sepal"))
#' @export
#' @importFrom rlang quos !!!
#' @importFrom tidyselect vars_select
permute <-
  function(data, ..., times = 25) {
    
    perm_vars <- quos(...)
    perm_vars <- unname(vars_select(names(data), !!!perm_vars))
    if (length(perm_vars) == 0)
      stop("Please select some columns to permute", call. = FALSE)
    
    split_objs <-
      permute_splits(
        data = data,
        times = times
      )
    
    # add the variables to each rsplit for as.data.frame
    split_objs$splits <- map(split_objs$splits, add_names_to_rset, perm_vars)
    
    perm_att <- list(times = times, vars = perm_vars)
    
    new_rset(
      splits = split_objs$splits, 
      ids = split_objs$id,
      attrib = perm_att, 
      subclass = c("permutation", "rset")
    ) 
    
  }

# There is no notion of an assessment set here so always give NA
permute_complement <- function(ind, n) {
  list(analysis = ind, assessment = NA)
}

#' @importFrom purrr map 
#' @importFrom tibble tibble
permute_splits <-
  function(data, times = 25) {
    
    n <- nrow(data)
    
    indices <- purrr::map(rep(n, times), sample)
    indices <- lapply(indices, permute_complement, n = n)
    
    split_objs <-
      purrr::map(indices, make_splits, data = data, class = "permutation_split")
    list(splits = split_objs,
         id = names0(length(split_objs), "Perm"))
  }

#' @export
print.permutation <- function(x, ...) {
  cat("#", pretty(x), "\n")
  class(x) <- class(x)[!(class(x) %in% c("permutation", "rset"))]
  print(x)
}


# used in as.data.frame.rsplit
perm_col <- function(var, data, ind) {
  data[ind, var, drop = FALSE]
}

add_names_to_rset <- function(object, names) {
  attr(object, "perm_var") <- names
  object
}

