# Load libraries

library(shiny)
library(shinydashboard)
library(data.table)
library(DT)

# Load data
dt_summary = data.table::fread("./data/data_summary.txt", sep=",")

# Global reference
dt_summary <<- dt_summary

# List catalogs

disease_list = c("Musculoskeletal Diseases", "Ophthalmology", "Autoimmunity", 
                 "Transplantation & Inflammatory Disease", "Cardiovascular & Metabolic Diseases", "Oncology",
                 "Neuroscience")
disease_list <<- disease_list

disease_list_2 = c("Lymphoma - Non-Hodgkin",
                   "Lung Cancer",
                   "Colorectal Cancer",
                   "Breast Cancer",
                   "Bladder Cancer", 
                   "Kidney Cancer")
disease_list_2 <<- disease_list_2

cts_list = c("AMALEE: Study of 2 Ribocidib Doses in Combination With Aromatase Inhibitors in Women With HR +, HER2- Advanced Breast Cancer", 
             "BYlieve:Study Assessing the efficacy and Safety of Alpelisib Plus Fulvestrant or Letrozole, Based on Prior Endocrine Therapy,in Patients With PIK3CA Mutation With Advanced Breast Cancer Who Have Progressed on or After Prior Treatments",
             "SOLAR-1:Study Assessing the Efficacy and Safety of Alpelisib Plus Fulvestrant in Men and Postmenopausal Women With Advanced Breast Cancer Which Progressed on or After Aromatase Inhibitor Treatment",
             "LEADER: CDK4/6 Inhinitor, Ribocidib, With Adjuvant Endocrine Therapy for ER- positive Breast Cancer",
             "Comparison of Single-Agent Carboplatin vs the Combination of Carboplatin and Everolimus for the Treatment of Advanced Triple-Negative Breast Cancer",
             "Study of Safety and Efficacy of DKY709 Alone or in Combination With PDR001 in Patients With Advanced Solid Tumors")
cts_list <<- cts_list

rwd_list = c("Optum EHR",
             "MarketScan",
             "Flatiron",
             "CPRD",
             "UK Biobank",
             "Adelphi",
             "JMDC")
rwd_list <<- rwd_list