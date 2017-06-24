#
# R in action (2 ed.)
#

#
# Students scores Research
# 1. Single perfomance indicator to each student
# 2. Grade student from A to F (20 % skip)
# 3. Sort by name
#

options(digits = 2)

#
# 1. Data creation
#

student <- c("John Davis", "Angela Williams", "Bullwinkle Moose", 
             "David Jones", "Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox", "Joel England",       
             "Mary Rayburn")                    

math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)       
science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)              
english <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)              

roster <- data.frame(student, math, science, english, stringsAsFactors=FALSE)  

#
# 2. Perfomance scores
#    'math', 'science' and 'english'
#    have different means and standard deviations
#    scale - standardize these variables

z <- scale(roster[, 2:4])

score <- apply(z, 1, mean)

roster <- cbind(roster, score)

#
# 3. Grades the students
#

# percentile rank of each student’s performance score
y <- quantile(score, c(.8, .6, .4, .2))

# recode students’ percentile ranks into a new categorical grade variable
roster$grade[score >= y[1] ] <- "A" 
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C" 
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F" 

#
# 4. Extract names
#

name <- strsplit((roster$student), " ")  

# "[" is a function that extracts part of an object
last_name <- sapply(name, "[", 2)
first_name <- sapply(name, "[", 1) 

roster <- cbind(first_name,last_name, roster[,-1])

#
# 5. Sort names
#

roster <- roster[order(last_name, first_name),]

roster
