# **Various Functions (08/12/20)**
### Lukas Beinhauer

This page contains an R-script containing various, mischellaneous functions.

At the moment, the following functions are contained:
- MultDataObjects_sheets()
- getPPV()

## MultDataObjects_sheets()

This function allows to extract data from a single data-file. Its current implementation allows to extract data from a single excel-file, containing multiple sheets. The function can output the data from the separate sheets as a list or a data.frame. In a list, the data for each sheet is contained in a separate element of that list. In a data.frame, a single column-index may be specified. The function extracts the specified column from each sheet, and stores the data in separate columns of a single data.frame.


##getPPV()

This function allows to examine the False Discovery Rate (FDR) and Posterior Predictive Value (PPV) in traditional statistical significance tests, based on manipulations of alpha, Power, and the ratio of "true" hypotheses tested. The PPV may also be seen as the conditional probability of a true effect being detected, given the fact that a statistical test results in a significant test statistic. 
Especially under a lower ratio of true hypotheses being tested, the PPV is lower than expected. This is most easily discussed in term of the FDR - in such circumstance, the FDR often greatly exceeds the alpha values [discussion to be continued, may be moved to separate report].


The content of this script is subject to change, and will be developed over time.