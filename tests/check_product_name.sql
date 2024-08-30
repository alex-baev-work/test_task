WITH errors AS (
    SELECT
        "Product_Name"
    FROM {{ ref('fct_sales') }}
    WHERE
        "Product_Name" IS NULL
)
SELECT * FROM errors
