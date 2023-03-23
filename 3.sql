WITH s_count AS (
	SELECT st.id, count(s.speech_therapist_id)
	FROM speech_therapists st, services s
	WHERE st.id = s.speech_therapist_id
	GROUP BY st.id
)

SELECT c.surname, c.first_name, c.patronymic, c.phone
FROM clients c, speech_therapists st
WHERE c.id = st.client_id
AND st.id IN (
	SELECT MAX(count)
	FROM s_count
	GROUP BY id
)
