WITH errors AS (
    SELECT
        return_date_utc
    FROM {{ ref('fct_sales') }}
    WHERE
        return_date_utc IS NOT NULL
   AND (return_date_utc::text !~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$')
)
SELECT * FROM errors