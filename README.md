# Zepto Product Analysis — SQL Project

I came across this dataset on Kaggle and thought it would be 
interesting to dig into how Zepto structures its pricing and 
discounts across 3,000+ products. As someone who uses Zepto 
regularly, I wanted to see if the "great deals" actually hold 
up in the data.

---

## Dataset

Source: Kaggle — [Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv)
~3,000 SKUs with fields like category, MRP, discount %, 
selling price, weight, and stock status.

One thing I noticed early — prices were stored in paise 
(₹58 showed up as 5800), so I cleaned that up before 
any analysis.

---

## Questions I explored

| # | Question |
|---|---|
| Q1 | Stock vs out-of-stock count across the catalog |
| Q2 | Products with 0% discount — sold at full MRP |
| Q3 | Biggest gap between MRP and actual selling price |
| Q4 | Which categories generate the most live inventory value |
| Q5 | Ranking products by discount within each category |
| Q6 | Highest MRP product per category |
| Q7 | Cumulative inventory value per category |
| Q8 | Average discount by product weight bucket |

---

## What I found

- Around X% of products are currently out of stock — 
  [category] had the worst availability
- [Category] leads in live inventory value at roughly ₹[X]
- [X] products are sold at full MRP with zero discount, 
  mostly concentrated in [category]
- Medium weight products (500g–2kg) get the highest 
  average discount at X% — makes sense for everyday 
  grocery staples

---

## Tools
PostgreSQL · MySQL Workbench

---

**Athul Murali**  
[LinkedIn](#) · [GitHub](https://github.com/athul27m)
