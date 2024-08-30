WITH errors AS (
    SELECT
        total_revenue
    FROM {{ ref('fct_sales') }}
    WHERE
        total_revenue IS NOT NULL
        AND total_revenue < 0
)
SELECT * FROM errors
