% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_t.test.R
\name{my_t.test}
\alias{my_t.test}
\title{t Test function}
\usage{
my_t.test(x, alternative = "two.sided", mu)
}
\arguments{
\item{x}{a numeric vector of data.}

\item{alternative}{a character string specifying the alternative hypothesis
("two.sided", "less", or "greater").}

\item{mu}{a number indicating the null hypothesis value of the mean.}
}
\value{
List with elements: test_stat, the numeric test statistic; df, the
degrees of freedom; alternative, the value of the parameter "alternative;"
and p_val, the numeric p-value.
}
\description{
This function performs one and two sample t-tests on vectors of data.
}
\examples{
set.seed(214)
p <- 0.4
coin_flips <- rbinom(200, size = 1, prob = p)
my_t.test(as.numeric(coin_flips), alternative = "greater", mu = p)

}
\keyword{inference}
