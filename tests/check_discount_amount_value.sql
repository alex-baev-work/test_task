WITH errors AS (
    SELECT
        discount_amount
    FROM {{ ref('fct_sales') }}
    WHERE
        discount_amount IS NOT NULL
        AND discount_amount < 0
)
SELECT * FROM errors
