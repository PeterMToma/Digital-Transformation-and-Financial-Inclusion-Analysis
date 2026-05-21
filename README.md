# Digital Transformation Index (DTI) & Financial Inclusion

  # Project Idea

   This project investigates how Digital Transformation contributes to improving Financial Inclusion across five countries by analyzing key digital indicators such as E-Government services, Internet Penetration, and Digital Payments. The study evaluates trends over time, compares countries, measures relationships using correlation and regression techniques, and analyzes growth patterns to understand how digital progress influences financial access.

# Countries to be compared
   - Egypt
   - Saudi Arabia
   - United Arab Emirates
   - India
   - United Kingdom
  

# Time Period
   From 2015 to 2024

  
# Project Objectives

   * Analyze Digital Transformation trends over time.
   * Compare digital indicators across countries.
   * Measure the impact of DT indicators on Financial Inclusion.
   * Evaluate growth patterns across countries.
   * Identify which digital indicator has the strongest relationship with Financial Inclusion.


  
# Project Questions

   The project addresses the following key questions:
   
# Target Question 

   What is the impact of Digital Transformation on Financial Inclusion across the selected countries?


# ​Sub-Questions

   1- ​What is the level of Digital Transformation in each country?

   2- What differences exist between developing and developed countries in terms of Digital Transformation and Financial Inclusion?
    
   3- Which Digital Transformation dimensions (Internet Penetration, Digital Payments, and E-Government) represent strengths or weaknesses for each country?

   4- Does increased Digital Payments adoption contribute to higher levels of Financial Inclusion?

   5- Do countries with more advanced E-Government systems achieve higher levels of Financial Inclusion?

   6- Is there a relationship between Internet Penetration and Financial Inclusion?

   7- Which Digital Transformation dimension has the strongest impact on Financial Inclusion?

   8- Have countries that experienced significant digital development over recent years also shown improvements in Financial Inclusion indicators?

  

# ​Team Members

  Peter Toma

​  Abudallah Saleh

  Reham El Hawary

  Monia Mahmoud

  Noha Salah



# Project Plan

  Research & Analysis: 

# 1. Business Understanding
 * Define the main objective of the project.
 * Identify key research questions.
 * Determine Digital Transformation and Financial Inclusion indicators.



# 2. Data Sources
 * Global Findex Database
 * International Telecommunication Union (ITU)

   www.data360.worldbank.org  



# Data collection
# Gather datasets for:

# E-Government
  * OSI ( Onine Serice Index )
  * TII ( Telecommunication Infrastructure index )
  * HCI ( Human Capital Index )
  * EPI ( E-Participation Index )
    
# Internet Penetration
  * Actice Mobile Broaband Subscription
  * Fixed Broadband Subscription
  * Individuals Using the inernet
  * Price of fixed Broadband basket 5GB
  * Price of data-only mobile broadband bundle
  * Average Download Speed - Fixed Technologies
  * Average Download Speed - Mobile Technologies
    
# Digital Payments
  * Mobile Money Account
  * Used a mobile phone or the internet to buy something online
  * Made or received a digital paymen
    
# Financial Inclusion
  * Account Ownership
  * Borrowed from a formal bank or similar financial institution
  * Saved at a bank or similar financial institution
    
Goal : Build a multi-country, multi-indicator dataset

The study is based on 17 indicators grouped into four main pillars of Digital Transformation and Financial Inclusion Readiness to evaluate digital     transformation and financial inclusion    



# Data Preperation (Cleaning)

Data cleaning was performed to improve data quality and ensure consistency before analysis.

  * Steps Applied:
Handle missing values (NaN treatment)
Remove duplicate records
Standardize country names
Validate year formatting and consistency

  * Tools Used:
Power Query and Python



# Data Preperation (Normalization)

Normalization was applied to transform indicators into a common scale and ensure fair comparison across variables.

  * Method Used:
Min-Max Normalization

  * Formula
Normalized Value = (X − Min) / (Max − Min)

  * Tools Used
Power Query and Python

Goal : Ensure comparable values across indicators with different scales.


# Data Processing

To ensure fair comparison and consistent weighting across different indicators, a structured indexing approach was applied in two stages

1 - Sub-Indices Creation

Each digital dimension was first transformed into a sub-index to standardize indicators and preserve balanced weighting across components

  * E-Government Sub-Index
  * Internet Penetration Sub-Index
  * Digital Payments Sub-Index
  * Financial Inclusion Sub_Index

Sub-indices were created to preserve consistent weighting across components with different numbers of indicators (1, 2, and 3 indicators per dimension), ensuring a fair and comparable measurement structure across all dimensions of Digital Transformation.


After preparing the data, new analytical features were created to represent each dimension of Digital Transformation.

2 - Composite Indices (Topic Level)

Each domain was then aggregated into a composite index to represent its overall performance.

  * E-Government Composite Index
  * Internet Penetration Composite Index
  * Digital Payments Composite Index
  * Financial Inclusion Composite Index

To build a hierarchical indexing system that ensures consistency, comparability, and accurate representation of Digital Transformation levels.

3 - Final Digital Transformation Index (DT)

Finally, all composite indices were combined to construct a unified Digital Transformation Index, representing the overall digital maturity of each country.

  * Tools Used
Power Query and Python



# Database Creation & Integration

After collecting and cleaning the datasets, a structured database was created from the consolidated Excel sheets to organize all indicators into a unified format for further analysis.

  * Tasks Performed

* Combine cleaned Excel sheets into a single dataset
* Create structured tables and organize records
* Arrange data by country and year
* Integrate multiple indicators into one database
* Execute SQL queries for filtering and extraction

  * Tool Used
Excel sheets after cleaning → SQL Database → Analysis

  * Objective
To transform cleaned datasets into a structured database that supports efficient processing and analysis.



# Data Analysis verview

In this phase, the processed data was analyzed to extract insights about the relationship between Digital Transformation and Financial Inclusion across countries and over time.

  * Analytical Techniques Used
* Trend Analysis over time
* Cross-country comparison
* Correlation analysis (R)
* Regression analysis (R²)
* Growth analysis

  * Objective
To identify patterns, relationships, and the impact of Digital Transformation on Financial Inclusion.

1- Trend Analysis (Overview)

  * Trend Analysis
Trend analysis was used to examine the evolution of Digital Transformation and Financial Inclusion over time across the selected countries.

  * Visualization Type
Line Chart

  * Axes
X-Axis: Year
Y-Axis: Average Index Value

  * Insight Goal
TTo identify long-term trends and understand how digital development 
evolved alongside Financial Inclusion over time.


2- Digital Transformation Indicator 

  * Analysis Cross-Country Analysis
Cross-country analysis was used to compare Digital Transformation indicators across the selected countries and identify differences in performance levels

  * Visualization Type
Clustered Bar Charts

  * Axes
X-Axis: Countries
Y-Axis: Average Index Value

  * Insight Goal
To identify performance differences across countries and determine strengths and weaknesses in Digital Transformation dimensions.


3- Impact Analysis

Impact analysis was conducted to examine the relationship between Digital Transformation indicators and Financial Inclusion using statistical techniques.

  * Visualization Type
Scatter Charts

  * Analytical Methods
Correlation Analysis (R)
Regression Analysis (R²)

  * Axes
X-Axis: Digital Transformation Indicator
Y-Axis: Financial Inclusion Index

  * Insight Goal
To determine the strength of relationships and identify which Digital Transformation dimension has the strongest impact on Financial Inclusion.


3- Growth Analysis

Growth analysis was conducted to measure the rate of change in Digital Transformation and Financial Inclusion indicators across countries over time.

  * Visualization Type
Clustered Bar Chart

  * Analytical Methods
Correlation Analysis (R)
Regression Analysis (R²)

  * Axes
X-Axis: Indicators / Countries
Y-Axis: Growth Percentage (%)

  * Insight Goal
To evaluate how Digital Transformation and Financial Inclusion have evolved over time and identify which countries experienced the highest growth rates.



# Insights & Conclusion

# Key Insights

  1. Digital Transformation & Financial Inclusion Levels
United Kingdom leads in both Financial Inclusion (0.97) and Digital indicators.
United Arab Emirates and Saudi Arabia show strong digital performance but lower Financial Inclusion than the GBR.
 Egypt has the lowest Financial Inclusion level despite gradual digital improvements.

  2. Main Drivers of Financial Inclusion
Digital Payments is the strongest driver (R = 0.92, R² = 0.84)
Followed by E-Government (R = 0.86)
Internet Penetration has a moderate impact (R = 0.63)

This shows that financial digitization is more important than connectivity alone

3. Digital Transformation Impact
Strong positive relationship between DT Index and Financial Inclusion (R = 0.84)
Countries with higher DT levels tend to achieve higher financial inclusion.

4. Growth Analysis (Key Findings)
   
  * Digital Transformation Growth
Highest growth: India (+88%)
Negative growth in mature countries like UK and Egypt (stability / saturation effect)

  * Digital Payments Growth
Massive growth in Egypt (+1828%) and India (+583%)
Confirms rapid financial digitization in developing economies
Project Plan
Insights & Conclusion

  * Internet Growth
India shows extreme growth (+169%)
Developed countries show slight decline (saturation)

  * Financial Inclusion Growth
Highest improvement: Egypt (+149%) and Saudi Arabia (+44%)
UAE shows decline (-28%) despite high digital levels


# Final Conclusion

The analysis confirms that Digital Transformation has a strong and positive impact on Financial Inclusion. Among all digital dimensions, Digital Payments is the most influential factor. Developing countries show faster growth rates, while developed countries maintain high but stable levels, indicating maturity in digital infrastructure.

“ Digital Transformation is a key enabler of Financial Inclusion, with Digital Payments acting as the strongest bridge between digital development and financial accessibility.”










    




