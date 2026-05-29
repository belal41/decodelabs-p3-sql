# SQL Data Analysis

project 3 from the DecodeLabs data analytics internship (batch 2026)

the goal here is to query the cleaned dataset using SQL and pull out business insights directly from the database instead of using python or spreadsheets.

---

## setup

imported Dataset_Cleaned.csv into SQL Server using the Import Flat File wizard in SSMS. the table ended up as `dbo.p3` in the `decodelabs` database.

- tool: SQL Server Management Studio 21
- server: DESKTOP-MAK8LFV (SQL Server 16)
- database: decodelabs
- table: p3
- rows: 1,200

---

## what i queried

went through the data with 15 queries covering:

- total orders and revenue overview (COUNT, SUM, AVG, MAX, MIN)
- revenue and order count by product (GROUP BY + ORDER BY)
- payment method breakdown with percentages
- order status breakdown — found something bad here (see below)
- cancelled orders and how much revenue was lost (WHERE)
- referral source analysis
- monthly revenue trend over 30 months
- top 10 highest value orders
- orders above average price (subquery)
- product + status cross breakdown
- coupon code usage
- units sold per product
- products with more than 200 orders (HAVING)

---

## things i found

the cancellation + return rate combined is 41.4% which means less than 1 in 5 orders actually gets delivered. that's a serious problem.

cancelled orders alone lost $276,396 in revenue. the average cancelled order ($1,105) is actually higher than the overall average ($1,053) so the cancellations are hitting the bigger orders harder.

instagram is the top referral channel with 259 orders and $275K revenue.

FREESHIP is the most used coupon at 313 times — free shipping clearly works better than percentage discounts.

chair and printer lead in total revenue (~$195K each) but laptop has the highest average order value at $1,110.

---

