WITH errors AS (
    SELECT
        sources
    FROM {{ ref('fct_sales') }},
	UNNEST(sources) AS source_element
    WHERE
        sources IS NOT NULL
        AND NOT source_element = ANY(ARRAY['Chat', 'Call', 'From Support', 'Ticket', 'N/A'])
)
SELECT * FROM errors