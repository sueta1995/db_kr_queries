WITH con_speech_therapists AS (
	SELECT con.speech_therapist_id, COUNT(con.id)
	FROM contracts con
	GROUP BY con.speech_therapist_id
),

st_max AS (
	SELECT cst.speech_therapist_id, cst.count
	FROM con_speech_therapists cst
	WHERE cst.count = (
		SELECT MAX(count)
		FROM con_speech_therapists
	)
)

SELECT c.surname, c.first_name, c.patronymic, c.birthday, c.phone, stm.count
FROM st_max stm
JOIN speech_therapists st ON st.id = stm.speech_therapist_id
JOIN clients c ON c.id = st.client_id
