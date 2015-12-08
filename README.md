# Terrorism
Analysis of US Incidents from the Global Terrorism Database

This document is an analysis of a portion of the Global Terrorism Database (GTD) 
maintained by the National Consortium for the Study of Terrorism and Responses to Terrorism (START). 
The homepage for the database is [here](http://www.start.umd.edu/gtd/). Users may search the database from that page. 
Users may also download the database or portions thereof. This analysis is based on database from 1992 through 2014, 
which is distributed as two Excel files, gtd\_92to10\_0615dist.xlsx and gtd\_11to14\_0615dist.xlsx. 

To reproduce the analysis, copy the two .csv files described above and the US\_terror.Rmd in this repository into the RStudio working directory and use the knitr package to produce an HTML document from the .Rmd file.

The file US\_94\_14.csv in this repository is csv text version of the data set as analyzed. It consists of 566 observations from the GTD of terrorist incidents in the United States from 1994 through 2014. It includes in addition to the native GTD variables the *perp.cat* column which I created for the analysis.
