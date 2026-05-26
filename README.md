# GA4-Ecommerce-Funnel-Analysis
A 4 stage funnel analysis of the google merchandise store using Bigquery SQL
# Google Data Analytics Capstone: E-Commerce Purchase Funnel Analysis

## 📌 Project Overview
This project evaluates the multi-stage user purchase funnel of the Google Merchandise Store using a 3-month raw event-level GA4 dataset. The objective is to identify the stage with the highest customer drop-off (volume leak) and determine if behavioral patterns or optimization opportunities vary significantly across user device categories (Desktop, Mobile, Tablet).

### 🔑 Key Findings
* **The Core Friction Point:** The heaviest customer loss occurs at the very beginning of the journey (**Session Start to Product View**). Across all hardware platforms, roughly **77% of users drop off immediately** upon landing on the homepage without exploring a single product page. 
* **The "Commitment Cliff":** The transition from product viewing to cart-adding is a steep funnel filter, but lower-funnel velocity spikes immediately after. Users who cross this barrier and initiate checkout convert at an elite checkout-to-purchase rate of **44% to 46%**, with mobile environments leading transaction efficiency.

---

## 🛠️ Tech Stack & Skills Demonstrated
* **Data Warehousing & Querying:** Google BigQuery (SQL)
* **Analytical Frameworks:** Behavioral Cohort Analysis, Funnel Modeling, Business Intelligence Reporting

---

## 📈 Final Data Matrix


| Device Type | Session to View | View to Cart | Cart to Checkout | Checkout to Purchase |
| :--- | :---: | :---: | :---: | :---: |
| **💻 Desktop** | 23.12% | 20.33% | 76.72% | 44.85% |
| **📱 Mobile**  | 22.98% | 20.73% | 77.17% | **46.65%** |
| **📟 Tablet**  | 23.37% | 19.13% | **79.35%** | 44.29% |

---

## 🎯 Strategic Business Recommendations
1. **Optimize Homepage Real Estate:** Since 77% of global site traffic bounces on landing, immediate conversion efforts should focus on homepage layout optimization, intuitive search bar routing, and automated trending product placement.
2. **Reallocate Marketing Budgets to Mobile Traffic:** Mobile users display highly efficient transactional completion rates once lower-funnel intent is locked. Marketing acquisition strategies should confidently ramp up ad spend targeting mobile environments.

---
📝 *Read the comprehensive case study break-down on my [Medium Article Page](YOUR_MEDIUM_LINK_HERE).*  
