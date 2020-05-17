#knn
#cluster :  partition 


install.packages("cluster")
install.packages("factoextra") #graph 
install.packages("magrittr")  


library("cluster")
library("factoextra")
library("magrittr")

setwd("c://abced/a") 

data("USArrests")

my_data <- USArrests %>%
            na.omit() %>%          # Remove missing values (NA)
            scale()                # Scale variables


write.csv(my_data,"out.csv")


# View the firt 3 rows
head(my_data, n = 3)



##partition 
res.dist <- get_dist(USArrests, stand = TRUE, method = "pearson")
fviz_dist(res.dist, 
          gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))


############################################################################
############################################################################
fviz_nbclust(my_data, kmeans, method = "gap_stat")



###
set.seed(123)



km.res <- kmeans(my_data, 4, nstart = 25)
fviz_cluster(km.res, data = my_data,
             ellipse.type = "convex", 
             palette = "jco",
             ggtheme = theme_minimal())






############
res.hc <- USArrests %>%
  scale() %>%                    # Scale the data
  dist(method = "euclidean") %>% # Compute dissimilarity matrix
  hclust(method = "ward.D2")     # Compute hierachical   clustering

# Visualize using factoextra
# Cut in 4 groups and color by groups
fviz_dend(res.hc, k = 4, # Cut in four groups
          cex = 0.5, # label size
          k_colors = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE # Add rectangle around groups
)
