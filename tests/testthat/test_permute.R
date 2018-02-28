library(testthat)
library(rsample)
library(purrr)

test_that('default param', {
  set.seed(11)
  rs1 <- permute(iris, Species)
  sizes1 <- rsample:::dim_rset(rs1)

  expect_true(all(sizes1$analysis == nrow(iris)))
  expect_true(all(sizes1$assessment == 0))
  same_data <-
    map_lgl(rs1$splits, function(x)
      all.equal(x$data, iris))
  expect_true(all(same_data))

  data_perm <-
    map_lgl(rs1$splits, function(x)
      isTRUE(all.equal(analysis(x)$Species, iris$Species)))

  expect_true(all(!data_perm))

  good_holdout <- map_lgl(rs1$splits,
                          function(x) {
                            length(intersect(x$in_ind, x$out_id)) == 0
                          })
  expect_true(all(good_holdout))
})



test_that('bad args', {
  expect_error(permute(iris))
  expect_error(permute(iris, some_var))
})

test_that('printing', {
  expect_output(print(permute(mtcars, mpg)))
})


test_that('rsplit labels', {
  rs <- permute(mtcars, mpg)
  all_labs <- map_df(rs$splits, labels)
  original_id <- rs[, grepl("^id", names(rs))]
  expect_equal(all_labs, original_id)
})

