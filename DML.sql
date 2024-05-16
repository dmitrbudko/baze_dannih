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
