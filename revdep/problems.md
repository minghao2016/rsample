# probably

<details>

* Version: 0.0.4
* Source code: https://github.com/cran/probably
* URL: https://github.com/tidymodels/probably/
* BugReports: https://github.com/tidymodels/probably/issues
* Date/Publication: 2020-01-13 17:00:05 UTC
* Number of recursive dependencies: 85

Run `revdep_details(,"probably")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Can't convert from <class_pred> to <ordered<38ce1>>.
      [1mBacktrace:[22m
      [90m 1. [39mtestthat::expect_equal(...)
      [90m 5. [39mvctrs::vec_default_cast(x = x, to = to, x_arg = x_arg, to_arg = to_arg)
      [90m 6. [39mvctrs::stop_incompatible_cast(x, to, x_arg = x_arg, to_arg = to_arg)
      [90m 7. [39mvctrs:::stop_incompatible(...)
      [90m 8. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════
      [ OK: 112 | SKIPPED: 1 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: class_pred can be coerced to ordered factor (@test-class-pred.R#74) 
      2. Error: casting class_pred to factor (@test-class-pred.R#124) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# solitude

<details>

* Version: 0.2.1
* Source code: https://github.com/cran/solitude
* URL: https://github.com/talegari/solitude
* BugReports: https://github.com/talegari/solitude/issues
* Date/Publication: 2019-12-07 09:00:02 UTC
* Number of recursive dependencies: 38

Run `revdep_details(,"solitude")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘solitude-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: isolationForest
    > ### Title: Fit an Isolation Forest
    > ### Aliases: isolationForest
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data("attrition", package = "rsample")
    Warning in data("attrition", package = "rsample") :
      data set ‘attrition’ not found
    > set.seed(1)
    > index = sample(ceiling(nrow(attrition) * 0.2))
    Error in nrow(attrition) : object 'attrition' not found
    Calls: sample -> nrow
    Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘R6’
      All declared Imports should be used.
    ```

# tidyrules

<details>

* Version: 0.1.3
* Source code: https://github.com/cran/tidyrules
* URL: https://github.com/talegari/tidyrules
* BugReports: https://github.com/talegari/tidyrules/issues
* Date/Publication: 2020-01-30 09:40:03 UTC
* Number of recursive dependencies: 75

Run `revdep_details(,"tidyrules")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidyrules-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: tidyRules.C5.0
    > ### Title: Obtain rules as a tidy tibble from a C5.0 model
    > ### Aliases: tidyRules.C5.0
    > 
    > ### ** Examples
    > 
    > data("attrition", package = "rsample")
    Warning in data("attrition", package = "rsample") :
      data set ‘attrition’ not found
    > attrition <- tibble::as_tibble(attrition)
    Error in tibble::as_tibble(attrition) : object 'attrition' not found
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      object 'attrition' not found
      [1mBacktrace:[22m
      [90m 1. [39mtibble::as_tibble(attrition)
      
      [31m──[39m [31m3. Error: (unknown) [39m [31m────────────────────────────────────────────────────────────────────────[39m
      object 'attrition' not found
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════
      [ OK: 0 | SKIPPED: 0 | WARNINGS: 3 | FAILED: 3 ]
      1. Error: (unknown) (@test-c5.R#11) 
      2. Error: (unknown) (@test-cubist.R#11) 
      3. Error: (unknown) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

