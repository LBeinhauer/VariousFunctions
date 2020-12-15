#### Lukas Beinhauer 08/12/20 ####

## Making various functions ##


### Attention: 'sep.objects' ist not returning separate objects at the moment. If desired,
###   you can use 'list', and cycle through the elements of the list in a for loop AFTER calling
###   and the function and storing the list in an object.
###
###   ex.: x <- MultDataObjects_sheets(5, filepath="C:/Users/beinhaul/Documents/Git/ManyLabs1/MLforR.xlsx",
###                                    basename = "data", col=NULL, output="list")
###        for(i in 1:k){
###                      assign(name(x[[i]]), x[[i]])
###        }

MultDataObjects_sheets <- function(k, filepath, basename = "data", col = NA,
                                   output = c("list", "sep.objects", "data.frame")){
  
  if (!require(readxl)) {
    stop("readxl not installed")
  }
  
  spaces <- ceiling(k/10)
  if(output == "sep.objects"){
     for(i in 1:k){
      assign(gsub(" ", "0", sprintf(paste0(basename, "%", spaces, "d", sep=""), i)), 
             read_excel(filepath, sheet=i))
    }
  }else{
    if(output == "list"){
      dat <- list()
      for(i in 1:k){
        dat[[i]] <- assign(gsub(" ", "0", sprintf(paste0(basename, "%", spaces, "d", sep=""), i)), 
                            read_excel(filepath, sheet=i))
      }
      return(dat)
    }else{
      if(output == "data.frame"){
        for(i in 1:k){
          temp.dat <- assign(gsub(" ", "0", sprintf(paste0(basename, "%", spaces, "d", sep=""), i)), 
                 read_excel(filepath, sheet=i))
          if(i == 1){
            df <- data.frame(matrix(NA, nrow=nrow(temp.dat), ncol=k))
          }
          if(is.na(col)){
            stop("Please specify a column index")
          }
          df[,i] <- temp.dat[,col]
        }
        return(df)
      }else{
        stop("Specify output as either 'list', 'sep.objects' or 'data.frame'")
      }
    }
  }
}


getPPV <- function(kstudies=1000, alpha=.05, Power=.8, ratio.true.hypotheses=.3){
  
  Pb <- ratio.true.hypotheses # the ratio of "true" hypotheses to all hypotheses (or P(B)) if we refer to the Bayesian Therem, with A
                              #   being the event of a statistically significant test and B being the event of a genuine effect present)
  
  noeffstudies <- (1-Pb)*kstudies # nr of studies assessing *no* genuine "true" effect
  
  effstudies <- Pb*kstudies # nr of studies assessing a genuine "true" effect
  
  
  ksig <- Power*effstudies + alpha*noeffstudies # nr of studies with a statistically significant test 
  
  knonsig <- (1-Power)*effstudies + (1-alpha)*noeffstudies # nr of studies with *no* statistically significant test
  
  
  falsepositives <- noeffstudies*alpha # nr of studies falsely identifying an effect (Type-I-error)
  
  falsenegatives <- effstudies*(1-Power) # nr of studies falsely missing to identify an effect (type-II-error)
  
  truepositives <- effstudies*(Power) # nr of studies correctly identifying an effect
  
  truenegatives <- noeffstudies*(1-alpha) # nr of studies correctly missing to identify an effect
  
  
  FDR <- falsepositives/ksig # False Discovery Rate
  
  PPV <- truepositives/ksig # Posterior Predictive Value (Probability of dealing with a genuine "true" effect, when a statistically
                            #   significant test is achieved.)
  
  return(list(FDR = FDR,
              PPV = PPV))
}
