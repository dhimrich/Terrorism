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

## Create a variable for perpetrator categories and assign unknowns
us_92_14.df$perp_cat <- NA

## Assign some perp_cat values based on target type
us_92_14.df$perp_cat[us_92_14.df$targtype1_txt %in% 
                         c("Abortion Related")] <- "anti-abortion"

## Assign other perp_cat values based on group name (gname)
us_92_14.df$perp_cat[us_92_14.df$gname %in% 
                         c("Anti-Abortion Activists", 
                           "Army of God")] <- "anti-abortion"

us_92_14.df$perp_cat[us_92_14.df$gname %in% 
                         c("Earth Liberation Front (ELF)",
                           "Animal Liberation Front (ALF)",
                           "The Justice Department",
                           "Coalition to Save the Preserves (CSP)",
                           "Revolutionary Cells-Animal Liberation Brigade",
                           "Farm Animal Revenge Militia (FARM)",
                           "Earth First!",
                           "Animal Rights Activists",
                           "Anarchists")] <- "eco-terror"

us_92_14.df$perp_cat[us_92_14.df$gname %in% 
                         c("Aryan Republican Army",
                           "Maccabee Squad and the Shield of David",
                           "Jewish Extremists",
                           "Cuban Exiles")] <- "right-wing"

us_92_14.df$perp_cat[us_92_14.df$gname %in% 
                         c("World Church of the Creator",
                           "Ku Klux Klan",
                           "Fourth Reich Skinheads")] <- "anti-minority"

us_92_14.df$perp_cat[us_92_14.df$gname %in% 
                         c("Al-Qa`ida",
                           "Tehrik-i-Taliban Pakistan (TTP)",
                           "Islamist Extremists",
                           "Al-Qa`ida in the Arabian Peninsula (AQAP)")] <- "jihadis"

us_92_14.df$perp_cat[us_92_14.df$gname %in% 
                         c("Veterans United for Non-Religious Memorials")] <- "anti-Christian"

us_92_14.df$perp_cat[us_92_14.df$gname %in% 
                         c("Mexican Revolutionary Movement")] <- "left-wing"

us_92_14.df$perp_cat[us_92_14.df$gname %in% 
                         c("Aryan Nation")] <- "anti-Jew"





## Assign individual and unknown groups based on reading summaries of individual
## incidents

us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("199410150011", "199504150010",
                          "199608160007", "199905000002",
                          "200003250005", "200005270009",
                          "200006160006", "200105050003",
                          "200305040005", "200309240007",
                          "200310250002", "200412090005",
                          "200501010007", "200502130002",
                          "200502150001", "200502170002",
                          "200507080006", "201009010022",
                          "201110120003")] <- "eco-terror"

us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("200202040010", "200603030013",
                          "200906010028", "200911060002",
                          "201010000001", "201010000002",
                          "201010190014", "201010250026",
                          "201011000001", "201304150001",
                          "201304150002", "201304180001",
                          "201304190009", "201404270057",
                          "201406010063", "201406250082",
                          "201410230047")] <- "jihadis"

us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("199601120006")] <- "anti-Christian"

us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("199906180002", "199906180003",
                          "199906180004", "200603030013",
                          "200804220011", "200906100003",
                          "201404130060", "201404130061",
                          "200311180007", "200404010004")] <- "anti-Jew"

us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("200512200004", "201005100042", 
                          "201005100042", "201104230010",
                          "201201030020", "201201030019",
                          "201201030021", "201201030022",
                          "201207040032", "201208060019",
                          "201208120012", "201209300041",
                          "201403250090", "200802090004")] <- "anti-Muslim"

us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("199601120006", "200811050008", 
                          "200907030004", "201101170018",
                          "201208050006", "199610030012",
                          "199907010009", "199410160011",
                          "199410160012", "199410160013",
                          "200811140015")] <- "anti-minority"


us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("199804140001", "200609110007",
                           "199907020007")] <- "anti-abortion"

us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("199903200009", "200210030002",
                          "200807250030", "200807270001",
                          "201206180029", "201311010046",
                          "201409120032", "201411280018",
                          "201411280019", "201411280020")] <- "right-wing"

us_92_14.df$perp_cat[us_92_14.df$eventid %in% 
                         c("200206030002", "200206030003",
                          "201002180013", "201208150059",
                          "201302030025", "201304110003", 
                          "201406080071", "201410030065",
                          "201409110001", "201412200060")] <- "left-wing"


us_92_14.df %>% 
    group_by(perp_cat) %>% 
    summarize(incidents = NROW(eventid),
              casualties = 
                  sum(nkill, na.rm = TRUE) + 
                  sum(nwound, na.rm = TRUE),
              killed = sum(nkill, na.rm = TRUE),
              wounded = sum(nwound, na.rm = TRUE)) %>% 
    arrange(desc(casualties)) %>% View()

