# some example data wrangling

TAGS %>%
  filter(!is.na(from_user),
         from_user!="DonaldBittar")%>%
  count(from_user, sort = TRUE)%>%
  slice(1:20)%>%
  mutate(from_user = reorder(from_user,n))%>%
  ggplot(mapping = aes(from_user,n))+
  geom_col()+
  coord_flip()
