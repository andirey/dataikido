#
# R in action (2 ed.)
#

# Control structures

# 1. FOR LOOPS

for(i in 1:5) print(1:i)
for(i in 5:1) print(1:i)

# 2. IF() AND ELSE

if(interactive()){
  plot(x, y)
} else {
  png("myplot.png")
  plot(x, y)
  dev.off()
}

# 3. IFELSE()

# 3.1
pvalues <- c(.0867, .0018, .0054, .1572, .0183, .5386)
results <- ifelse(pvalues <.05, "Significant", "Not Significant")
results

# 3.2 (the same with for)
pvalues <- c(.0867, .0018, .0054, .1572, .0183, .5386)
results <- vector(mode="character", length=length(pvalues))
for(i in 1:length(pvalues)){
  if (pvalues[i] < .05) results[i] <- "Significant" 
  else results[i] <- "Not Significant"
}
results
