# Student_Database


This project analyzes the performance of 28,785 students across 13 different regions using a structured relational database comprising 7 tables. The project aims to uncover key factors affecting student academic outcomes and propose actionable interventions to improve educational performance.

The analysis was performed using **SQL Server Management Studio (SSMS)** for data cleaning, transformation, and exploratory data analysis (EDA), while **Power BI** was used to visualize and communicate the insights, leveraging the **SQL Server import connector**.

---

## Project Objective

- Identify regional disparities in student performance.
- Evaluate the impact of learning materials (activity types) on student outcomes.
- Assess age-related performance trends.
- Propose targeted, data-driven solutions to improve academic results.

---

## Tools & Technologies

- **SQL Server Management Studio (SSMS)** – for data cleaning, transformation, and querying
- **T-SQL** – for advanced data manipulation and exploration
- **Power BI** – for building interactive dashboards and visualizations
- **SQL Server Ribbon Connector** – used to import processed data directly into Power BI

---

## Dataset Overview

- **Total Records:** 28,785 students
- **Tables Used:** 7 relational tables with links via student IDs and module activity logs
- **Regions:** 13 geographic regions across the UK
  
---

##  Key Analyses Performed

- Data integration and cleansing across 7 related tables
- Regional performance segmentation using group-based aggregations
- Analysis of activity types vs. academic grades
- Age group analysis to identify trends in performance
- Visualization of patterns and trends using Power BI dashboards

---

## Insights & Findings

### Regional Disparities in Academic Performance

- Students from **East Anglican**, **Scotland**, and **Yorkshire** had the **lowest academic performance** across all regions.
- Distance between **school locations** and **residential regions** was found to be a major contributing factor.
- *Insight:* Limited school access may lead to increased absenteeism or reduced academic engagement.

### Impact of Activity Type on Performance

- Students engaging primarily with the **“Homepage” module** had the **highest failure count (15 F’s)**.
- Other underperforming activity modules:
  - **Formng:** 8 F’s  
  - **Resources:** 4 F’s
- *Insight:* These materials may lack clarity, interactivity, or relevance to course objectives.

### Age Group and Performance Trends

- Students aged **0–35 years** showed a **50% poor performance rate**.
- Possible causes include:
  - Lack of concentration in class
  - Inability to afford tuition fees, leading to missed lectures
- *Insight:* Financial burden and classroom engagement are critical to learning outcomes.

---

## Recommendations

### Improve Educational Infrastructure

- Build **additional schools or learning centers** in underperforming regions to reduce travel barriers and improve accessibility.

### Review and Redesign Learning Materials

- Conduct a **thorough audit** of modules like *Homepage*, *Formng*, and *Resources*.
- Ensure materials are **simple, interactive, and easy to understand**.
- Replace or revise ineffective content based on student feedback and performance data.

###  Address Financial Barriers

- Introduce **subsidies or tuition waivers** for low-income students.
- Provide **scholarship programs** to minimize dropout rates due to financial challenges.

### Foster Classroom Engagement

- Train teachers to use **engaging teaching methods** and promote **interactive learning environments**.
- Incorporate digital tools and participation-based assessments to enhance concentration and retention.

