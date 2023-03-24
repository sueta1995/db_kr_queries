SELECT c.surname, c.first_name, c.patronymic, c.birthday, c.phone
FROM clients c 
WHERE c.id NOT IN ( 
	SELECT st.client_id FROM speech_therapists st 
) 
AND c.id NOT IN ( 
	SELECT con.client_id 
	FROM contracts con 
)
