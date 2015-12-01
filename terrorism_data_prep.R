## Terrorism Data Prep
gtd_92_10.df <- read.csv("gtd_92to10_0615dist.csv")

library(dplyr)

us_92_10.df <- gtd_92_10.df %>% 
    filter(country_txt == "United States")

gtd_11_14.df <- read.csv("gtd_11to14_0615dist.csv")

us_11_14.df <- gtd_11_14.df %>% 
    filter(country_txt == "United States")

us_92_14.df <- bind_rows(us_92_10.df, us_11_14.df)

glimpse(us_92_14.df)

rm(gtd_11_14.df, gtd_92_10.df, us_11_14.df, us_92_10.df)

sort(table(us_92_14.df$gname))
sort(table(us_92_14.df$gname2))
sort(table(us_92_14.df$gsubname))
sort(table(us_92_14.df$gsubname2))
sort(table(us_92_14.df$gname3))
sort(table(us_92_14.df$gsubname3))

sort(table(us_92_14.df$targtype1_txt))

unks <- us_92_14.df %>% 
    filter(gname %in% c("Individual", "Unknown")) %>% 
    select(eventid, targtype1_txt, summary, addnotes)

