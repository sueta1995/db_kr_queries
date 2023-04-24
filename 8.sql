SELECT c.surname AS Фамилия, c.first_name AS Имя, c.patronymic AS Отчество, c.birthday AS "Дата рождения", st.experience AS "Стаж работы, лет", st.education AS Образование, st.verificated AS "Проверенный?", c.phone AS "Номер телефона", c.passport_series AS "Серия паспорта", c.passport_number AS "Номер паспорта", c.registration_date AS "Дата регистрации", s.description AS "Описание услуги договора", t.name AS "Тип услуги", con.hours AS "Количество часов", con.issue_date AS "Дата заключения контракта", con.total_cost AS "Итоговая стоимость услуги" 
FROM speech_therapists st
JOIN clients c ON c.id = st.client_id
JOIN contracts con ON st.client_id = con.client_id
JOIN services s ON con.service_id = s.id
JOIN types t ON s.type_id = t.id
