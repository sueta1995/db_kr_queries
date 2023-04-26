SELECT c.surname AS Фамилия, c.first_name AS Имя, c.patronymic AS Отчество, c.birthday AS "Дата рождения", st.job_end AS "Дата прекращения работы", st.experience AS "Стаж работы, лет", st.education AS Образование, st.verificated AS "Проверенный?", c.phone AS "Номер телефона", c.passport_series AS "Серия паспорта", c.passport_number AS "Номер паспорта", c.registration_date AS "Дата регистрации", s.description AS "Описание услуги договора", t.name AS "Тип услуги", ch.surname AS "Фамилия ребенка", ch.first_name AS "Имя ребенка", ch.patronymic AS "Отчество ребенка", date_part('year', AGE(ch.birthday)) AS "Возраст ребенка", con.hours AS "Количество часов в договоре", con.issue_date AS "Дата заключения контракта", con.total_cost AS "Итоговая стоимость услуги" 
FROM speech_therapists st
JOIN clients c ON c.id = st.client_id
JOIN contracts con ON st.client_id = con.client_id
JOIN services s ON con.service_id = s.id
JOIN children ch ON con.child_id = ch.id
JOIN types t ON s.type_id = t.id
WHERE st.job_end IS NOT NULL

