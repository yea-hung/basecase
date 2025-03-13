# Install the package

Install *devtools* if you don't alrady have it:

```
install.packages('devtools')
```

To install the *basecase* package:

```
devtools::install_github('yea-hung/basecase')
```

# Summary

Base-R functions for mimicking dplyr's `case_match()` and `case_when()`. Unlike `case_match()` and `case_when()`, `base_match()` and `base_when()` return factors. The desired order of the levels is honored.

# Differences between `base_when()` and `case_when()`

`base_when()` does not exactly mimic `case_when()`: 
- `base_when()` will evaluate all conditions defined in `conditions` 
- `case_when()` will stop when a condition is met