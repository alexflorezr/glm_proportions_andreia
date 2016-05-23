# clean the environment
rm(list = ls())
# required package(s)
library(betareg)
library(ggplot2)
# upload the data
data_amphs <- read.delim(file.choose(), sep="\t")
# Transform the GD unsing the formula (y · (n − 1) + 0.5)/n, where n is the sample size (Smithson and Verkuilen 2006)
data_amphs$GD_transformed <- (data_amphs$GD * (length(data_amphs$GD) - 1) + 0.5) / length(data_amphs$GD)
# check the distribution of GD and GD transformed (It's not possible to make a difference)
hist(data_amphs$GD, col="#FF7F2490", main= "GD and GD transformed", xlab = NULL, border = F)
hist(data_amphs$GD_transformed,  col="#7FFFD490",border = F, add=T)
# beta regression using the transformed data
beta_amphs <- betareg(GD_transformed ~ Anthrome, data=data_amphs)
# Check the regression output
summary(beta_amphs)
# plot the regression output
plot(beta_amphs)