CREATE TABLE BrandModels
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    brand_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    CONSTRAINT fk_brand FOREIGN KEY (brand_id) REFERENCES spr_Brand (id) ON DELETE CASCADE,
    CONSTRAINT fk_model FOREIGN KEY (model_id) REFERENCES spr_Model (id) ON DELETE CASCADE
);
INSERT INTO BrandModels (id, brand_id, model_id) VALUES (1, 1, 1);
INSERT INTO BrandModels (id, brand_id, model_id) VALUES (2, 1, 2);
INSERT INTO BrandModels (id, brand_id, model_id) VALUES (3, 1, 5);
INSERT INTO BrandModels (id, brand_id, model_id) VALUES (4, 1, 6);
INSERT INTO BrandModels (id, brand_id, model_id) VALUES (5, 1, 7);
INSERT INTO BrandModels (id, brand_id, model_id) VALUES (6, 4, 3);
INSERT INTO BrandModels (id, brand_id, model_id) VALUES (7, 4, 4);
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
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (2, 2, 4, 2, 1, 1.6, 2);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (3, 2, 3, 1, 3, 2, 3);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (4, 1, 1, 1, 1, 2, 4);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (5, 2, 4, 2, 2, 1.4, 5);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (6, 1, 1, 1, 1, 3.2, 6);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (7, 2, 3, 1, 3, 2.8, 7);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (8, 1, 3, 2, 1, 1.8, 8);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (9, 1, 2, 1, 1, 2.7, 9);
INSERT INTO Car (id, car_type_id, model_id, transmission_id, privod_id, capacity, transport_id) VALUES (10, 1, 1, 2, 2, 4, 10);
CREATE TABLE Motorcycle
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    motorcycle_type_id INTEGER NOT NULL,
    seat_count INTEGER NOT NULL,
    transport_id INTEGER NOT NULL,
    CONSTRAINT fk_motorcycle_type FOREIGN KEY (motorcycle_type_id) REFERENCES spr_MotorcycleType (id),
    CONSTRAINT fk_transport FOREIGN KEY (transport_id) REFERENCES Transport (id) ON DELETE CASCADE
);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, transport_id) VALUES (1, 1, 2, 11);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, transport_id) VALUES (2, 3, 3, 12);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, transport_id) VALUES (3, 3, 1, 13);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, transport_id) VALUES (4, 1, 2, 14);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, transport_id) VALUES (5, 1, 2, 15);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, transport_id) VALUES (6, 3, 3, 16);
INSERT INTO Motorcycle (id, motorcycle_type_id, seat_count, transport_id) VALUES (7, 3, 1, 17);
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
INSERT INTO Seller (id, fio, birthday) VALUES (1, 'Иванов Иван Иванович	', '1978-06-16');
INSERT INTO Seller (id, fio, birthday) VALUES (2, 'Петров Олег Петрович
', '1981-11-05');
INSERT INTO Seller (id, fio, birthday) VALUES (3, 'Алексеев Алексей Алексеевич
', '1979-09-21');
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
    transport_type_id INTEGER NOT NULL,
    description NVARCHAR(500),
    CONSTRAINT fk_brand FOREIGN KEY (brand_id) REFERENCES spr_Brand (id),
    CONSTRAINT fk_currency FOREIGN KEY (currency_id) REFERENCES spr_Currency (id),
    CONSTRAINT fk_condition FOREIGN KEY (condition_id) REFERENCES spr_Condition (id),
    CONSTRAINT fk_color FOREIGN KEY (color_id) REFERENCES spr_Color (id),
    CONSTRAINT fk_tansport_type FOREIGN KEY (transport_type_id) REFERENCES spr_TransportType (id)
);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (1, 1, 1000, '2010-06-10', 1, 1, 1, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (2, 2, 2400, '2010-07-29', 2, 1, 3, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (3, 3, 900, '2010-05-18', 1, 1, 1, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (4, 2, 3900, '2009-11-07', 1, 1, 2, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (5, 1, 2100, '2009-12-23', 2, 2, 3, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (6, 3, 30000, '2010-12-09', 2, 1, 2, 1, 'Коллекционная модель');
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (7, 1, 16000, '2010-05-12', 1, 1, 1, 1, 'Ручная сборка');
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (8, 3, 5800, '2010-09-12', 2, 2, 3, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (9, 1, 2490, '2010-02-03', 2, 1, 1, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (10, 2, 6390, '2008-09-11', 1, 1, 2, 1, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (11, 3, 6000, '2010-04-15', 2, 1, 3, 2, 'Спортивная версия');
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (12, 3, 2000, '2010-06-13', 1, 1, 2, 2, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (13, 3, 6000, '2010-08-02', 1, 2, 1, 2, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (14, 3, 4500, '2011-02-09', 2, 1, 3, 2, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (15, 3, 7600, '2010-01-25', 1, 2, 1, 2, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (16, 3, 3400, '2010-04-15', 1, 1, 3, 2, null);
INSERT INTO Transport (id, brand_id, price, issue_date, currency_id, condition_id, color_id, transport_type_id, description) VALUES (17, 3, 12000, '2010-04-12', 2, 2, 2, 2, null);
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
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (8, 'Сузуки', 'Suzuki');
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (9, 'Хонда', 'Honda');
INSERT INTO spr_Brand (id, name_ru, name_en) VALUES (10, 'Харли-Дэвидсон', 'Harley-Davidson');
CREATE TABLE spr_CarType
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_CarType (id, name_ru, name_en) VALUES (1, 'Легковая', 'Automobile');
INSERT INTO spr_CarType (id, name_ru, name_en) VALUES (2, 'Грузовик', 'Truck');
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
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (2, 'Лэнд Крузер', 'Land Cruiser');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (3, 'Пассат', 'Passat');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (4, 'Гольф', 'Golf');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (5, 'РАВ 4', 'RAV 4');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (6, 'Камри', 'Camry');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (7, 'Корола', 'Corolla');
INSERT INTO spr_Model (id, name_ru, name_en) VALUES (8, 'Галант', 'Galant');
CREATE TABLE spr_MotorcycleType
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL
);
INSERT INTO spr_MotorcycleType (id, name_ru, name_en) VALUES (1, 'Классик', 'Classic');
INSERT INTO spr_MotorcycleType (id, name_ru, name_en) VALUES (2, 'Спортбайк', 'Sportbike');
INSERT INTO spr_MotorcycleType (id, name_ru, name_en) VALUES (3, 'Суперспорт', 'Supersport');
INSERT INTO spr_MotorcycleType (id, name_ru, name_en) VALUES (4, 'Чоппер', 'Chopper');
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
CREATE TABLE spr_TransportType
(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name_ru NVARCHAR(50) NOT NULL,
    name_en NVARCHAR(50) NOT NULL,
    table_name VARCHAR(50) NOT NULL
);
INSERT INTO spr_TransportType (id, name_ru, name_en, table_name) VALUES (1, 'Автомобиль', 'Car', 'Car');
INSERT INTO spr_TransportType (id, name_ru, name_en, table_name) VALUES (2, 'Мотоцикл', 'Motocycle', 'Motocycle');
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
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_MotorcycleType', 'spr_MotorcycleType', 27, 'CREATE TABLE "spr_MotorcycleType" (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Motorcycle', 'Motorcycle', 18, 'CREATE TABLE [Motorcycle] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [motorcycle_type_id] INTEGER NOT NULL CONSTRAINT [fk_motorcycle_type] REFERENCES [spr_MotorcycleType]([id]) ON DELETE RESTRICT, 
  [seat_count] INTEGER NOT NULL, 
  [transport_id] INTEGER NOT NULL CONSTRAINT [fk_transport] REFERENCES [Transport]([id]) ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'spr_TransportType', 'spr_TransportType', 33, 'CREATE TABLE [spr_TransportType] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name_ru] NVARCHAR(50) NOT NULL, 
  [name_en] NVARCHAR(50) NOT NULL, 
  [table_name] VARCHAR(50) NOT NULL)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'Transport', 'Transport', 13, 'CREATE TABLE [Transport] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [brand_id] INTEGER NOT NULL CONSTRAINT [fk_brand] REFERENCES [spr_Brand]([id]) ON DELETE RESTRICT, 
  [price] DOUBLE NOT NULL, 
  [issue_date] DATE NOT NULL, 
  [currency_id] INTEGER NOT NULL CONSTRAINT [fk_currency] REFERENCES [spr_Currency]([id]) ON DELETE RESTRICT DEFAULT 1, 
  [condition_id] INTEGER NOT NULL CONSTRAINT [fk_condition] REFERENCES [spr_Condition]([id]) ON DELETE RESTRICT, 
  [color_id] INTEGER NOT NULL CONSTRAINT [fk_color] REFERENCES [spr_Color]([id]) ON DELETE RESTRICT, 
  [transport_type_id] INTEGER NOT NULL CONSTRAINT [fk_tansport_type] REFERENCES [spr_TransportType]([id]) ON DELETE RESTRICT, 
  [description] NVARCHAR(500))');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('table', 'BrandModels', 'BrandModels', 34, 'CREATE TABLE [BrandModels] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [brand_id] INTEGER NOT NULL CONSTRAINT [fk_brand] REFERENCES [spr_Brand]([id]) ON DELETE CASCADE, 
  [model_id] INTEGER NOT NULL CONSTRAINT [fk_model] REFERENCES [spr_Model]([id]) ON DELETE CASCADE)');
INSERT INTO sqlite_master (type, name, tbl_name, rootpage, sql) VALUES ('view', 'CarBrand', 'CarBrand', 0, 'CREATE VIEW [CarBrand] AS 
select
m.name_ru as Модель,
t.name_ru as Трансмиссия,
transport.price as Цена,
b.name_ru as Бренд
from Car c
inner join spr_Model m on c.model_id=m.id
inner join spr_Transmission t on c.transmission_id=t.id
inner join Transport transport on c.transport_id=transport.id
inner join spr_Brand b on transport.brand_id = b.id');
CREATE TABLE sqlite_sequence
(
    name unknown,
    seq unknown
);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Seller', 11);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Brand', 10);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_CarType', 4);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Model', 8);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Privod', 3);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Transmission', 2);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Car', 10);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Sale', 5);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Color', 3);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Condition', 2);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_Currency', 2);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_MotorcycleType', 4);
INSERT INTO sqlite_sequence (name, seq) VALUES ('spr_TransportType', 3);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Transport', 17);
INSERT INTO sqlite_sequence (name, seq) VALUES ('Motorcycle', 7);
INSERT INTO sqlite_sequence (name, seq) VALUES ('BrandModels', 7);
CREATE TABLE sqlite_stat1
(
    tbl unknown,
    idx unknown,
    stat unknown
);
INSERT INTO sqlite_stat1 (tbl, idx, stat) VALUES ('Car', 'sqlite_autoindex_Car_1', '1 1');
CREATE TABLE CarBrand
(
    Модель NVARCHAR(50),
    Трансмиссия NVARCHAR(50),
    Цена DOUBLE,
    Бренд NVARCHAR(50)
);
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Прадо', 'ручная', 1000, 'Тойота');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Гольф', 'автоматическая', 2400, 'БМВ');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Пассат', 'ручная', 900, 'Субару');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Прадо', 'ручная', 3900, 'БМВ');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Гольф', 'автоматическая', 2100, 'Тойота');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Прадо', 'ручная', 30000, 'Субару');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Пассат', 'ручная', 16000, 'Тойота');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Пассат', 'автоматическая', 5800, 'Субару');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Лэнд Крузер', 'ручная', 2490, 'Тойота');
INSERT INTO CarBrand (Модель, Трансмиссия, Цена, Бренд) VALUES ('Прадо', 'автоматическая', 6390, 'БМВ');