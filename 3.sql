WITH s_count AS (
	SELECT st.id, count(s.speech_therapist_id)
	FROM speech_therapists st, services s
	WHERE st.id = s.speech_therapist_id
	GROUP BY st.id
),

st_rate AS (
	SELECT r.speech_therapist_id, ROUND(AVG(r.count), 2)
	FROM rates r
	GROUP BY r.speech_therapist_id
)

SELECT c.surname, c.first_name, c.patronymic, c.birthday, c.phone, str.round
FROM clients c, speech_therapists st
JOIN st_rate str ON st.id = str.speech_therapist_id
WHERE c.id = st.client_id
AND st.id IN (
	SELECT MAX(count)
	FROM s_count
	GROUP BY id
)
