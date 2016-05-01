# More info:
#   https://github.com/jcheng5/googleCharts
# Install:
#   devtools::install_github("jcheng5/googleCharts")
library(googleCharts)

# Use global max/min for axes so the view window stays
# constant as the user moves between years
xlim <- list(
        min = 6,#min(data$GDP) - 5,
        max = 12#max(data$GDP) + 5
)
ylim <- list(
        min = min(data$Life.Ladder),
        max = max(data$Life.Ladder) + 2
)

shinyUI(fluidPage(
        # This line loads the Google Charts JS library
        googleChartsInit(),
        
        # Use the Google webfont "Source Sans Pro"
        tags$link(
                href=paste0("http://fonts.googleapis.com/css?",
                            "family=Source+Sans+Pro:300,600,300italic"),
                rel="stylesheet", type="text/css"),
        tags$style(type="text/css",
                   "body {font-family: 'Source Sans Pro'}"
        ),
        titlePanel(
                h1("Visualizing Global Happiness")
        ),
        sidebarLayout(
                sidebarPanel(
                        h6("Author: E. Bradley"),
                        h6("Date: 5/1/2016"),
                        h6("Coursera/JHU Data Products - Final Project"),
                        h6("Data source: ", a(href="http://worldhappiness.report","World Happiness Report")),
                p("There is burgeoning interest in happiness being just as important of a global metric as GDP. The World Happiness Report 2016 Update provides a CSV file of data for 156 countries from 2005-2015 (non-exhaustive).The goal of this class project is to present this data in an interactive form.",br(),strong("Instructions:"),br(),"Press play or select a year to visualize how the relationship between Happiness (y-axis) changes with respect to GDP (x-axis) for each country (circle). The colors represent global region and the size of the markers corresponds to population in 2005. Mouseover circles to see values."),
                sliderInput("year", "Year",
                            min = min(data$year), max = max(data$year),
                            value = min(data$year), step=1, animate = TRUE)
                ),
                mainPanel(
        googleBubbleChart("chart",
                          width="100%", height = "475px",
                          # Set the default options for this chart; they can be
                          # overridden in server.R on a per-update basis. See
                          # https://developers.google.com/chart/interactive/docs/gallery/bubblechart
                          # for option documentation.
                          options = list(
                                  fontName = "Source Sans Pro",
                                  fontSize = 13,
                                  # Set axis labels and ranges
                                  hAxis = list(
                                          title = "Log GDP per capita",
                                          viewWindow = xlim
                                  ),
                                  vAxis = list(
                                          title = "Happiness Index",
                                          viewWindow = ylim
                                  ),
                                  # The default padding is a little too spaced out
                                  chartArea = list(
                                          top = 50, left = 75,
                                          height = "75%", width = "75%"
                                  ),
                                  # Allow pan/zoom
                                  explorer = list(),
                                  # Set bubble visual props
                                  bubble = list(
                                          opacity = 0.4, stroke = "none",
                                          # Hide bubble label
                                          textStyle = list(
                                                  color = "none"
                                          )
                                  ),
                                  # Set fonts
                                  titleTextStyle = list(
                                          fontSize = 16
                                  ),
                                  tooltip = list(
                                          textStyle = list(
                                                  fontSize = 12
                                          )
                                  )
                          )
        )
   
        )
        )))
