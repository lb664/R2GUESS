# R2GUESS: Bayesian variable selection for multiple correlated outcomes with GUESS

This R package is a maintained version of [**R2GUESS**](https://doi.org/10.18637/jss.v069.i02) ([Liquet et al., 2016](https://doi.org/10.18637/jss.v069.i02)).

`R2GUESS` is an R interface to **GUESS**, a C++ implementation of Evolutionary
Stochastic Search (ESS) for sparse Bayesian variable selection in linear regression
with one or several correlated outcomes (for example gene expression measured in
several tissues) and a large number of predictors (for example SNPs).

## Features

- Fit single- or multi-outcome Bayesian variable selection models (`R2GUESS()`),
  with parallel chains, resumable (`Resume.R2GUESS()`) and extendable (`Extend.R2GUESS()`) runs.
- Convergence diagnostics (`check.convergence()`).
- Marginal posterior probabilities of inclusion, best visited models, posterior
  effect sizes (`summary()`, `get.best.models()`, `sample.beta()`).
- Permutation-based false discovery rate (`R2GUESS.perm()`, `FDR.permutation()`).
- Plots: Manhattan-style MPPI plots, model and variable plots, heatmaps
  (`plotMPPI()`, `plotmodel()`, `plotvariable()`, `plotcim()`).
- CPU build needs only the GNU Scientific Library; an optional GPU build uses CULA.

## Installation

1.  Install the [**GNU Scientific Library**](https://www.gnu.org/software/gsl/) (>= 1.12) and a C++ compiler (see the installation notes below).

2.  Install the [**pak**](https://pak.r-lib.org/) package from **CRAN**. Invoke R and then type

    ```r
    install.packages("pak")
    ```

3.  Install the **R2GUESS** package from GitHub by typing

    ```r
    pak::pak("lb664/R2GUESS")
    ```

    or, from a source tarball (also installs all the R dependencies, including the Bioconductor package **mixOmics**),

    ```r
    pak::pak("local::R2GUESS_0.2.0.tar.gz")
    ```

4.  Finally, load the **R2GUESS** package

    ```r
    library("R2GUESS")
    ```

## Installation notes

**C++ compiler.** **R2GUESS** compiles the **GUESS** program at installation: [Rtools](https://cran.r-project.org/bin/windows/Rtools/) on Windows, the Xcode command line tools on macOS (`xcode-select --install`) and `g++` on Linux.

**GNU Scientific Library.** On macOS install it with [Homebrew](https://brew.sh/) (`brew install gsl`), on Debian or Ubuntu with `sudo apt install libgsl-dev`. If it is installed in a non-standard location use `--with-gsl-prefix=PFX` when installing.

**Dependencies.** **fields**, **MCMCpack**, **mvtnorm**, **snowfall** (CRAN) and **mixOmics** (Bioconductor) are installed automatically by `pak`. Only GSL and the compiler have to be installed by hand.

**GPU (optional).** If the CULA library is found by `configure` (`CULA_INC_PATH`, `CULA_LIB_PATH_64`) the GPU build is enabled; otherwise the CPU build is used. The GPU path is not tested in this version.

## Example: multi-tissue eQTL analysis of the rat Hopx gene

The example runs on the bundled rat Hopx data (29 animals, 770 SNPs, 4 tissues).

``` r
library(R2GUESS)
data(data.Y.Hopx); data(data.X); data(MAP.file)

path.input  <- system.file("Input", package = "R2GUESS")
path.par    <- system.file("extdata", package = "R2GUESS")
path.output <- tempdir()

fit <- R2GUESS(dataY = data.Y.Hopx, dataX = data.X, choice.Y = 1:4,
               label.Y = c("ADR", "Fat", "Heart", "Kidney"), MAP.file = MAP.file,
               file.par = "Par_file_example_Hopx.xml",
               root.file.output = "Example-GUESS-Y-Hopx",
               path.input = path.input, path.output = path.output, path.par = path.par,
               nsweep = 11000, burn.in = 1000, Egam = 5, Sgam = 5,
               nb.chain = 3, cuda = FALSE, seed = 1)
summary(fit, 20)   # 20 best models
print(fit)
```

For convergence use a larger run (e.g. `nsweep = 110000`, `burn.in = 10000`).

## Issues

To report an issue, please use the **R2GUESS** issue tracker at [BugReports](https://github.com/lb664/R2GUESS/issues)

## Citation

Liquet B, Bottolo L, Campanella G, Richardson S, Chadeau-Hyam M (2016).
R2GUESS: A Graphics Processing Unit-Based R Package for Bayesian Variable
Selection Regression of Multivariate Responses. *Journal of Statistical Software*,
69(2), 1-34. doi:[10.18637/jss.v069.i02](https://doi.org/10.18637/jss.v069.i02)

Method: Bottolo L, Richardson S (2010). Evolutionary Stochastic Search for Bayesian
model exploration. *Bayesian Analysis* 5(3), 583-618.

### Acknowledgements

R2GUESS was originally developed by Benoît Liquet, Leonardo Bottolo, Gianluca Campanella,
Sylvia Richardson and Marc Chadeau-Hyam (see the citation above). This version is maintained by
Leonardo Bottolo.

## License and authors

This software uses the GPL v3 license, see [License](LICENSE). Authors and copyright are provided in [Description](DESCRIPTION).
