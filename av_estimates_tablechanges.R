table = read.csv('data/av_estimates_new0602.csv', header = TRUE)



# change values in rows
row = 3

table$variable[row] 
table$lower[row] = 0.06
table$median[row] 
table$upper[row] = 0.1
table$distribution[row] 
table$label[row] = 'Yield loss millet [%]'
table$Description[row] = 'Yield loss after harvest'

table


# add new rows
newrow = data.frame('irrigation_factor', 0.2, NA, 1.0, 'posnorm', 'Additional yield [t/ha]', 'Add. yield through irrigation')
names(newrow) = names(table)
  
table = rbind(table, newrow)


# save
write.csv(table,'data/av_estimates_new0602.csv', row.names = FALSE)
