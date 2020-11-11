
##1. Open the data frame in iris {datasets}. Use the help to know about this data. In which units are measured the length and width of sepals and petals? How many variables and observations are there in iris?
?iris
iris <- iris
## 5 variables and 150 observations
## Questions 2-5 as labeled 
Sp <- character()
Va <- character()
Me <- numeric()
Se <- numeric()
md <- numeric()
mini <- numeric()
maxi <- numeric()
for (i in levels(iris$Species)) {
  for (j in names(iris)[-5]) {
    Sp <- c(Sp, paste("Iris", i))       ##2.Vector for species names with the genus 
    Va <- c(Va, j)                      ##3.Vector with the names of all the quantitative variables
    x <- iris[iris$Species == i, j]
    Me <- c(Me, mean(x))                ##5.Vector with mean values for each variable for each species
    Se <- c(Se, sd(x)/sqrt(length(x)))  ##5.Vector with standard error values for each variable for each species
    md <- c(md, median(x))              ##5.Vector with median values for each variable for each species
    mini <- c(mini, min(x))             ##5.Vector with minimum values for each variable for each species
    maxi <- c(maxi, max(x))             ##5.Vector with maximum values for each variable for each species
  }
  
}
##4. Make a data frame with the combination of the two previous vectors like this:
d <- data.frame(Species = Sp, Variables = Va)
##5. Adding the following values to the data.frame <- mean, standard error, median, minimum, and maximum; for each variable of each species
d <- data.frame(d, Mean = Me, Standard.error = Se, Median = md, Minimum.values= mini, Maximum.values = maxi)
##6
writexl::write_xlsx(d, "C:/Users/JATIN/Desktop/Stat/R2//Madhav2.xlsx")
