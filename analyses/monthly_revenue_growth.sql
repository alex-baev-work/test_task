with revenue_per_month as (
    select
        to_char(date_trunc('month', "order_date_utc"), 'YYYY-MM') as month,
        sum("total_revenue") as total_revenue
    from {{ ref('fct_sales') }}
    group by month
),
revenue_growth as (
    select
        month,
        "total_revenue",
        lag("total_revenue") over (order by month) as previous_month_revenue
    from revenue_per_month
)
select
    month,
    "total_revenue",
    "previous_month_revenue",
    ROUND((ROUND(("total_revenue" - "previous_month_revenue")::NUMERIC / nullif("previous_month_revenue", 0), 2)) * 100) as growth_percentage
from revenue_growth
