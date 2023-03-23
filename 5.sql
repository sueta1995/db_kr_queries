WITH con_clients AS (
	SELECT con.client_id, SUM(con.id)
	FROM contracts con
	GROUP BY con.client_id
),

con_max AS (
	SELECT MAX(conc.sum) DISTINCT
	FROM con_clients conc
)

SELECT conc.client_id, conc.sum
FROM con_clients conc, con_max conm
JOIN clients c ON conc.client_id = c.id
WHERE conc.sum = conm.max
