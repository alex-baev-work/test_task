WITH errors AS (
    SELECT
        return_date_ny
    FROM {{ ref('fct_sales') }}
    WHERE
        return_date_ny IS NOT NULL
   AND (return_date_ny::text !~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$')
)
SELECT * FROM errors