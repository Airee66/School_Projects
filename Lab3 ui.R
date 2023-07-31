#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(readr)

US_Covid19 <- read_csv("Provisional_COVID-19_Deaths_by_Sex_and_Age.csv")
US_Covid19_clean = US_Covid19 %>%
  mutate_if(is.numeric, ~replace_na(., 0))

colnames(US_Covid19_clean)[2:3] = c("Start_Date", "End_Date")
colnames(US_Covid19_clean)[9:15] = c("Age_grp", "C19_deaths", "Total_deaths", "Pneu_deaths", "Pneu+C19_deaths", "Flu_deaths", "All_deaths")

US_Covid19_clean$End_Date <- as.Date(US_Covid19_clean$End_Date, '%m/%d/%Y')


library(shiny)

#Example
# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))


## Question 1
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Covid-19 data"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
