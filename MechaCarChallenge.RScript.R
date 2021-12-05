#Deliverable 1 Challenge

#Load dplyr package
library(dplyr)

#Import and read MechaCar_mpg.csv
mechaCar_mpg <- read.csv(file='Resources/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

#Perform linear regression using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data= mechaCar_mpg)

#Get summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data= mechaCar_mpg))

#Deliverable 2 Challenge

#Import and read Suspension_Coil.csv
suspension_coil <- read.csv(file='Resources/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

#Create a total summary df using the summarize() function to get mean, median, variance, and standard deviation of the suspension coil’s PSI column
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) 

#Create a lot summary df using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) 

#Deliverable 3 Challenge

#Create t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch
t.test(mechaCar_mpg$PSI,mu=1500)

#Create t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot1")$PSI,mu=1500)
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot2")$PSI,mu=1500)
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot3")$PSI,mu=1500)