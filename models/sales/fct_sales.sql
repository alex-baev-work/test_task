with sales_data as (
    select
        "ReferenceID",
        "Product_Name",
        array_agg(distinct  coalesce("Sales_Agent_Name", 'N/A')) as sales_agents,
        "Country",
         array_agg(distinct coalesce("Campaign_Name", 'N/A')) as campaigns,
         array_agg(distinct coalesce("Source", 'N/A')) as sources,
        coalesce("Total_Amount" + "Total_Rebill_Amount" - "Returned_Amount", 0) as total_revenue,
        coalesce("Total_Rebill_Amount", 0) as rebill_revenue,
        coalesce("Number_Of_Rebills", 0) as number_of_rebills,
        coalesce("Discount_Amount", 0) as discount_amount,
        coalesce("Returned_Amount", 0) as returned_amount,
        to_timestamp("Order_Date_Kyiv", 'DD-MM-YYYY HH24:MI:SS') as order_date_kyiv,
        (to_timestamp("Order_Date_Kyiv", 'DD-MM-YYYY HH24:MI:SS')::timestamp AT TIME ZONE 'UTC') as order_date_utc,
        (to_timestamp("Order_Date_Kyiv", 'DD-MM-YYYY HH24:MI:SS')::timestamp AT TIME ZONE 'America/New_York') as order_date_ny,
        (to_timestamp("Return_Date_Kyiv", 'DD-MM-YYYY HH24:MI:SS')) as return_date_kyiv,
        (to_timestamp("Return_Date_Kyiv", 'DD-MM-YYYY HH24:MI:SS')::timestamp AT TIME ZONE 'UTC') as return_date_utc,
        (to_timestamp("Return_Date_Kyiv", 'DD-MM-YYYY HH24:MI:SS')::timestamp AT TIME ZONE 'America/New_York') as return_date_ny,
        coalesce(date_part('day', to_timestamp("Return_Date_Kyiv", 'DD-MM-YYYY HH24:MI:SS')::timestamp - to_timestamp("Order_Date_Kyiv", 'DD-MM-YYYY HH24:MI:SS')::timestamp), NULL) as days_between_return_and_purchase
    from {{ ref('sales_data') }}
    group by
        "ReferenceID",
        "Product_Name",
        "Country",
       "Total_Amount",
        "Total_Rebill_Amount",
        "Returned_Amount",
        "Number_Of_Rebills",
        "Discount_Amount",
        "Order_Date_Kyiv",
        "Return_Date_Kyiv"
)
select * from sales_data
