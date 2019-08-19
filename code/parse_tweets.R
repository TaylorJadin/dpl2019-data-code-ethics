library(tidyverse)
library(tidytext)
library(lubridate)

extract_domain <- function(url) {
  if (!is.na(url) & str_detect(url, '^http')) {
    return(gsub('www\\d{0,1}\\.', '', unlist(strsplit(unlist(strsplit(as.character(url), '//'))[2], '/'))[1]))
  } else {
    return(gsub('www\\d{0,1}\\.', '', unlist(strsplit(unlist(strsplit(as.character(url), '//')), '/'))[1]))
  }
  
}

tweets <- read_csv('digped_tags.csv',
                   col_types = 'ccccccccccccciicc')

tidy_tweets <- tweets %>%
  select(created_at, id_str, text) %>%
  mutate(text = str_replace_all(text, "https://t.co/[A-Za-z\\d]+|http://[A-Za-z\\d]+|&amp;|&lt;|&gt;|https", ""),
         text = str_replace(tolower(text), '^rt', '')) %>%
  filter(!is.na(text)) %>%
  unnest_tokens(word, text, token = "tweets") %>%
  filter(!word %in% stop_words$word,
         !str_detect(word, '^http'),
         str_detect(word, "[a-z]"))

tidy_tweets %>%
  count(word, sort = TRUE)

hashtag_count <- tidy_tweets %>%
  filter(str_detect(word, '^#')) %>%
  count(word, sort = TRUE)

mention_count <- tidy_tweets %>%
  filter(str_detect(word, '^@')) %>%
  count(word, sort = TRUE)

user_count <- tweets %>%
  filter(!is.na(from_user)) %>%
  count(from_user, sort = TRUE)

user_count_no_rt <- tweets %>%
  filter(!is.na(from_user),
         !str_detect(text, '^RT')) %>%
  count(from_user, sort = TRUE)

hashtag_count %>%
  slice(1:20) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col(fill = 'dodgerblue4') +
  coord_flip() +
  xlab('Hashtag') +
  ylab('Tweets')

user_count %>%
  slice(1:20) %>%
  mutate(from_user = reorder(from_user, n)) %>%
  ggplot(aes(from_user, n)) +
  geom_col(fill = 'dodgerblue4') +
  coord_flip() +
  xlab('Account') +
  ylab('Tweets')

user_count_no_rt %>%
  slice(1:20) %>%
  mutate(from_user = reorder(from_user, n)) %>%
  ggplot(aes(from_user, n)) +
  geom_col(fill = 'dodgerblue4') +
  coord_flip() +
  xlab('Account') +
  ylab('Tweets')

user_count_all <- tweets %>%
  filter(!is.na(from_user)) %>%
  mutate(retweet = str_detect(text, '^RT')) %>%
  count(from_user, retweet, sort = TRUE)

user_count %>%
  slice(1:20) %>%
  mutate(from_user = reorder(from_user, n)) %>%
  select(from_user, count = n) %>%
  inner_join(user_count_all) %>%
  select(from_user, count, retweet, post_count = n) %>%
  mutate(from_user = reorder(from_user, count)) %>%
  ggplot(aes(from_user, post_count, fill = retweet)) +
  geom_col() +
  coord_flip() +
  xlab('Account') +
  ylab('Tweets')

tweets %>%
  filter(!is.na(from_user),
         !is.na(created_at)) %>%
  count(from_user, sort = TRUE) %>%
  mutate(from_user = reorder(from_user, n)) %>%
  slice(1:20) %>%
  select(from_user, all_count = n) %>%
  inner_join(tweets %>%
                      !is.na(created_at)) %>%
               mutate(year = str_sub(created_at, 27, 30)) %>%
               count(from_user, year, sort = TRUE) %>%
               select(from_user, year, year_count = n)) %>%
  mutate(from_user = reorder(from_user, all_count)) %>%
  ggplot(aes(from_user, year_count, fill = year)) +
  geom_col() +
  coord_flip() +
  xlab('Account') +
  ylab('Tweets')
