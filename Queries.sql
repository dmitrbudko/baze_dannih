--1) Найти все модификации которые могут быть установлены на конкретный тип ручки.
SELECT t.mod_type
FROM Tactical_Modification_Table t
JOIN Handguard_Table h ON t.mount_type = h.mount_type
WHERE h.mount_type = 'desired_handguard_type';

--2) Получить список моделей, которые имеют цену выше определенной суммы.
SELECT r.model_classification_name
FROM Rifle_Model_Table r
JOIN Price_Table p ON r.price_id = p.price_id
WHERE p.price > desired_price;

--3) Получить количество модификаций для каждого типа цевья.
SELECT h.mount_type, COUNT(t.mod_id) AS modification_count
FROM Handguard_Table h
LEFT JOIN Tactical_Modification_Table t ON h.mount_type = t.mount_type
GROUP BY h.mount_type;

--4) Найти все цевья, которые имеют больше определенного количества креплений.
SELECT *
FROM Handguard_Table
WHERE mounts_count > desired_mounts_count;

--5) Получить среднюю цену модели для каждого калибра.
SELECT c.metrics, AVG(p.price) AS average_price
FROM Caliber_Table c
JOIN Rifle_Model_Table r ON c.caliber_id = r.caliber_id
JOIN Price_Table p ON r.price_id = p.price_id
GROUP BY c.metrics;

--6) Получить список всех модификаций, доступных для цевья определенного типа.
SELECT t.mod_type
FROM Tactical_Modification_Table t
JOIN Handguard_Table h ON t.mount_type = h.mount_type
WHERE h.mount_type = 'desired_handguard_type';

--7) Найти все цены, которые были актуальны в определенный период времени.
SELECT *
FROM Price_Table
WHERE date_start BETWEEN 'start_date' AND 'end_date';

--8) Получить количество вариантов выбора цевья для каждой модели винтовки.
SELECT r.model_classification_name, COUNT(h.hg_id) AS handguard_count
FROM Rifle_Model_Table r
LEFT JOIN Handguard_Table h ON r.hg_type = h.hg_type
GROUP BY r.model_classification_name;

--9) Получить список всех модификаций, доступных для моделей винтовок с определенным калибром.
SELECT DISTINCT t.mod_type
FROM Tactical_Modification_Table t
JOIN Handguard_Table h ON t.mount_type = h.mount_type
JOIN Rifle_Model_Table r ON h.hg_type = r.hg_type
JOIN Caliber_Table c ON r.caliber_id = c.caliber_id
WHERE c.metrics = 'desired_caliber';

--10) Получить самую дешёвую и при этом совместимую комплектацию.
SELECT r.model_classification_name AS rifle_model,
       h.mount_type AS handguard_type,
       m.capacity AS magazine_capacity,
       MIN(p.price) AS min_price
FROM Rifle_Model_Table r
JOIN Handguard_Table h ON r.hg_type = h.hg_type
JOIN Mag_Table m ON r.caliber_id = m.caliber_id
JOIN Price_Table p ON r.price_id = p.price_id
WHERE (r.caliber_id, r.hg_type) IN (
    SELECT caliber_id, hg_type
    FROM Rifle_Model_Table
)
GROUP BY r.model_classification_name, h.mount_type, m.capacity;



