WITH errors AS (
    SELECT
        rebill_revenue
    FROM {{ ref('fct_sales') }}
    WHERE
        rebill_revenue IS NOT NULL
        AND rebill_revenue < 0
)
SELECT * FROM errors
