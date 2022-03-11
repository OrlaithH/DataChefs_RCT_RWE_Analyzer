# Header page
header = dashboardHeader(title = "RCT / WRE Engine Analyzer",
                         tags$li(class="dropdown",
                                 tags$a(href="https://github.com/jasam/multi_method_comparison", 
                                        icon("github"), "Source Code", target="_blank")))

# Side Menu
sidebar = dashboardSidebar(sidebarMenu(
    menuItem("Introduction", tabName = "intro", icon = icon("question-circle-o")),
    menuItem("Insight Discovery", tabName = "crt", icon = icon("folder-open-o")),           
    menuItem("Experimental", tabName = "ind", icon = icon("clone"))           
    ))

# Body Page
body = dashboardBody(
    
    tabItems(tabItem(tabName = "intro",
                     h2("RealWEthon22"),
                     h3('Challenge: Develop a disease exploration platform (R-shiny or python) with pooled data from RCTs and RWE'),
                     h3("Welcome to RCT / RWE Engine Analyzer solution"),
                     shiny::p("What if we could have a platform where we could visualize data form our RWD sources in a new way. 
                               Not only looking from disease onset but also what happens before? Are there patterns we can visualize and see 
                               emerging from the data on a holistic patient journey. A platform which enables us to interactively look at our 
                               data not just to a specific disease area but all of them and how they might be connected. Can we combine ML with 
                               our VizARD capabilities?, This platform should be a tool to consult especially in the early stages of our drugs 
                               lifecycle up to five years before launch to help our understanding of the disease area. What insights would be useful? 
                               Could a disease “network” be visualized? What other innovative visualizations could bring value to our teams 
                               in Pharma and Oncology?"),
                     shiny::p(tags$a(href="https://share.novartis.net/sites/RealWEthon22/SitePages/Challenge-n-1.aspx",
                                     icon("file-pdf"), 
                                     target="_blank", "RealWEthon22 - Challenge 1" 
                     )),
                     h3('Team'),
                     shiny::p("DataChefs"),
                     h3('Contributors'),
                     shiny::p('This solution was created by'),
                     tags$ul(
                         tags$li(tags$a(href="", 
                                        icon="github", target="_blank",
                                        "Priyanka, Priyanka-1"))
                     ),
                     tags$ul(
                         tags$li(tags$a(href="", 
                                        icon="github", target="_blank",
                                        "Hickey, Orlaith"))
                     ),
                     tags$ul(
                         tags$li(tags$a(href="", 
                                        icon="github", target="_blank",
                                        "Foley, Stephen"))
                     ),
                     tags$ul(
                         tags$li(tags$a(href="", 
                                        icon="github", target="_blank",
                                        "Noone, Gearoid"))
                     ),
                     tags$ul(
                         tags$li(tags$a(href="", 
                                        icon="github", target="_blank",
                                        "Javier Rey"))
                     ),
                     tags$ul(
                         tags$li(tags$a(href="", 
                                        icon="github", target="_blank",
                                        "Conector: Goodson, Forrest"))
                     ),
                     h3('Source code'),
                     shiny::p('The source code V.1 for this application can be found at ', tags$a(href="https://jasam.shinyapps.io/multi_method_comparison/", icon("github"), target="_blank", "https://jasam.shinyapps.io/multi_method_comparison/")),
                     shiny::p('Bug reports and feature requests can be submitted through the GitHub issues page ',  
                              tags$a(href="https://github.com/jasam/multi_method_comparison/issues", icon("github"), 
                                     target="_blank", "https://github.com/jasam/multi_method_comparison/issues")),
                     
                     h3('Packages used'),
                     shiny::p('1. data.table: Extension of `data.frame`', tags$a(href="https://CRAN.R-project.org/package=data.table/", 
                                                                                 icon("file-pdf"), 
                                                                                 target="_blank", "https://CRAN.R-project.org/package=data.table")),
                     
                     shiny::p('2. DT: A Wrapper of the JavaScript Library DataTables', tags$a(href="https://github.com/rstudio/DT/", 
                                                                                              icon("file-pdf"), 
                                                                                              target="_blank", "https://github.com/rstudio/DT")),
                     
                     shiny::p('3. shiny: Web Application Framework for R', tags$a(href="https://shiny.rstudio.com/", 
                                                                                  icon("file-pdf"), 
                                                                                  target="_blank", "https://shiny.rstudio.com/")),
                     
                     shiny::p('4. shinydashboard: Create Dashboards with Shiny', tags$a(href="http://rstudio.github.io/shinydashboard/", 
                                                                                         icon("file-pdf"), 
                                                                                         target="_blank", "http://rstudio.github.io/shinydashboard/")),
                     
                     shiny::HTML("<a rel='license' href='http://creativecommons.org/licenses/by-nc/4.0/'><img alt='Creative Commons Licence' 
                                 style='border-width:0' src='https://i.creativecommons.org/l/by-nc/4.0/88x31.png' 
                                 /></a><br />This work is licensed under a <a rel='license' 
                                 href='http://creativecommons.org/licenses/by-nc/4.0/'>Creative Commons Attribution-NonCommercial 4.0 International License</a>.")
    ),
    tabItem(tabName = "crt", 
            box(title = "Parameters selector", status = "primary", solidHeader = TRUE, width = 12,
                collapsible = T,collapsed = F,
                fluidRow(column(width=2, selectInput("disease_area", label = "Disease Area", choices = disease_list)),
                         column(width=2, selectInput("disease", label = "Disease", choices = disease_list_2)) 
                        ),
                fluidRow(column(width=7, selectInput("rct", label = "Randomized Clinical Trial", choices = cts_list)),
                         column(width=2, selectInput("rwd", label = "Real World Data", choices = rwd_list)) 
                        )
                ),
            tabBox(title = "Insights Discovery", id = "tab_report", width = 12,
                   tabPanel("Data Summary",
                            fluidRow(column(DT::dataTableOutput("data_summary"),
                                            width = 10)
                                     )
                            ),
                   tabPanel("Survival Analysis",
                            uiOutput("survival_analysis")
                            ),
                   tabPanel("Comorbidity Analysis",
                            uiOutput("comorbidiy_analysis")
                            ),
                   tabPanel("Adverse Events Analysis",
                            fluidRow(column(width=6, uiOutput("adverse_analysis")
                                            ),
                                     column(width=6, uiOutput("adverse_analysis_2")
                                            )
                                     )
                            )
                   )
            ),
    tabItem(tabName = "ind",
            tabBox(title = "Insights Discovery", id = "tab_cluster", width = 12,
                   tabPanel("Circles plot",
                            uiOutput("circles")
                            ),
                   tabPanel("Hierarchical Heatmap",
                            uiOutput("clustering_h")
                            ),
                   tabPanel("Clustering",
                            uiOutput("clustering")
                            )
                   )
           )
    )
    
)

## Deploy page
dashboardPage(header, sidebar, body)