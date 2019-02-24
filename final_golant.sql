SELECT ('ФИО: Головань Антон');

-- Создание таблиц:
CREATE TABLE objects (
  ob_id integer PRIMARY KEY,
  complex_name varchar,
  room_count integer,
  flat_number varchar,
  Square numeric,
  Price numeric
);

INSERT INTO objects VALUES
('111', 'Лесная сказка', '1', '1', '35.25', '6955704.53'),
('124', 'ЖК Восточный', '2', '2', '55.75', '7046128.69'),
('137', 'Лесная сказка', '3', '3', '85.13', '7137728.36'),
('150', 'Дом чудес', '1', '4', '35.25', '7230518.83'),
('163', 'ЖК Восточный', '2', '5', '55.75', '7324515.57'),
('176', 'Дом чудес', '3', '6', '85.13', '7419734.27'),
('189', 'ДК Кутузовский', '1', '7', '35.25', '7516190.82'),
('202', 'ЖК Восточный', '2', '8', '55.75', '7613901.3'),
('215', 'ДК Кутузовский', '3', '9', '85.13', '7712882.02'),
('228', 'Дом чудес', '1', '10', '35.25', '7813149.48'),
('241', 'ЖК Восточный', '2', '11', '55.75', '7914720.43'),
('254', 'Дом чудес', '3', '12', '85.13', '8017611.79'),
('267', 'ДК Кутузовский', '1', '13', '35.25', '8121840.75'),
('280', 'ЖК Восточный', '2', '14', '55.75', '8227424.67'),
('293', 'Лесная сказка', '3', '15', '85.13', '8334381.2'),
('306', 'Дом чудес', '1', '16', '35.25', '8442728.15'),
('319', 'ДК Кутузовский', '2', '17', '55.75', '8552483.62'),
('332', 'Дом чудес', '3', '18', '85.13', '8663665.9'),
('345', 'Лесная сказка', '1', '19', '35.25', '8776293.56'),
('358', 'Дом чудес', '2', '20', '55.75', '8890385.38'),
('371', 'ЖК Восточный', '3', '21', '85.13', '9005960.39'),
('384', 'ДК Кутузовский', '1', '22', '35.25', '9123037.87'),
('397', 'ЖК Лидер Парк', '2', '23', '55.75', '9241637.36'),
('410', 'Дом чудес', '3', '24', '85.13', '9361778.65'),
('423', 'Лесная сказка', '1', '25', '35.25', '9483481.77'),
('436', 'ЖК Лидер Парк', '2', '26', '55.75', '9606767.04'),
('449', 'Лесная сказка', '3', '27', '85.13', '9731655.01'),
('462', 'Дом чудес', '1', '28', '35.25', '9858166.52'),
('475', 'ЖК Лидер Парк', '2', '29', '55.75', '9986322.69'),
('488', 'ЖК Восточный', '3', '30', '85.13', '10116144.88'),
('501', 'ЖК Лидер Парк', '3', '31', '85.13', '6689823.2');

CREATE TABLE statment (
  dealdate date,
  client_id integer REFERENCES clients_card (client_id),
  ob_id integer REFERENCES objects (ob_id),
  deal_amount numeric
  );

INSERT INTO statment VALUES
('2018-01-08', '1234', '111', '6955704.53'),
('2018-02-10', '1247', '124', '7046128.69'),
('2018-02-13', '1260', '137', '7137728.36'),
('2018-03-08', '1273', '150', '7230518.83'),
('2018-04-21', '1286', '163', '7324515.57'),
('2018-04-25', '1299', '176', '7419734.27'),
('2018-04-25', '1312', '189', '7516190.82'),
('2018-05-09', '1325', '202', '7613901.3'),
('2018-06-25', '1338', '215', '7712882.02'),
('2018-07-10', '1351', '228', '7813149.48'),
('2018-08-08', '1364', '241', '7914720.43'),
('2018-09-12', '1234', '254', '8017611.79'),
('2018-10-15', '1351', '267', '8121840.75'),
('2018-11-15', '1260', '397', '9241637.36'),
('2018-12-14', '1273', '410', '9361778.65'),
('2018-01-16', '1286', '423', '9483481.77'),
('2018-09-05', '1299', '436', '9606767.04'),
('2018-10-03', '1286', '449', '9731655.01'),
('2018-08-20', '1351', '462', '9858166.52'),
('2018-07-18', '1299', '475', '9986322.69'),
('2018-06-15', '1351', '488', '10116144.88'),
('2018-05-27', '1286', '501', '6689823.2');


CREATE TABLE clients_card (
  client_id integer PRIMARY KEY,
  last_name varchar,
  first_name varchar,
  patronymic varchar,
  birthday date,
  sex varchar
  );

INSERT INTO clients_card VALUES
('1234', 'Ямов', 'Мирослав', 'Ефремович', '1990-01-08', 'man'),
('1247', 'Тюрин', 'Леонид', 'Игнатиевич', '1989-11-08', 'man'),
('1260', 'Еркулаев', 'Мечислав', 'Гаврилевич', '1987-10-08', 'man'),
('1273', 'Дагиров', 'Алексей', 'Всеволодович', '1986-09-08', 'man'),
('1286', 'Цой', 'Касьян', 'Евстафиевич', '1985-08-08', 'man'),
('1299', 'Дворецков', 'Валерий', 'Фролович', '1984-07-08', 'man'),
('1312', 'Гагарина', 'Каролина', 'Глебовна', '1983-06-08', 'women'),
('1325', 'Ядрихинская', 'Екатерина', 'Савелиевна', '1982-05-08', 'women'),
('1338', 'Степанова', 'Регина', 'Евгениевна', '1981-04-08', 'women'),
('1351', 'Рогова', 'Фаина', 'Евремовна', '1980-03-08', 'women'),
('1364', 'Панькива', 'Альбина', 'Соломоновна', '1980-02-08', 'women');


CREATE TABLE estate_forecast (
  for_year integer,
  rooms integer,
  for_index numeric
  );

INSERT INTO estate_forecast VALUES
('2020', '1', '5'),
('2020', '2', '2'),
('2020', '3', '1'),
('2021', '1', '5.5'),
('2021', '2', '2.2'),
('2021', '3', '1.1'),
('2022', '1', '6.05'),
('2022', '2', '2.42'),
('2022', '3', '1.21'),
('2023', '1', '6.655'),
('2023', '2', '2.662'),
('2022', '3', '1.331');

-- 1. Вывести общее количество приобретённых объектов недвижимости и суммарную покупку каждого из клиентов

WITH tmp_table1
AS (
SELECT * FROM statment
JOIN clients_card
ON clients_card.client_id = statment.client_id
)
SELECT
    last_name, first_name, patronymic,
    COUNT (ob_id) AS Deal_count,
    CAST (SUM (deal_amount) as decimal (16,2) ) AS Amount
FROM tmp_table1
GROUP BY last_name, first_name, patronymic
ORDER BY COUNT (ob_id) DESC;


-- 2.  Определить 3 самых лучших клиентов компании по сумме сделок
WITH tmp_table1
AS (
SELECT
  *
FROM statment
JOIN clients_card
ON statment.client_id = clients_card.client_id
)
SELECT
    (last_name || ' ' || first_name || ' ' || patronymic) AS FIO,
    COUNT (ob_id) AS Deal_count,
    CAST (SUM (deal_amount) as decimal (16,2) ) AS Amount
FROM tmp_table1
GROUP BY FIO
ORDER BY SUM (deal_amount) DESC
LIMIT 3;

-- 3. Привести цену самой дорогой квартиры агентства

SELECT
MAX (Price) AS highest_price
FROM objects;

-- 4. Вычислить средний возраст клиентов
SELECT
ROUND (AVG (client_age))
FROM (
    SELECT
    (last_name || ' ' || first_name || ' ' || patronymic) AS FIO,
    extract (year from age(current_date, birthday)) AS client_age
    FROM clients_card
) AS tmp_ansmwer_table;


-- 5. Найти среднюю стоимость квадратного метра каждого из типов квартир
SELECT
    room_count,
    CAST (SUM(Price) / SUM(Square) as numeric(15,2)) as meter_price
FROM objects
GROUP BY room_count
ORDER BY room_count ASC;

-- 6. Выяснить ТОП-3 самых популярных комплексов среди клиентской базы

SELECT
    complex_name,
    COUNT (client_id) as deal_count
    FROM (
    SELECT * FROM statment
    JOIN (select complex_name, ob_id from objects) as tmp_objects
    ON statment.ob_id = tmp_objects.ob_id) AS tmp_base
    GROUP BY complex_name
    ORDER BY  COUNT (client_id) DESC
    LIMIT 3;


--7. Раскрыть динамику продаж компании по месяцам

SELECT
Extract(MONTH from dealdate) AS month_deal,
SUM (deal_amount) as deal_amount
from statment
GROUP BY Extract(MONTH from dealdate)
ORDER BY Extract(MONTH from dealdate) ASC;


-- 8. Выявить самое востребованное количесвто комнат в квартирах у клиентов

WITH tmp_table_room
AS (
    SELECT
    room_count,
    COUNT(client_id) AS deal_count
    FROM (
    SELECT *
    FROM statment
    JOIN objects
    ON statment.ob_id = objects.ob_id) AS tmp_table_room
    GROUP BY room_count
)
SELECT
    room_count AS popular_choice_room
FROM tmp_table_room
WHERE  deal_count IN (SELECT MAX (deal_count) FROM tmp_table_room);


-- 9. Подсчитать сколько могут заработать клиенты, если переуступят свои квартиры в 2021 году
SELECT
FIO,
SUM(possible_future_income) AS possible_future_income1
FROM (
    WITH tmp_income_table
    AS (
        SELECT *
        FROM (
            SELECT FIO, room_count, deal_amount, for_year, for_index
            FROM statment
                JOIN (SELECT client_id, (last_name || ' ' || first_name || ' ' || patronymic) AS FIO FROM clients_card) AS cl_profile
                ON statment.client_id = cl_profile.client_id
                JOIN (SELECT room_count, ob_id, for_year, for_index FROM objects
                        JOIN estate_forecast
                        ON objects.room_count = estate_forecast.rooms
                ) AS ob_profile
                ON statment.ob_id = ob_profile.ob_id
        ) as tmp_table2
        )
    SELECT
        FIO,
        CAST ((deal_amount * (1 + (for_index /100) ) - deal_amount) AS numeric (10,2) ) AS possible_future_income
    FROM tmp_income_table
    GROUP BY FIO, deal_amount, for_index, for_year
    HAVING  for_year = 2021
) AS tmp_select_table
GROUP BY FIO;

-- 10. Проверить, какой гендерный сегмент потребителей является наибольшим для компании

WITH tmp_sex_table
AS (
    SELECT sex, deal_amount FROM statment
    JOIN clients_card
    ON clients_card.client_id = statment.client_id
    )
SELECT
sex AS biggest_sex_segment
FROM tmp_sex_table
GROUP BY sex
ORDER BY COUNT (deal_amount) DESC
LIMIT 1;
