WITH st_query AS (
	SELECT st.client_id
	FROM speech_therapists st
	WHERE st.id NOT IN (
		SELECT s.speech_therapist_id
		FROM services s
	)
)

SELECT c.surname, c.first_name, c.patronymic, c.phone
FROM clients c
WHERE c.id IN (
	SELECT client_id
	FROM st_query
)
