-- Assign segments based on R, F, M scores
WITH segmented AS (
    SELECT
        CustomerID,
        Recency,
        Frequency,
        Monetary,
        R, F, M,
        RFM_Score,
        CASE
            WHEN R >= 4 AND F >= 4 AND M >= 4 THEN 'Champion'
            WHEN R >= 3 AND F >= 3             THEN 'Loyal'
            WHEN R <= 2 AND F >= 3             THEN 'At-Risk'
            WHEN R >= 4 AND F = 1              THEN 'New'
            ELSE                                    'Lost'
        END AS Segment
    FROM rfm_scores
)

SELECT
    Segment,
    COUNT(*)                                    AS CustomerCount,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS PctCustomers,
    ROUND(SUM(Monetary), 2)                     AS TotalRevenue,
    ROUND(SUM(Monetary) * 100.0 / SUM(SUM(Monetary)) OVER (), 1) AS PctRevenue,
    ROUND(AVG(Monetary), 2)                     AS AvgOrderValue
FROM segmented
GROUP BY Segment
ORDER BY TotalRevenue DESC;