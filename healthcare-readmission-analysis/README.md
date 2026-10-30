# 🏥 Healthcare Analytics — Hospital Readmission Analysis

### Diabetes 130-US Hospitals | 1999–2008

![Python](https://img.shields.io/badge/Python-Pandas-3776AB?style=flat&logo=python&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL-Server-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=flat&logo=powerbi&logoColor=black)
![Healthcare Analytics](https://img.shields.io/badge/Domain-Healthcare%20Analytics-0F766E?style=flat)

> An end-to-end healthcare analytics project exploring hospital readmissions, patient encounter patterns, and opportunities to strengthen post-discharge follow-up.

---

## 📌 Project Overview

Hospital readmissions are an important quality and operational measure. Understanding which patient encounter groups have higher readmission rates can help healthcare teams investigate discharge processes and plan follow-up support.

This project analyzes the **Diabetes 130-US Hospitals for Years 1999–2008** dataset. It uses Python and Pandas for data preparation and exploratory analysis, SQL Server for business analysis, and Power BI for interactive reporting.

The project focuses on **30-day readmission patterns**, prior inpatient utilization, patient age groups, and indicators available in the dataset. The results are descriptive and intended to support further investigation—not to make clinical predictions or establish causation.

### Dataset at a Glance

| Metric | Result from the uploaded dataset |
|---|---:|
| Hospital encounters | 101,766 |
| Unique patient identifiers | 71,518 |
| Dataset fields | 50 |
| Encounters readmitted within 30 days (`<30`) | 11,357 |
| 30-day readmission rate | **11.16%** |
| Encounters with any recorded readmission (`<30` or `>30`) | 46,902 |
| Any-readmission rate | **46.09%** |
| Average length of stay | 4.40 days |
| Median length of stay | 4 days |

*The 30-day rate is calculated as encounters labeled `<30` divided by all encounters. “Any readmission” includes both `<30` and `>30` labels. These are encounter-level results, not unique-patient readmission rates.*

---

## 🎯 Business Problem

Hospitals need to understand readmission patterns to investigate opportunities for safer transitions of care, better discharge planning, and appropriate follow-up.

A single overall rate can hide differences between patient encounter groups. This project addresses the following business questions:

1. What percentage of hospital encounters result in readmission within 30 days?
2. Which patient groups and encounter characteristics are associated with higher readmission rates?
3. How is prior inpatient utilization associated with 30-day readmission?
4. What patterns appear across age groups and diabetes-related indicators?
5. Which patient groups may warrant closer review of discharge and follow-up processes?

The analysis uses the data's recorded readmission outcome and available encounter characteristics. It does not claim that a particular factor causes readmission.

---

## 💡 Recommendations

The recommendations below are tied to the observed dataset patterns and should be treated as **operational investigation priorities**. Clinical teams should validate any care-process changes against current clinical guidance and local evidence.

### 1. Prioritize review of encounters with repeated prior inpatient use

| Prior inpatient visits recorded | Encounters | 30-day readmission rate |
|---|---:|---:|
| 0 prior inpatient visits | 67,630 | 8.44% |
| 1 prior inpatient visit | 19,521 | 12.92% |
| 2+ prior inpatient visits | 14,615 | **21.40%** |

The 30-day readmission rate is approximately **2.54 times as high** for encounters with 2+ prior inpatient visits compared with those with no prior inpatient visits.

**Recommended action:** Use prior inpatient utilization as a flag for further discharge-planning review. Consider checking whether follow-up arrangements, medication reconciliation, and patient education are completed for these encounters. This dataset shows association, not proof that these interventions will reduce readmissions.

### 2. Review discharge-transition patterns by disposition

Some discharge disposition groups show higher recorded 30-day readmission rates. For example, disposition ID 22 has a **27.70%** rate across 1,993 encounters, and disposition ID 2 has a **16.07%** rate across 2,128 encounters.

**Recommended action:** Use the companion `IDS_mapping.csv` file to translate disposition IDs before assigning operational meaning. Then investigate the largest and highest-rate discharge groups with clinical and care-transition teams. Do not interpret numeric IDs without their mapping.

### 3. Examine older-adult encounter groups as part of a broader review

The 80–90 age band has a **12.08%** 30-day readmission rate across 17,197 encounters. The 70–80 group has an **11.77%** rate across 26,068 encounters.

**Recommended action:** Compare discharge disposition, prior inpatient utilization, and follow-up processes within these age bands. Age alone should not be used as a clinical decision rule.

### 4. Improve completeness of diabetes-related laboratory documentation

The `A1Cresult` field is missing for **84,748 encounters (83.28%)**. The `max_glu_serum` field is also frequently unavailable.

**Recommended action:** Treat missingness as a data-quality and analysis limitation. Before drawing conclusions about glycemic indicators and readmission, assess whether missing values reflect testing practice, data capture, or another process. Do not treat missing test results as normal.

### 5. Monitor the 30-day readmission rate with utilization context

The overall 30-day readmission rate is **11.16%**, while encounter groups with 2+ prior inpatient visits show a **21.40%** rate.

**Recommended action:** Track the overall rate alongside prior-utilization groups, discharge disposition, and encounter volume. This provides a more useful operational view than the overall KPI alone.

---

## 🔎 Key Findings

### Readmission distribution

| Readmission outcome | Encounters | Share of encounters |
|---|---:|---:|
| No recorded readmission (`NO`) | 54,864 | 53.91% |
| Readmitted after 30 days (`>30`) | 35,545 | 34.93% |
| Readmitted within 30 days (`<30`) | 11,357 | 11.16% |

### Prior inpatient utilization

The strongest descriptive pattern in this analysis is the association between prior inpatient visits and 30-day readmission:

- 0 prior inpatient visits: **8.44%**
- 1 prior inpatient visit: **12.92%**
- 2 or more prior inpatient visits: **21.40%**

This pattern supports prioritizing repeated inpatient utilization for further investigation, while recognizing that the dataset does not establish causality.

### Age-group pattern

| Age group | Encounters | 30-day readmission rate |
|---|---:|---:|
| 20–30 | 1,657 | 14.24% |
| 70–80 | 26,068 | 11.77% |
| 80–90 | 17,197 | 12.08% |
| 90–100 | 2,793 | 11.10% |

The 20–30 age band has the highest displayed rate among these groups, but it contains substantially fewer encounters than older age bands. Rates should be interpreted alongside sample size.

---

## 🔄 Project Workflow

```text
Business Problem
      ↓
Dataset Understanding
      ↓
Data Quality Assessment
      ↓
Data Cleaning & Preparation
      ↓
Exploratory Data Analysis (EDA)
      ↓
SQL Business Analysis
      ↓
Root Cause Investigation
      ↓
Power BI Dashboard
      ↓
Evidence-Based Recommendations
```

### 1. Business Problem Definition
Define readmission measures, analysis groups, and the operational questions to investigate.

### 2. Dataset Understanding
- Inspect the dataset dimensions, columns, data types, and outcome labels.
- Distinguish encounter-level records from patient-level identifiers.
- Review the mapping file for admission, discharge, and admission-source IDs.

### 3. Data Cleaning & Preparation
- Check duplicate encounter identifiers.
- Review missing values and the dataset's `?` missing-value convention.
- Preserve `NO`, `>30`, and `<30` as separate readmission outcomes.
- Create clear prior-inpatient-visit groups for analysis.
- Avoid treating missing clinical values as normal values.

### 4. Exploratory Data Analysis
- Analyze readmission outcomes and length of stay.
- Compare 30-day readmission rates by age group.
- Investigate prior inpatient, emergency, and outpatient utilization.
- Examine available diabetes-related indicators and discharge patterns.

### 5. SQL Analysis
Use SQL Server to calculate encounter counts, readmission rates, and comparisons across patient and encounter groups.

### 6. Root Cause Investigation
Explore patterns that may warrant operational review, especially repeated prior inpatient utilization and discharge-transition groups. The available observational data cannot confirm root causes.

### 7. Power BI Dashboard
Build an interactive dashboard for readmission KPIs, patient-group comparisons, and encounter-level patterns.

### 8. Recommendations
Translate the validated findings into practical questions and review priorities for hospital operations and care-transition teams.

---

## 🧰 Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data analysis |
| Pandas | Data cleaning, grouping, aggregation, and EDA |
| SQL Server / SSMS | Business queries and metric validation |
| Power BI | Interactive dashboard and KPI reporting |
| Jupyter Notebook | Analysis environment and documentation |
| GitHub | Project version control and portfolio |

---

## 📊 Power BI Dashboard

The dashboard is designed to provide an overview of readmission patterns and allow users to explore encounter groups.

### Executive Overview
- Total Encounters
- 30-Day Readmission Encounters
- 30-Day Readmission Rate
- Any-Readmission Rate
- Average Length of Stay

### Readmission Analysis
- Readmission outcome distribution
- 30-day readmission rate by age group
- 30-day readmission rate by prior inpatient visits
- Readmission rate by discharge disposition

### Encounter & Utilization Analysis
- Prior inpatient, emergency, and outpatient utilization
- Length of stay
- Diabetes medication indicators
- Available A1C and glucose result categories

### Suggested Filters
- Age
- Gender
- Race
- Admission type
- Discharge disposition
- Prior inpatient visits
- Diabetes medication indicator
- Readmission outcome

> The dashboard should use encounter-level denominators for encounter rates. Patient-level analyses require an explicit patient-level method.

---

## 🗂️ Project Structure

```text
healthcare-readmission-analysis/
├── data/
│   ├── diabetic_data.csv
│   └── IDS_mapping.csv
├── notebooks/
│   └── healthcare_readmission_analysis.ipynb
├── sql/
│   └── healthcare_readmission_analysis.sql
├── powerbi/
│   └── healthcare_readmission_dashboard.pbix
├── images/
│   └── dashboard-screenshot.png
└── README.md
```

---

## 📁 Dataset

**Dataset:** Diabetes 130-US Hospitals for Years 1999–2008

- [UCI Machine Learning Repository — Diabetes 130-US Hospitals](https://archive.ics.uci.edu/dataset/296/diabetes+130+us+hospitals+for+years+1999+2008)
- [Original paper — Impact of HbA1c Measurement on Hospital Readmission Rates](https://doi.org/10.1109/CBMS.2014.41)

The project uses the encounter dataset, commonly named `diabetic_data.csv`, and the companion mapping file `IDS_mapping.csv` for categorical ID definitions.

### Important Fields

| Field | Description |
|---|---|
| `encounter_id` | Hospital encounter identifier |
| `patient_nbr` | Patient identifier |
| `age` | Age band |
| `time_in_hospital` | Length of stay in days |
| `number_inpatient` | Prior inpatient visits in the recorded lookback |
| `number_emergency` | Prior emergency visits in the recorded lookback |
| `number_outpatient` | Prior outpatient visits in the recorded lookback |
| `A1Cresult` | Recorded A1C result category |
| `max_glu_serum` | Recorded maximum glucose serum category |
| `diabetesMed` | Whether diabetes medication was recorded |
| `readmitted` | Readmission outcome: `NO`, `>30`, or `<30` |

---

## ⚠️ Data & Methodology Notes

- The uploaded file contains **101,766 encounters** and **71,518 distinct patient identifiers**.
- Each row represents a hospital encounter; repeated patient identifiers can occur across encounters.
- The 30-day readmission rate is calculated as `readmitted = '<30'` divided by all encounters.
- “Any readmission” is calculated as `readmitted != 'NO'`, including both `>30` and `<30`.
- The analysis is observational and historical. It does not prove that any feature causes readmission.
- Missing values are represented in some fields by `?`; laboratory-result fields also contain missing values.
- The uploaded encounter file alone does not provide mapped meanings for admission, discharge, and source IDs. Use `IDS_mapping.csv` before interpreting those IDs.
- This dataset does not include post-discharge follow-up completion, patient satisfaction, or detailed clinical outcomes. Recommendations are limited to patterns available in the dataset.
- Results should not be treated as current hospital performance or a clinical risk model.

---

## 👤 Author

**Habibur Rahaman**  
Aspiring Data Analyst | Python | Pandas | SQL | Power BI

- [LinkedIn](https://www.linkedin.com/in/habiburrahamankolkata)
- [GitHub Portfolio](https://github.com/habibur-rahaman-data-analytics)
