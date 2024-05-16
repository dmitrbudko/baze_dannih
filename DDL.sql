CREATE TABLE Caliber_Table (
	caliber_id BIGINT PRIMARY KEY NOT NULL,
  	metrics VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE Item_Table (
	item_id BIGINT PRIMARY KEY NOT NULL
);

CREATE TABLE Price_Table (
	price_id BIGINT PRIMARY KEY NOT NULL,
  	price INT NOT NULL,
  	item_id INT NOT NULL,
  	date_start DATE NOT NULL, 
	date_end DATE NOT NULL,
  	CHECK (date_start <= date_end),
  	CONSTRAINT item_id_fk FOREIGN KEY (item_id) REFERENCES item_table(item_id)
);

CREATE TABLE Rifle_Model_Table (
	model_id BIGINT PRIMARY KEY NOT NULL,
  	model_classification_name VARCHAR(128) NOT NULL UNIQUE,
  	hg_type VARCHAR(128) NOT NULL,
    caliber_id BIGINT,
    item_id BIGINT NOT NULL,
  	CONSTRAINT caliber_id_fk FOREIGN KEY (caliber_id) REFERENCES caliber_table(caliber_id),
  	CONSTRAINT item_id_fk FOREIGN KEY (item_id) REFERENCES item_table(item_id)
);

CREATE TABLE Muzzle_Break_Table (
	mb_id BIGINT PRIMARY KEY NOT NULL,
  	mb_type VARCHAR(128) NOT NULL,
  	mb_compatible_id BIGINT,
    caliber_id BIGINT,
    item_id BIGINT NOT NULL,
 	CONSTRAINT caliber_id_fk FOREIGN KEY (caliber_id) REFERENCES caliber_table(caliber_id),
  	CONSTRAINT item_id_fk FOREIGN KEY (item_id) REFERENCES item_table(item_id)
);

CREATE TABLE Mag_Table (
	mag_id BIGINT PRIMARY KEY NOT NULL,
  	capacity INT NOT NULL,
    caliber_id BIGINT,
    item_id BIGINT NOT NULL,
  	CONSTRAINT caliber_id_fk FOREIGN KEY (caliber_id) REFERENCES caliber_table(caliber_id),
  	CONSTRAINT item_id_fk FOREIGN KEY (item_id) REFERENCES item_table(item_id)
);

CREATE TABLE Handguard_Table (
	hg_id BIGINT PRIMARY KEY NOT NULL,
  	mounts_count INT,
  	mount_type VARCHAR(128),
    caliber_id BIGINT,
    item_id BIGINT NOT NULL,
  	CONSTRAINT hg_type_fk FOREIGN KEY (hg_type) REFERENCES rifle_model_table(hg_type),
  	CONSTRAINT item_id_fk FOREIGN KEY (item_id) REFERENCES item_table(item_id)
);

CREATE TABLE Tactical_Modification_Table (
	mod_id BIGINT PRIMARY KEY NOT NULL,
  	mod_type VARCHAR(128) NOT NULL,
  	mount_type VARCHAR(128),
    mount_id BIGINT,
  	item_id BIGINT NOT NULL,
  	CONSTRAINT price_id_fk FOREIGN KEY (mount_type) REFERENCES handguard_table(mount_type),
  	CONSTRAINT item_id_fk FOREIGN KEY (item_id) REFERENCES item_table(item_id)
);
