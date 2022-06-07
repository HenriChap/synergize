synergize <- function(data_frame,el1=1,el2=3,char1=2,char2=4, x='Elements',y='Characteristics',z='Total'){
   element1<-strsplit(data_frame[,char1],split = ",")
   element2<-strsplit(data_frame[,char2], split=",")
   element1<-setNames(element1, as.vector(data_frame[,el1]))
   element2<-setNames(element2, as.vector(data_frame[,el2]))
   element1=element1[sapply(element1, length)!=0]
   element2=element2[sapply(element2, length)!=0]
   result<-list()
   for (i in names(element2)) 
      for (j in names(element1))
      {if (i==j){ output<-union(element2[[i]],element1[[j]])
      result[[i]]<-output
      }}
   result_df<-list2DF(result)
   if (dim(result_df)[2] > 0)
   {elID<-vector()
   for (k in colnames(result_df))
   {output<-k
   elID[k]<-output}
   char_union<-vector()
   for (l in 1:ncol(result_df))
   {output<-paste(unique(result_df[,l]),collapse = ",")
   char_union[l]<-output}
   numb_total<-vector()
   for (m in 1:ncol(result_df))
   {output<-length(unique(result_df[,m]))
   numb_total[m]<-output}
   table<- data.frame(x=elID, y=char_union, z=numb_total)
   colnames(table)=c(x,y,z)
   return(table)}
   else{
      print('There are no common elements')
      return(NULL)
   }}
