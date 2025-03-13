# Motivation

As [mentioned elsewhere](https://github.com/tidyverse/funs/issues/72), `case_match()` and `case_when()` do not return a factor. A [typical tidyverse solution](https://stackoverflow.com/questions/49572416/r-convert-to-factor-with-order-of-levels-same-with-case-when) for getting a factor out of `case_match()` with levels in a desired order is something like this:
 
```
nhanes <- nhanes %>%
  mutate(
    country=factor(
      case_match(dmdborn4,1 ~ 'USA',2 ~ 'Other'),
      levels=c('USA','Other')
    )
  )
```

In this sort of solution, we have to type the level labels twice. The first occurrence defines the label-level mapping, while the second occurrence defines the order of the levels. I think this is inefficient.

Compare the above with the following base-R solution:

```
dmdborn4_codebook<-c('USA'=1,'Other'=2)
nhanes$country<-factor(nhanes$dmdborn4,levels=dmdborn4_codebook,
                       labels=names(dmdborn4_codebook))
```

Here, we only have to type the level labels once: that one occurrence defines both the label-level mapping and the order of the levels.

My starting principle in writing *basecase* is that one should only have to type the level labels once.

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

# Examples

## Data

Load the package, if you haven't already loaded it:

```
library('nhanes')
```

Load the data:

```
data('nhanes')
```

## `base_match()`

Using only base R:

```
nhanes$country<-base_match(nhanes$dmdborn4,c('USA'=1,'Other'=2))
```

Using tidyverse piping (requires *dplyr*):

```
nhanes <- nhanes %>% 
  mutate(country=base_match(dmdborn4,c('USA'=1,'Other'=2)))
```

##  `base_when()`

Using only base R:

```
nhanes$cholesterol<-base_when(list(
   'Desirable'=nhanes$lbxtc<200,
   'Borderline high'=(nhanes$lbxtc>=200)&(nhanes$lbxtc<240),
   'High'=nhanes$lbxtc>=240
))
```

Using tidyverse piping (requires *dplyr*):

```
nhanes <- nhanes %>% 
  mutate(cholesterol=base_when(
    list(
      'Desirable'=nhanes$lbxtc<200,
      'Borderline high'=(nhanes$lbxtc>=200)&(nhanes$lbxtc<240),
      'High'=nhanes$lbxtc>=240
    )
  ))
```

# Note

Despite the cute name, `base_when()` does not exactly mimic `case_when()`, and I do not intend it to. The key difference is as follows: 
- `base_when()` will evaluate all conditions defined in `conditions` 
- `case_when()` will stop when a condition is met
