SELECT c.surname, c.first_name, c.patronymic, c.birthday, c.phone
FROM clients c
WHERE c.id IN (
	SELECT client_id
	FROM banned_clients
)
AND c.id IN (
	SELECT client_id
	FROM speech_therapists
)
