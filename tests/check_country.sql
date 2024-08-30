WITH errors AS (
    SELECT
        "Country"
    FROM {{ ref('fct_sales') }}
    WHERE
        "Country" IS NULL
)
SELECT * FROM errors
