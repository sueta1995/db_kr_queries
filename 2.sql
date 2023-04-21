WITH com_speech_therapists AS (
	SELECT com.speech_therapist_id, AVG(com.rate_value)
	FROM comments com
	GROUP BY com.speech_therapist_id
),

st_max AS (
	SELECT cst.speech_therapist_id, cst.avg
	FROM com_speech_therapists cst
	WHERE cst.avg = (
		SELECT MAX(avg)
		FROM com_speech_therapists
	)
)

SELECT c.surname, c.first_name, c.patronymic, c.birthday, c.phone, ROUND(stm.avg, 2)
FROM st_max stm
JOIN speech_therapists st ON st.id = stm.speech_therapist_id
JOIN clients c ON c.id = st.client_id
