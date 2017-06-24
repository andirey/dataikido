#
# R in action (2 ed.)
#

# Pairwise deletion
# -----------------
# In pairwise deletion, observations are deleted
# only if they’re missing data for the variables involved in a specific analysis
#
# ! recommend staying away from this approach !

cor(sleep, use="pairwise.complete.obs")
