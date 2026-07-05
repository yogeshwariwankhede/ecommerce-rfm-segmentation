# RFM Customer Segmentation

Segmented 4,219 e-commerce customers using RFM analysis to identify high-value groups and drive retention strategy.

---

## Results

| Segment | Customers | Revenue Share | Avg Order Value |
|---|---|---|---|
| Champion | 956 | 64.7% | £5,632 |
| Loyal | 932 | 17.1% | £1,522 |
| At-Risk | 643 | 10.3% | £1,327 |
| Lost | 1,532 | 7.6% | £413 |
| New | 156 | 0.3% | £170 |

**Key insight:** Champions are just 22.7% of customers but drive 64.7% of all revenue.

---

## Dashboard
[View on Tableau Public →](https://public.tableau.com/app/profile/yogeshwari.wankhede/viz/Book1_17832518973180/Dashboard1)

---

## Tech Stack
Python · pandas · SQL (SQLite) · Tableau Public · Git

## Methodology
1. Loaded 541,909 transactions from UCI Online Retail dataset
2. Cleaned data — removed nulls, cancellations, negative quantities
3. Calculated RFM scores using SQL window functions (NTILE)
4. Segmented customers using CASE WHEN logic
5. Visualised in Tableau Public

## Dataset
[UCI Online Retail Dataset](https://www.kaggle.com/datasets/carrie1/ecommerce-data) — 500K+ UK transactions, 2010–2011