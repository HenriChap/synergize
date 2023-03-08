synergize <- function(data_frame,
                      el1 = 1,
                      el2 = 3,
                      char1 = 2,
                      char2 = 4,
                      x = "Elements",
                      y = "Characteristics",
                      z = "Total") {
   #selecting elements characteristics inside a list
   element1 <- strsplit(data_frame[, char1], split = ",")
   element2 <- strsplit(data_frame[, char2], split = ",")
   #setting elements names
   element1 <- setNames(element1, as.vector(data_frame[, el1]))
   element2 <- setNames(element2, as.vector(data_frame[, el2]))
   #removing elements without characteristics
   element1 <- element1[sapply(element1, length) != 0]
   element2 <- element2[sapply(element2, length) != 0]
   #setting a list to store loop result
   result <- list()
   #if the element is repeated in both columns, the characteristics will be selected without repetition
   for (i in names(element2))
      for (j in names(element1))
       {if (i == j) {
         output <- union(element2[[i]], element1[[j]])
         result[[i]] <- output
         }
      }
   #setting object back to data frame
   result_df <- list2DF(result)
   #checking if there is some similar element between columns
   if (dim(result_df)[2] > 0)
   #selecting elements names
   {el_id <- vector()
   for (k in colnames(result_df))
   {output <- k
   el_id[k] <- output
   }
   #uniting characteristisc in a string
   char_union <- vector()
   for (l in seq_len(ncol(result_df)))
   {output <- paste(unique(result_df[, l]), collapse = ",")
   char_union[l] <- output
   }
   #counting characteristics
   numb_total <- vector()
   for (m in seq_len(ncol(result_df)))
   {output <- length(unique(result_df[, m]))
   numb_total[m] <- output
   }
   #naming columns and returning value
   table <- data.frame(x = el_id, y = char_union, z = numb_total)
   colnames(table) <- c(x, y, z)
   return(table)
   #if there are no similarities
   } else {
      message("There are no common elements")
      return(NULL)
   }
   }
