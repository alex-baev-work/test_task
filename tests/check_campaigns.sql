WITH errors AS (
    SELECT
        campaigns
    FROM {{ ref('fct_sales') }}
    WHERE
        campaigns IS NULL
)
SELECT * FROM errors
