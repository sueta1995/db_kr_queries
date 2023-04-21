WITH con_services AS (
	SELECT con.service_id, COUNT(con.id)
	FROM contracts con
	GROUP BY con.service_id
),

ser_types AS (
	SELECT t.name, cs.count
	FROM con_services cs
	JOIN services s ON s.id = cs.service_id
	JOIN types t ON t.id = s.type_id
),

max_types AS (
	SELECT st.name, sum(st.count)
	FROM ser_types st
	GROUP BY st.name
	ORDER BY sum(st.count) DESC
)

SELECT *
FROM max_types
