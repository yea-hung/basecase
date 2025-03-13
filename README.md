# Summary

*basecase* includes base-R functions for mimicking dplyr's `case_match()` and `case_when()`. Unlike the *dplyr* functions, `base_match()` and `base_when()` return factors. The desired order of the levels is honored.

# Installation

Install *devtools* if you don't already have it:

```
install.packages('devtools')
```

To install the *basecase* package:

```
devtools::install_github('yea-hung/basecase')
```

# Usage

See the built-in help pages.

# Note

`base_when()` does not exactly mimic `case_when()`: 
- `base_when()` will evaluate all conditions defined in `conditions` 
- `case_when()` will stop when a condition is met
