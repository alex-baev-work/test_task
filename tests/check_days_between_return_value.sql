WITH errors AS (
    SELECT
        days_between_return_and_purchase
    FROM {{ ref('fct_sales') }}
    WHERE
        days_between_return_and_purchase IS NOT NULL
        AND days_between_return_and_purchase < 0
)
SELECT * FROM errors
