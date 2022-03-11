source("global.R")

#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$data_summary = DT::renderDataTable({
        
        DT::datatable(dt_summary, # Reactive context, data loaded using reactivity
                      options = list(lengthMenu=list(c(5,15,20), c('5','15','20')), pageLength=6,
                                     initComplete = JS("function(settings, json) {",
                                                       "$(this.api().table().header()).css({'background-color': 'moccasin', 
                                                          'color': '1c1b1b'});",
                                                       "}"),
                                     columnDefs=list(list(className='dt-center',targets="_all")), searching = FALSE),
                      filter = "top",
                      selection = 'multiple',
                      style = 'bootstrap',
                      class = 'cell-border stripe',
                      rownames = FALSE)
        
    })
    
    output$circles <- renderUI({
        withMathJax(
        tags$h2("Adverse events"),
        "This visualisation is based on Circos, a way of visualising whole adverse events relation.
         This is a simple mockup in order to explain a way to identify common adverse events in CTS and RWE.
         Inspired from genomics analysis.",
        br(),
        tags$img(src="cloro.PNG")
        )
    })

    output$comorbidiy_analysis <- renderUI({
        withMathJax(
        "TO-DO: A description for comorbidiy analysis",
        br(),
        tags$img(src="comorbidity_analysis.png")
        )
    })
    
    output$survival_analysis <- renderUI({
        withMathJax(
        "TO-DO: A description for survival analysis",
        br(),
        tags$img(src="survival_analysis.PNG")
        )
    })
    
    output$adverse_analysis <- renderUI({
        withMathJax(
        "TO-DO: A description for survival analysis",
        br(),
        tags$img(src="adverse_events_analysis.png")
        )
    })
    
    output$adverse_analysis_2 <- renderUI({
        withMathJax(
        "TO-DO: A description for survival analysis",
        br(),
        tags$img(src="adverse_events_analysis_2.png")
        )
    })
    
    output$clustering_h <- renderUI({
        withMathJax(
        tags$h2("heatmap-hierarchical comorbidities"),
        br(),
        tags$img(src="hierarchical_clutering.PNG")
        )
    })
    
    output$clustering <- renderUI({
        withMathJax(
        tags$h2("Clustering comorbidities"),
        br(),
        tags$img(src="clustering.PNG")
        )
    })

})
