WITH errors AS (
    SELECT
        order_date_utc
    FROM {{ ref('fct_sales') }}
    WHERE
        order_date_utc IS NOT NULL
   AND (order_date_utc::text !~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$')
)
SELECT * FROM errors