CREATE TABLE Car
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    car_type_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    transmission_id INTEGER NOT NULL,
    privod_id INTEGER NOT NULL,
    capacity DOUBLE NOT NULL,
    transport_id INTEGER NOT NULL,
    CONSTRAINT fk_car_type FOREIGN KEY (car_type_id) REFERENCES spr_CarType (id),
    CONSTRAINT fk_model FOREIGN KEY (model_id) REFERENCES spr_Model (id),
    CONSTRAINT fk_transmission FOREIGN KEY (transmission_id) REFERENCES spr_Transmission (id),
    CONSTRAINT fk_privod FOREIGN KEY (privod_id) REFERENCES spr_Privod (id),
    CONSTRAINT fk_transport FOREIGN KEY (transport_id) REFERENCES Transport (id) ON DELETE CASCADE
);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (1, 1, 1, 1, 2, 2.6, 1);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (2, 3, 4, 2, 1, 1.6, 2);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (3, 2, 3, 1, 3, 2, 3);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (4, 3, 1, 1, 1, 2, 4);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (5, 2, 4, 2, 2, 1.4, 5);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (6, 1, 1, 1, 1, 3.2, 6);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (7, 2, 3, 1, 3, 2.8, 7);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (8, 3, 3, 2, 1, 1.8, 8);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (9, 1, 2, 1, 1, 2.7, 9);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (10, 1, 1, 2, 2, 4, 10);
CREATE TABLE Sale
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    seller_id INTEGER NOT NULL,
    sale_date DATE NOT NULL,
    transport_id INTEGER NOT NULL,
    description NVARCHAR(500) NOT NULL,
    CONSTRAINT fk_seller FOREIGN KEY (seller_id) REFERENCES Seller (id),
    CONSTRAINT fk_transport FOREIGN KEY (transport_id) REFERENCES Transport (id)
);
INSERT INTO Sale (id, seller_id, sale_date, transport_id, description) VALUES (1, 3, '2011-03-16', 1, '');
INSERT INTO Sale (id, seller_id, sale_date, transport_id, description) VALUES (2, 1, '2011-01-05', 1, '');
INSERT INTO Sale (id, seller_id, sale_date, transport_id, description) VALUES (3, 3, '2011-03-17', 3, '');
INSERT INTO Sale (id, seller_id, sale_date, transport_id, description) VALUES (4, 5, '2011-04-01', 5, '');
INSERT INTO Sale (id, seller_id, sale_date, transport_id, description) VALUES (5, 4, '2011-07-29', 2, '');
CREATE TABLE Seller
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    fio NVARCHAR(200) NOT NULL,
    birthday DATE NOT NULL
);
INSERT INTO Seller (id, fio, birthday) VALUES (1, 'Иванов Иван Иванович', '1978-06-16');
INSERT INTO Seller (id, fio, birthday) VALUES (2, 'Петров Олег Петрович', '1981-11-05');
INSERT INTO Seller (id, fio, birthday) VALUES (3, 'Алексеев Алексей Алексеевич', '1979-09-21');
INSERT INTO Seller (id, fio, birthday) VALUES (4, 'Сидоров Сидор Сидорович', '1984-03-10');
INSERT INTO Seller (id, fio, birthday) VALUES (5, 'Олегов Олег Олегович', '1976-09-07');
INSERT INTO Seller (id, fio, birthday) VALUES (6, 'Андреев Андрей Андреевич', '1987-05-16');
INSERT INTO Seller (id, fio, birthday) VALUES (7, 'Николаев Николай Николаевич', '1976-01-07');
CREATE TABLE Transport
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    brand_id INTEGER NOT NULL,
    price DOUBLE NOT NULL,
    issue_date DATE NOT NULL,
    currency_id INTEGER DEFAULT 1 NOT NULL,
    condition_id INTEGER NOT NULL,
    color_id INTEGER NOT NULL,
    description NVARCHAR(500),
    CONSTRAINT fk_brand FOREIGN KEY (brand_id) REFERENCES spr_Brand (id),
    CONSTRAINT fk_currency FOREIGN KEY (currency_id) REFERENCES spr_Currency (id),
    CONSTRAINT fk_condition FOREIGN KEY (condition_id) REFERENCES spr_Condition (id),
    CONSTRAINT fk_color FOREIGN KEY (color_id) REFERENCES spr_Color (id)
);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (1, 1, 1000, '2010-06-10', 1, 1, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (2, 2, 2400, '2010-07-29', 2, 1, 3, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (3, 3, 900, '2010-05-18', 1, 1, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (4, 2, 3900, '2009-11-07', 1, 1, 2, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (5, 1, 2100, '2009-12-23', 2, 2, 3, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (6, 3, 30000, '2010-12-09', 2, 1, 2, 'Коллекционная модель');
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (7, 1, 16000, '2010-05-12', 1, 1, 1, 'Ручная сборка');
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (8, 3, 5800, '2010-09-12', 2, 2, 3, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (9, 1, 2490, '2010-02-03', 2, 1, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, description) VALUES (10, 2, 6390, '2008-09-11', 1, 1, 2, null);
CREATE TABLE spr_Brand
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (1, 'Тойота', 'Toyota');
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (2, 'БМВ', 'BMW');
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (3, 'Субару', 'Subaru');
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (4, 'Вольксваген', 'Wolkswagen');
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (5, 'Мерседес', 'Mercedes');
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (6, 'Ауди', 'Audi');
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (7, 'Лексус', 'Lexus');
CREATE TABLE spr_CarType
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_CarType (id, name_ru, name_en) VALUES (1, 'Легковая', 'Automobile');
INSERT INTO spr_CarType (id, name_ru, name_en) VALUES (2, 'Грузовик', 'Truck');
INSERT INTO spr_CarType (id, name_ru, name_en) VALUES (3, 'Автобус', 'Bus');
INSERT INTO spr_CarType (id, name_ru, name_en) VALUES (4, 'Мотоцикл', 'Motorcycle');
CREATE TABLE spr_Color
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_Color (id, name_ru, name_en) VALUES (1, 'Синий', 'Blue');
INSERT INTO spr_Color (id, name_ru, name_en) VALUES (2, 'Красный', 'Red');
INSERT INTO spr_Color (id, name_ru, name_en) VALUES (3, 'Зеленый', 'Green');
CREATE TABLE spr_Condition
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_Condition (id, name_ru, name_en) VALUES (1, 'Новая', 'New');
INSERT INTO spr_Condition (id, name_ru, name_en) VALUES (2, 'Подержаная', 'Used');
CREATE TABLE spr_Currency
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL,
    shortname_ru NVARCHAR(20) NOT NULL,
    shortname_en NVARCHAR(20) NOT NULL
);
INSERT INTO spr_Currency (id, name_ru, name_en, shortname_ru, shortname_en) VALUES (1, 'рубль', 'ruble', 'руб', 'rub');
INSERT INTO spr_Currency (id, name_ru, name_en, shortname_ru, shortname_en) VALUES (2, 'доллар', 'dollar', '$', '$');
CREATE TABLE spr_Model
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (1, 'Прадо', 'Prado');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (2, 'Land Cruiser', 'Лэнд Крузер');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (3, 'Пассат', 'Passat');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (4, 'Гольф', 'Golf');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (5, 'РАВ 4', 'RAV 4');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (6, 'Камри', 'Camry');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (7, 'Корола', 'Corolla');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (8, 'Галант', 'Galant');
CREATE TABLE spr_Privod
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_Privod (id, name_ru, name_en) VALUES (1, 'передний', 'forward');
INSERT INTO spr_Privod (id, name_ru, name_en) VALUES (2, 'задний', 'back');
INSERT INTO spr_Privod (id, name_ru, name_en) VALUES (3, 'полный', 'all');
CREATE TABLE spr_Transmission
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_Transmission (id, name_ru, name_en) VALUES (1, 'ручная', 'hand');
INSERT INTO spr_Transmission (id, name_ru, name_en) VALUES (2, 'автоматическая', 'automatic');
CREATE TABLE sqlite_master
(
    type text,
    name text,
    tbl_name text,
    rootpage integer,
    sql text
);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'sqlite_sequence', 'sqlite_sequence', 4, 'CREATE TABLE sqlite_sequence(name,seq)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Seller', 'Seller', 6, 'CREATE TABLE [Seller] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [fio] NVARCHAR(200) NOT NULL, 
  [birthday] DATE NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Car', 'Car', 5, 'CREATE TABLE [Car] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [car_type_id] INTEGER NOT NULL CONSTRAINT [fk_car_type] REFERENCES [spr_CarType]([id]) ON DELETE RESTRICT, 
  [model_id] INTEGER NOT NULL CONSTRAINT [fk_model] REFERENCES [spr_Model]([id]) ON DELETE RESTRICT, 
  [transmission_id] INTEGER NOT NULL CONSTRAINT [fk_transmission] REFERENCES [spr_Transmission]([id]) ON DELETE RESTRICT, 
  [privod_id] INTEGER NOT NULL CONSTRAINT [fk_privod] REFERENCES [spr_Privod]([id]) ON DELETE RESTRICT, 
  [capacity] DOUBLE NOT NULL, 
  [transport_id] INTEGER NOT NULL CONSTRAINT [constr_transport] UNIQUE CONSTRAINT [fk_transport] REFERENCES [Transport]([id]) ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_Car_1', 'Car', 19, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Sale', 'Sale', 9, 'CREATE TABLE [Sale] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [seller_id] INTEGER NOT NULL CONSTRAINT [fk_seller] REFERENCES [Seller]([id]) ON DELETE RESTRICT, 
  [sale_date] DATE NOT NULL, 
  [transport_id] INTEGER NOT NULL CONSTRAINT [fk_transport] REFERENCES [Transport]([id]) ON DELETE RESTRICT, 
  [description] NVARCHAR(500) NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_Brand', 'spr_Brand', 22, 'CREATE TABLE [spr_Brand] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  UNIQUE([name_ru], [name_en]))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_spr_Brand_1', 'spr_Brand', 23, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_CarType', 'spr_CarType', 11, 'CREATE TABLE [spr_CarType] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  UNIQUE([name_ru], [name_en]))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_spr_CarType_1', 'spr_CarType', 24, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_Model', 'spr_Model', 16, 'CREATE TABLE [spr_Model] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  UNIQUE([name_ru], [name_en]))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_spr_Model_1', 'spr_Model', 28, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_Privod', 'spr_Privod', 12, 'CREATE TABLE [spr_Privod] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  UNIQUE([name_ru], [name_en]))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_spr_Privod_1', 'spr_Privod', 10, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_Transmission', 'spr_Transmission', 15, 'CREATE TABLE [spr_Transmission] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  UNIQUE([name_ru], [name_en]))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_spr_Transmission_1', 'spr_Transmission', 30, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Transport', 'Transport', 13, 'CREATE TABLE [Transport] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [brand_id] INTEGER NOT NULL CONSTRAINT [fk_brand] REFERENCES [spr_Brand]([id]) ON DELETE RESTRICT, 
  [price] DOUBLE NOT NULL, 
  [issue_date] DATE NOT NULL, 
  [currency_id] INTEGER NOT NULL CONSTRAINT [fk_currency] REFERENCES [spr_Currency]([id]) ON DELETE RESTRICT DEFAULT 1, 
  [condition_id] INTEGER NOT NULL CONSTRAINT [fk_condition] REFERENCES [spr_Condition]([id]) ON DELETE RESTRICT, 
  [color_id] INTEGER NOT NULL CONSTRAINT [fk_color] REFERENCES [spr_Color]([id]) ON DELETE RESTRICT, 
  [description] NVARCHAR(500))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'sqlite_stat1', 'sqlite_stat1', 17, 'CREATE TABLE sqlite_stat1(tbl,idx,stat)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_Color', 'spr_Color', 31, 'CREATE TABLE [spr_Color] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  UNIQUE([name_ru], [name_en]))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_spr_Color_1', 'spr_Color', 32, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_Condition', 'spr_Condition', 3, 'CREATE TABLE [spr_Condition] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  UNIQUE([name_ru], [name_en]))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_spr_Condition_1', 'spr_Condition', 25, null);
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_Currency', 'spr_Currency', 2, 'CREATE TABLE [spr_Currency] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  [shortname_ru] NVARCHAR(20) NOT NULL, 
  [shortname_en] NVARCHAR(20) NOT NULL, 
  UNIQUE([name_ru], [name_en]))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('index', 'sqlite_autoindex_spr_Currency_1', 'spr_Currency', 14, null);
CREATE TABLE sqlite_sequence
(
    name unknown,
    seq unknown
);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Seller', 11);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Brand', 7);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_CarType', 4);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Model', 8);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Privod', 3);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Transmission', 2);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Car', 10);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Transport', 10);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Sale', 5);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Color', 3);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Condition', 2);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Currency', 2);
CREATE TABLE sqlite_stat1
(
    tbl unknown,
    idx unknown,
    stat unknown
);
INSERT INTO sqlite_stat1 (tbl, idx, stat) VALUES ('Car', 'sqlite_autoindex_Car_1', '1 1');