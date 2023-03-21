SELECT c.surname, c.first_name, c.patronymic, c.phone, c.birthday 
FROM clients c 
WHERE c.id NOT IN ( 
	SELECT st.client_id FROM speech_therapists st 
) 
AND c.id NOT IN ( 
	SELECT con.client_id 
	FROM contracts con 
)
