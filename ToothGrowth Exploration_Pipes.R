# How to Use Pipes
# Option 1
# loads the Tooth Growth data set
data("ToothGrowth")

# Shows the content of the data set in a new tab
View(ToothGrowth)

# checking for installed packages to confirm if the function dplyr has been loaded
# or we can check the Plots Pane to confirm if the function dplyr has checked 
# which means it has been installed
installed.packages()

# load the library - dplyr - is a data manipulation function
library(dplyr)

# use the filter function of the dplyr to store the dataset where the dose is exactly 0.5
# This includes both Vitamin C (Orange Juice - OJ and Ascorbic Acid - VC) used in the study
# create a variable and store the filter results there
filter_tg <- filter (ToothGrowth, dose == 0.5)

# Shows the content of the filtered data set - filter_tg in a new tab
View(filter_tg)

# sort filter_tg with the arrange function using the column name (len-length of tooth) we are sorting by
# returns a data in ASC order by Len. Results shows in the console
arrange(filter_tg, len)





# Option 2 - Using a nested function to filter and sort the data instead of writing the code separately 
# shown above which is stored in a variable. With Nested Functions, we read from the inside out
# The data is filtered, then sorted
filter_sort_tg <- arrange(filter(ToothGrowth, dose == 0.5), len)

# To show our new dataset filter_sort_tg, we use the View function which shows the data in a new tab
View(filter_sort_tg)






#Option 3 - To use a pipe. %>%
# calls the data set
pipe_filter_sort_tg <- ToothGrowth %>%  
  filter(dose == 0.5) %>%   #filters the dataset
  group_by(supp) %>%        #group the supplements of Vitamin C (oj, vc)
  arrange(len)              #sorts the dataset which is stored in pipe_filter_sort_tg
View(pipe_filter_sort_tg)   #to view the new data set pipe_filter_sort_tg
