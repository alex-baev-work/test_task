with agent_performance as (
    select
        "sales_agents",
        sum("total_revenue") as total_revenue,
        ROUND(avg("total_revenue"))as avg_revenue,
        count("ReferenceID") as sales_count,
        ROUND(avg("discount_amount")) as avg_discount
    from {{ ref('fct_sales') }}
    group by "sales_agents"
),
ranked_agents as (
    select
        "sales_agents",
        "avg_revenue",
        "sales_count",
        "avg_discount",
        "total_revenue",
        rank() over (order by "total_revenue" desc) as agent_rank
    from agent_performance
)
select * from ranked_agents
