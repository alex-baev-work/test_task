with average_discount as (
    select avg("discount_amount") as avg_discount
    from {{ ref('fct_sales') }}
),
agents_above_avg as (
    select
        "sales_agents",
        ROUND(avg("discount_amount")) as avg_agent_discount
    from {{ ref('fct_sales') }}
    group by "sales_agents"
    having avg("discount_amount") > (select "avg_discount" from average_discount)
)
select * from agents_above_avg
