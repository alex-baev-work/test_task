WITH errors AS (
    SELECT
        returned_amount
    FROM {{ ref('fct_sales') }}
    WHERE
        returned_amount IS NOT NULL
        AND returned_amount < 0
)
SELECT * FROM errors
