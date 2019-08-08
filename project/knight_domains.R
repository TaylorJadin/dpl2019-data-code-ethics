library(tidyverse)

signups <- read_csv('project/signups_by_month.csv',
                    col_types = 'cic'
                    )
ggplot(data = signups) +
  geom_col(aes(month, signups))
