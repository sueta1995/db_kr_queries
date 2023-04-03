SELECT c.surname, c.first_name, c.patronymic, c.birthday, c.phone
FROM clients c
WHERE c.id IN (
	SELECT client_id
	FROM speech_therapists
)
AND c.birthday <= '2005-12-31'
AND c.birthday >= '2005-01-01'
