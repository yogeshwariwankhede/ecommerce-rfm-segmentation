-- Step 1: Calculate R, F, M per customer
WITH rfm_base AS (
    SELECT
        CustomerID,
        CAST(JULIANDAY('2012-01-01') - JULIANDAY(MAX(InvoiceDate)) AS INTEGER) AS Recency,
        COUNT(DISTINCT InvoiceNo) AS Frequency,
        ROUND(SUM(TotalAmount), 2) AS Monetary
    FROM orders_clean
    GROUP BY CustomerID
),

-- Step 2: Score each customer 1-5 using NTILE
rfm_scores AS (
    SELECT
        CustomerID,
        Recency,
        Frequency,
        Monetary,
        NTILE(5) OVER (ORDER BY Recency DESC) AS R,
        NTILE(5) OVER (ORDER BY Frequency ASC) AS F,
        NTILE(5) OVER (ORDER BY Monetary ASC) AS M
    FROM rfm_base
)

-- Step 3: Combine into single RFM score
SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    R, F, M,
    CAST(R AS TEXT) || CAST(F AS TEXT) || CAST(M AS TEXT) AS RFM_Score
FROM rfm_scores
ORDER BY RFM_Score DESC;