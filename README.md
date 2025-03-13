# Install the package

Install *devtools* if you don't alrady have it:

```
install.packages('devtools')
```

To install the *basecase* package:

```
devtools::install_github('yea-hung/basecase')
```

# Notes

Note that `base_when()` doesn't exactly mimic `case_when()`. `base_when()` will evaluate all conditions defined in `conditions` whereas `case_when()` will stop when all elements are defined.