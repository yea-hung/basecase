# Motivation

As [mentioned elsewhere](https://github.com/tidyverse/funs/issues/72), `case_match()` and `case_when()` do not return a factor. A typical tidyverse solution is:

```
ii <- ii %>%
  mutate(
    country=factor(
      case_match(dmdborn4,1 ~ 'USA',2 ~ 'Other'),
      levels=c('USA','Other')
    )
  )
```

In this sort of solution, we have to type the level labels twice. The first occurrence defines the label-level mapping, while the second occurrence defines the order of the levels. I think this is inefficient.

# Summary

*basecase* includes base-R functions for mimicking dplyr's `case_match()` and `case_when()`. Unlike the *dplyr* functions, `base_match()` and `base_when()` will each return a factor. The desired order of the levels is honored.

# Installation

Install *devtools* if you don't already have it:

```
install.packages('devtools')
```

Install the *basecase* package:

```
devtools::install_github('yea-hung/basecase')
```

# Usage

See the built-in help pages.

# Note

`base_when()` does not exactly mimic `case_when()`: 
- `base_when()` will evaluate all conditions defined in `conditions` 
- `case_when()` will stop when a condition is met
