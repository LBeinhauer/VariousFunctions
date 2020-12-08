# **Various Functions (08/12/20)**
### Lukas Beinhauer

This page contains an R-script containing various, mischellaneous functions.

At the moment, the following functions are contained:
- MultDataObjects_sheets

## MultDataObjects_sheets

This function allows to extract data from a single data-file. Its current implementation allows to extract data from a single excel-file, containing multiple sheets. The function can output the data from the separate sheets as a list or a data.frame. In a list, the data for each sheet is contained in a separate element of that list. In a data.frame, a single column-index may be specified. The function extracts the specified column from each sheet, and stores the data in separate columns of a single data.frame.

The content of this script is subject to change, and will be developed over time.