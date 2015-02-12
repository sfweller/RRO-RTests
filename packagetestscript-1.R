# R script containing tests to verify the proper functioning of packages in RRO
# Utilizes the R package 'testthat' testing framework
# Stephen Weller, 2/5/14.

context("Package installation functionality")

describe('install.packages',
	it('we can install.packages(c("Rcpp", "zoo"))', {
	SUCCESS <- 0
        ERROR <- 1
        WARN <- 2

	result <- tryCatch(
	       install.packages(c('Rcpp', 'zoo'))
               library('Rcpp')
               library('zoo')
               result <_ SUCCESS
            },
            error = function(cond) {
               return(ERROR)
            },
            warning=function(cond) {
	       return(WARN)
            })

	    #  assert that the package installation works	    
 	

expect_that(result, is_equivalent_to(SUCCESS))


### Test to verify checkpoint() function

	checkpoint.verify <- function(checkpoint.date="2014-11-01")
        {
	    ## List of expected recommended R packages and correct versions for snapshot date
            ## Checked versus CRAN package sources

	    expected.packages.info <- c("1.15.3", "0.2-9", "0.8-61", "2.23-13", "0.20-29", "7.3-35", "1.1-4",
                "7.3-8", "4.1-8", "2.37-7")
            names(expected.packages.info) <- c("cluster","codetools","foreign","KernSmooth","lattice","MASS",
                  "Matrix","nnet","rpart","survival")
                  
            checkpoint(checkpoint.date)
            
  }
