#' Add a Recipe to Each Split Object
#'
#' \code{add_recipe} will add a pre-defined recipe to each
#'   \code{rsplit} element of the \code{rset} object.
#'
#' @name recipes
#' @aliases recipes
#' @param rset_obj An object created by one of the resampling
#'   functions in the package (e.g. \code{vfold_cv}).
#' @param recipe,x A recipe (which is not required to be
#'   pre-prepared).
#' @param prep A logical; should the recipe be \code{prep}ed on
#'  each of the analysis sets?
#' @param split_obj An \code{rset} object as found in the
#'  \code{splits} element of \code{rsample} objects. 
#' @param ... Options to pass to \code{prep.recipe} such as
#'  \code{verbose} or \code{retain}.
#' @return \code{add_recipe} returns the same \code{rset} object
#'  with a recipe in each element of the \code{splits} column.
#'  \code{has_recipe} returns a logical.
#' @importFrom purrr map
#' @export
add_recipe <- function(rset_obj, recipe = NA, prep = TRUE, ...) {
  rset_obj$splits <- purrr::map(rset_obj$splits,
                                function(x, rec) {
                                  x$recipe <- rec
                                  x
                                },
                                rec = recipe)
  if (prep) {
    rset_obj$splits <- purrr::map(rset_obj$splits,
                                  prep_recipe,
                                  ...)
  }
  rset_obj
}

#' @rdname recipes
#' @importFrom purrr map
#' @export
remove_recipe <- function(rset_obj) {
  rset_obj$splits <- purrr::map(rset_obj$splits,
                                function(x, rec) {
                                  x$recipe <- NA
                                  x
                                })
  rset_obj
}



#' @importFrom recipes prep
prep_recipe <- function(x, ...) {
  x$recipe <- prep(
    x$recipe,
    training = as.data.frame(x, data = "analysis"),
    ...
  )
  x
}

#' @rdname recipes
#' @export
has_recipe <- function(x) {
  length(x$recipe) > 1 || !is.na(x$recipe)
}

#' @rdname recipes
#' @export
prepper <- function(split_obj, recipe, ...) {
  prep(recipe, training = analysis(split_obj, recipe = FALSE), ...)
}
# chef? dr_prepper?
