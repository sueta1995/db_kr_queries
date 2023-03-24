WITH con_services AS (
	SELECT con.service_id, COUNT(con.id)
	FROM contracts con
	GROUP BY con.service_id
),

st_count AS (
	SELECT s.speech_therapist_id, SUM(cs.count)
	FROM con_services cs
	JOIN services s ON cs.service_id = s.id
	GROUP BY s.speech_therapist_id
),

st_max AS (
	SELECT stc.speech_therapist_id, stc.sum
	FROM st_count stc
	WHERE stc.sum = (
		SELECT MAX(sum)
		FROM st_count
	)
)

SELECT c.surname, c.first_name, c.patronymic, c.birthday, c.phone, stm.sum
FROM st_max stm
JOIN speech_therapists st ON st.id = stm.speech_therapist_id
JOIN clients c ON c.id = st.client_id
