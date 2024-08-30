WITH errors AS (
    SELECT
        sales_agents
    FROM {{ ref('fct_sales') }}
    WHERE
        sales_agents IS NULL
)
SELECT * FROM errors
