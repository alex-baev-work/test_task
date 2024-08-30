WITH errors AS (
    SELECT
        return_date_kyiv
    FROM {{ ref('fct_sales') }}
    WHERE
        return_date_kyiv IS NOT NULL
   AND (return_date_kyiv::text !~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$')
)
SELECT * FROM errors