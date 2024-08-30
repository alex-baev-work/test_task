WITH errors AS (
    SELECT
        order_date_ny
    FROM {{ ref('fct_sales') }}
    WHERE
        order_date_ny IS NOT NULL
   AND (order_date_ny::text !~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$')
)
SELECT * FROM errors