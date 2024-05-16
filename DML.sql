-- Вставка данных в таблицу калибров
INSERT INTO Caliber_Table (caliber_id, metrics)
VALUES
    (1, '7.62x39'),
    (2, '5.45x39');

-- Вставка данных в таблицу моделей винтовок
INSERT INTO Rifle_Model_Table (model_id, model_classification_name, hg_type)
VALUES
    (1, 'AK-47', 'full-size'),
    (2, 'AKM', 'full-size'),
    (3, 'AK-74', 'full-size'),
    (4, 'AKM-74', 'full-size'),
    (5, 'AKS-74U', 'shortened'),
    (6, 'AK-12', 'AK-12 handguard');

-- Вставка данных в таблицу глушителей
INSERT INTO Muzzle_Break_Table (mb_id, mb_type, mb_compatible_id)
VALUES
    (1, '7.62 adapter', 2),
    (2, '7.62 suppressor', NULL),
    (3, '7.62 muzzle break', NULL),
    (4, '5.45 adapter', 5),
    (5, '5.45 suppressor', NULL),
    (6, '5.45 muzzle break', NULL),
    (7, '5.45 hexagon muzzle break', 8),
    (8, '5.45 wafflemaker suppressor', NULL);

-- Вставка данных в таблицу магазинов
INSERT INTO Mag_Table (mag_id, capacity, caliber_id)
VALUES
    (1, 10, 1),
    (2, 30, 1),
    (3, 45, 1),
    (4, 80, 1),
    (5, 30, 2),
    (6, 45, 2),
    (7, 95, 2);

-- Вставка данных в таблицу ручек
INSERT INTO Handguard_Table (hg_id, mounts_count, mount_type, hg_type)
VALUES
    (1, 3, 'RIS', 'shortened'),
    (2, 5, 'hexagon', 'shortened'),
    (3, 4, 'M-LOK', 'shortened'),
    (4, 3, 'RIS', 'full-size'),
    (5, 7, 'hexagon', 'full-size'),
    (6, 4, 'M-LOK', 'full-size'),
    (7, 4, 'RIS', 'AK-12 handguard');

-- Вставка данных в таблицу тактических модификаций
INSERT INTO Tactical_Modification_Table (mod_id, mod_type, mount_type)
VALUES
    (1, 'flashlight', 'RIS'),
    (2, 'flashlight', 'M-LOK'),
    (3, 'tactical block', 'RIS'),
    (4, 'tactical block', 'M-LOK'),
    (5, 'LTD', 'RIS'),
    (6, 'LTD', 'M-LOK'),
    (7, 'tactical grip', 'RIS'),
    (8, 'tactical grip', 'M-LOK'),
    (9, 'tactical grip', 'hexagon'),
    (10, 'Kleshch-2U projector', 'hexagon'),
    (11, 'tactical chainsaw grip', 'hexagon');

-- Вставка данных в таблицу Item_Table из Rifle_Model_Table
INSERT INTO Item_Table (item_id)
SELECT model_id FROM Rifle_Model_Table;

-- Вставка данных в таблицу Price_Table для моделей винтовок
INSERT INTO Price_Table (price_id, price, item_id, date_start, date_end)
VALUES
    (1, 1000, 1, '2024-01-01', '2024-12-31'),
    (2, 1200, 2, '2024-01-01', '2024-12-31'),
    (3, 1500, 3, '2024-01-01', '2024-12-31'),
    (4, 1300, 4, '2024-01-01', '2024-12-31'),
    (5, 1100, 5, '2024-01-01', '2024-12-31'),
    (6, 2000, 6, '2024-01-01', '2024-12-31');

-- Вставка данных в таблицу Item_Table из Muzzle_Break_Table
INSERT INTO Item_Table (item_id)
SELECT mb_id FROM Muzzle_Break_Table;

-- Вставка данных в таблицу Price_Table для глушителей
INSERT INTO Price_Table (price_id, price, item_id, date_start, date_end)
VALUES
    (7, 200, 1, '2024-01-01', '2024-12-31'),
    (8, 300, 2, '2024-01-01', '2024-12-31'),
    (9, 250, 3, '2024-01-01', '2024-12-31'),
    (10, 150, 4, '2024-01-01', '2024-12-31'),
    (11, 250, 5, '2024-01-01', '2024-12-31'),
    (12, 200, 6, '2024-01-01', '2024-12-31'),
    (13, 300, 7, '2024-01-01', '2024-12-31'),
    (14, 350, 8, '2024-01-01', '2024-12-31');
    
-- Вставка данных в таблицу Item_Table из Mag_Table
INSERT INTO Item_Table (item_id)
SELECT mag_id FROM Mag_Table;

-- Вставка данных в таблицу Price_Table для магазинов
INSERT INTO Price_Table (price_id, price, item_id, date_start, date_end)
VALUES
    (15, 20, 1, '2024-01-01', '2024-12-31'),
    (16, 30, 2, '2024-01-01', '2024-12-31'),
    (17, 40, 3, '2024-01-01', '2024-12-31'),
    (18, 70, 4, '2024-01-01', '2024-12-31'),
    (19, 25, 5, '2024-01-01', '2024-12-31'),
    (20, 35, 6, '2024-01-01', '2024-12-31'),
    (21, 60, 7, '2024-01-01', '2024-12-31');

-- Вставка данных в таблицу Item_Table из Handguard_Table
INSERT INTO Item_Table (item_id)
SELECT hg_id FROM Handguard_Table;

-- Вставка данных в таблицу Price_Table для каждого цевья
INSERT INTO Price_Table (price_id, price, item_id, date_start, date_end)
VALUES
    (22, 50, 1, '2024-01-01', '2024-12-31'),
    (23, 60, 2, '2024-01-01', '2024-12-31'),
    (24, 70, 3, '2024-01-01', '2024-12-31'),
    (25, 80, 4, '2024-01-01', '2024-12-31'),
    (26, 90, 5, '2024-01-01', '2024-12-31'),
    (27, 100, 6, '2024-01-01', '2024-12-31'),
    (28, 110, 7, '2024-01-01', '2024-12-31');

-- Вставка данных в таблицу Item_Table из Tactical_Modification_Table
INSERT INTO Item_Table (item_id)
SELECT mod_id FROM Tactical_Modification_Table;

-- Вставка данных в таблицу Price_Table для тактических модификаций
INSERT INTO Price_Table (price_id, price, item_id, date_start, date_end)
VALUES
    (29, 80, 1, '2024-01-01', '2024-12-31'),
    (30, 90, 2, '2024-01-01', '2024-12-31'),
    (31, 100, 3, '2024-01-01', '2024-12-31'),
    (32, 110, 4, '2024-01-01', '2024-12-31'),
    (33, 120, 5, '2024-01-01', '2024-12-31'),
    (34, 130, 6, '2024-01-01', '2024-12-31'),
    (35, 140, 7, '2024-01-01', '2024-12-31'),
    (36, 150, 8, '2024-01-01', '2024-12-31'),
    (37, 160, 9, '2024-01-01', '2024-12-31'),
    (38, 170, 10, '2024-01-01', '2024-12-31'),
    (39, 180, 11, '2024-01-01', '2024-12-31');
