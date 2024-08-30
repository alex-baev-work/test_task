WITH errors AS (
    SELECT
        order_date_kyiv
    FROM {{ ref('fct_sales') }}
    WHERE
        order_date_kyiv IS NOT NULL
   AND (order_date_kyiv::text !~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$')
)
SELECT * FROM errors