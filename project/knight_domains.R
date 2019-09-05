library(tidyverse)

monthly_signups <- read_csv('project/signups_by_month.csv',
                    col_types = 'cin'
                    )

# check out the lubridate package ( do more with dates and times in R )

ggplot(data = monthly_signups) +
  geom_col(aes(month, signups))
