#
# R in action (2 ed.)
#

#
# switch example
#

feelings <- c("sad", "afraid")

for (i in feelings)
  print(
    switch(i,
           happy = "i am happy",
           sad = "cheer up",
           afraid = "i am afraid"
           )
    )

