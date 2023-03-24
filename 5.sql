WITH con_clients AS (
	SELECT con.client_id, SUM(con.id)
	FROM contracts con
	GROUP BY con.client_id
),

con_max AS (
	SELECT MAX(conc.sum)
	FROM con_clients conc
),

c_all AS (
	SELECT conc.client_id, conc.sum
	FROM con_clients conc, con_max conm
	WHERE conc.sum = conm.max
)

SELECT c.surname, c.first_name, c.patronymic, c.birthday, c.phone, ca.sum
FROM clients c
JOIN c_all ca ON c.id = ca.client_id
WHERE c.id IN (
	SELECT client_id
	FROM c_all
)
