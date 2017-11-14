#TF-IDF

TermByGroup<- merged_data %>%
  unnest_tokens(word, text) %>%
  count(group_id,word, sort = TRUE) %>%
  ungroup()


tot<- TermByGroup %>%
  group_by(group_id) %>%
  summarize(total=sum(n))

TermByGroup<- left_join(TermByGroup, tot)

TermByGroup<- TermByGroup %>%
  bind_tf_idf(word,group_id, n)
View(TermByGroup)