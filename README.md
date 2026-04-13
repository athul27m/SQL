# Zepto Product Analysis — SQL Project

I came across this dataset on Kaggle and thought it would be 
interesting to dig into how Zepto structures its pricing and 
discounts across 3,000+ products. As someone who uses Zepto 
regularly, I wanted to see if the "great deals" actually hold 
up in the data.

---

## Dataset

Source: Kaggle — [Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv)
Around 3,000 SKUs with fields like category, MRP, discount 
percentage, selling price, weight, and stock status.

One thing I noticed early on was that prices were stored in 
paise (so ₹58 showed up as 5800). Cleaned that up before 
starting any analysis.

---

## Questions I explored

| # | Question |
|---|---|
| Q1 | Stock vs out-of-stock count across the catalog |
| Q2 | Products with 0% discount, sold at full MRP |
| Q3 | Biggest gap between MRP and actual selling price |
| Q4 | Which categories generate the most live inventory value |
| Q5 | Ranking products by discount within each category |
| Q6 | Highest MRP product per category |
| Q7 | Cumulative inventory value per category |
| Q8 | Average discount by product weight bucket |

---

## What I found

- 12.1% of products are out of stock at any given time.
- Cooking Essentials has the highest live inventory value at ₹3,37,131
  which makes sense given how frequently those items are bought.
- 516 products are sold at full MRP with no discount 
  whatsoever, more than I expected honestly
- Heavier products above 2kg get the best average discount 
  at 8.3%, while lighter everyday items sit lower at around 
  7.5 to 7.8% — I expected the opposite going into this

---

## Tools
MySQL Workbench

---

**Athul Murali**  
[LinkedIn](www.linkedin.com/in/athul-murali)
