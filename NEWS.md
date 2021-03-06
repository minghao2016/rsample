# rsample (development version)

# rsample 0.0.8

* New `manual_rset()` for constructing rset objects manually from custom rsplits (tidymodels/tune#273).

* Three new time based resampling functions have been added: `sliding_window()`, `sliding_index()`, and `sliding_period()`, which have more flexibility than the pre-existing `rolling_origin()`.
  
* Correct `alpha` parameter handling for bootstrap CI functions (#179, #184).

# rsample 0.0.7

* Lower threshold for pooling strata to 10% (from 15%) (#149).

* The `print()` methods for `rsplit` and `val_split` objects were adjusted to show `"<Analysis/Assess/Total>"` and `<Training/Validation/Total>`, respectively. 

* The `drinks`, `attrition`, and `two_class_dat` data sets were removed. They are in the `modeldata` package. 

* Compatability with `dplyr` 1.0.0.

# `rsample` 0.0.6

* Added `validation_set()` for making a single resample.

* Correct the tidy method for bootstraps (#115).

* Changes for upcoming `tibble release. 

* Exported constructors for `rset` and `split` objects (#40)

* `initial_time_split()` and `rolling_origin()` now have a `lag` parameter that ensures that previous data are available so that lagged variables can be calculated. (#135, #136)

# `rsample` 0.0.5

* Added three functions to compute different bootstrap confidence intervals. 
* A new function (`add_resample_id()`) augments a data frame with columns for the resampling identifier. 
* Updated `initial_split()`, `mc_cv()`, `vfold_cv()`, `bootstraps()`, and `group_vfold_cv()` to use tidyselect on the stratification variable.
* Updated `initial_split()`, `mc_cv()`, `vfold_cv()`, `bootstraps()` with new `breaks` parameter that specifies the number of bins to stratify by for a numeric stratification variable.


# `rsample` 0.0.4

Small maintenence release. 

## Minor improvements and fixes

 * `fill()` was removed per the deprecation warning. 
 * Small changes were made for the new version of `tibble`. 

# `rsample` 0.0.3

## New features

* Added function `initial_time_split()` for ordered initial sampling appropriate for time series data.

## Minor improvements and fixes

* `fill()` has been renamed `populate()` to avoid a conflict with `tidyr::fill()`.

* Changed the R version requirement to be R >= 3.1 instead of 3.3.3. 

* The `recipes`-related `prepper` function was [moved to the `recipes` package](https://github.com/tidymodels/rsample/issues/48). This makes the `rsample` install footprint much smaller.

* `rsplit` objects are shown differently inside of a tibble.

* Moved from the `broom` package to the `generics` package.


# `rsample` 0.0.2

* `initial_split`, `training`, and `testing` were added to do training/testing splits prior to resampling. 
* Another resampling method, `group_vfold_cv`, was added. 
* `caret2rsample` and `rsample2caret` can convert `rset` objects to those used by `caret::trainControl` and vice-versa. 
* A function called `form_pred` can be used to determine the original names of the predictors in a formula or `terms` object. 
* A vignette and a function (`prepper`) were included to facilitate using the `recipes` with `rsample`.
* A `gather` method was added for `rset` objects.
* A `labels` method was added for `rsplit` objects. This can help identify which resample is being used even when the whole `rset` object is not available. 
* A variety of `dplyr` methods were added (e.g. `filter`, `mutate`, etc) that work without dropping classes or attributes of the `rsample` objects. 

# `rsample` 0.0.1 (2017-07-08)

Initial public version on CRAN

