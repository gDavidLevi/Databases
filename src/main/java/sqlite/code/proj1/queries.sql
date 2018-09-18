-- Вывести все автомобили с ручной коробкой передач
select *
from Car
where transmission_id = 1;
-- или
select car.*
from Car car
       join spr_Transmission tr on car.transmission_id = tr.id
where tr.name_ru = 'ручная';

-- Вывести случайную запись из таблицы Car
select *
from Car
order by RANDOM()
limit 0,1;

-- Сгруппировать продавцов по году рождения (без месяца и дня) и для каждого года вывести количество людей
select strftime('%Y', birthday) as birthyear, count(id) as seller_count
from Seller
group by birthyear;

-- Вывести возраст всех продавцов (необходимо посчитать возраст до сегодняшнего дня)
select birthday,
       fio,
       case
         when strftime('%j', birthday) - strftime('%j', date('now')) < 0
                 then (strftime('%Y', 'now') - strftime('%Y', birthday))
         else (strftime('%Y', 'now') - strftime('%Y', birthday)) - 1
           end as years
from seller;

-- Вывести данные (поля) по всем автомобилям (из обеих таблиц Car и Transport),
-- первый пункт, но только для проданных автомобилей
select distinct c.id,
                crt.[name_ru]       as "Тип автомобиля",
                m.[name_ru]         as "Модель",
                tr.[name_ru]        as "Коробка передач",
                p.[name_ru]         as "Привод",
                c.[capacity]        as "Объем двигателя",
                br.[name_ru]        as "Бренд",
                tsprt.[price]       as "Цена",
                tsprt.[issue_date]  as "Дата выпуска",
                curr.[name_ru]      as "Валюта",
                cond.[name_ru]      as "Состояние",
                col.[name_ru]       as "Цвет",
                tsprt.[description] as "Описание"
from Car c
       inner join [spr_Transmission] tr on c.[transmission_id] = tr.id
       inner join [spr_Privod] p on c.[privod_id] = p.id
       inner join [spr_Model] m on c.[model_id] = m.id
       inner join [Transport] tsprt on c.[transport_id] = tsprt.id
       inner join [spr_Currency] curr on tsprt.[currency_id] = curr.id
       inner join [spr_Condition] cond on tsprt.[condition_id] = cond.id
       inner join [spr_Color] col on tsprt.[color_id] = col.id
       inner join [spr_CarType] crt on c.[car_type_id] = crt.id
       inner join [spr_Brand] br on tsprt.[brand_id] = br.id
       inner join [Sale] sale on tsprt.[id] = sale.transport_id
order by crt.[name_ru];

-- Первый пункт, но только для марки Toyota, цена которых меньше 3000 $  (учитывать валюту)
select c.id,
       crt.[name_ru]       as "Тип автомобиля",
       m.[name_ru]         as "Модель",
       tr.[name_ru]        as "Коробка передач",
       p.[name_ru]         as "Привод",
       c.[capacity]        as "Объем двигателя",
       br.[name_ru]        as "Бренд",
       tsprt.[price]       as "Цена",
       tsprt.[issue_date]  as "Дата выпуска",
       curr.[name_ru]      as "Валюта",
       cond.[name_ru]      as "Состояние",
       col.[name_ru]       as "Цвет",
       tsprt.[description] as "Описание"
from Car c
       inner join [spr_Transmission] tr on c.[transmission_id] = tr.id
       inner join [spr_Privod] p on c.[privod_id] = p.id
       inner join [spr_Model] m on c.[model_id] = m.id
       inner join [Transport] tsprt on c.[transport_id] = tsprt.id
       inner join [spr_Currency] curr on tsprt.[currency_id] = curr.id
       inner join [spr_Condition] cond on tsprt.[condition_id] = cond.id
       inner join [spr_Color] col on tsprt.[color_id] = col.id
       inner join [spr_CarType] crt on c.[car_type_id] = crt.id
       inner join [spr_Brand] br on tsprt.[brand_id] = br.id
where tsprt.[brand_id] = 1
  and tsprt.[price] < 3000
  and tsprt.[currency_id] = 2
order by crt.[name_ru];

-- По каждому продавцу вывести кол-во проданных им автомобилей
select seller.[id], seller.[fio] as "ФИО", count(seller.[fio]) as "Количество продаж"
from Seller
       inner join [Sale] on Seller.[id] = Sale.seller_id
group by seller.[fio], seller.[id]
order by seller.[fio];

-- Вывести суммарную выручку по продажам автомобилей за январь 2011 г
select sum(t.[price]) as "Выручка"
from Sale s
       inner join [Transport] t on t.[id] = s.transport_id
where strftime('%Y', s.[sale_date]) = '2011'
  and strftime('%m', s.[sale_date]) = '01';

-- Получить всех продавцов, которые продали хотя бы одну подержанную машину
select s.[fio] as "ФИО"
from Seller s
       inner join Sale sl on sl.[seller_id] = s.id
       inner join [Transport] t on sl.[transport_id] = t.id
where t.[condition_id] = 2;

-- Получить всех продавцов, которые не продали ни одной машины, вывести в алфавитном порядке по ФИО
select s.[fio] as "ФИО", sl.[transport_id]
from Seller s
       left join Sale sl on sl.[seller_id] = s.id
where sl.[transport_id] is null
order by "ФИО";

-- Получить по каждому продавцу количество проданных им машин марки Toyota, где цена >= 1000 $
select seller.[id], seller.[fio] as "ФИО", t.[price], count(seller.[fio]) as "Количество продаж"
from Seller
       inner join [Sale] on Seller.[id] = Sale.seller_id
       inner join [Transport] t on Sale.[transport_id] = t.id
group by seller.[fio], seller.[id], t.[price]
having t.[price] >= 1000
   and t.[currency_id] = 2
   and t.[brand_id] = 1
order by seller.[fio];

-- Вывести данные (поля) по всем автомобилям (из обеих таблиц Car и Transport),
-- чтобы вместо id значений из справочников выводились наименования на русском
select c.id,
       (select name_ru from [spr_CarType] crt where c.[car_type_id] = crt.id)          as "Тип автомобиля",
       (select name_ru from [spr_Model] m where c.[model_id] = m.id)                   as "Модель",
       (select name_ru from [spr_Transmission] tr where c.[transmission_id] = tr.id)   as "Коробка передач",
       (select name_ru from [spr_Privod] p where c.[privod_id] = p.id)                 as "Привод",
       c.[capacity]                                                                    as "Объем двигателя",
       (select name_ru from [spr_Brand] br where tsprt.[brand_id] = br.id)             as "Бренд",
       tsprt.[price]                                                                   as "Цена",
       tsprt.[issue_date]                                                              as "Дата выпуска",
       (select name_ru from [spr_Currency] curr where tsprt.[currency_id] = curr.id)   as "Валюта",
       (select name_ru from [spr_Condition] cond where tsprt.[condition_id] = cond.id) as "Состояние",
       (select name_ru from [spr_Color] col where tsprt.[color_id] = col.id)           as "Цвет",
       tsprt.[description]                                                             as "Описание"
from Car c,
     Transport tsprt
where c.[transport_id] = tsprt.[id];

-- Первый пункт, но только для проданных автомобилей
select c.id,
       (select name_ru from [spr_CarType] crt where c.[car_type_id] = crt.id)          as "Тип автомобиля",
       (select name_ru from [spr_Model] m where c.[model_id] = m.id)                   as "Модель",
       (select name_ru from [spr_Transmission] tr where c.[transmission_id] = tr.id)   as "Коробка передач",
       (select name_ru from [spr_Privod] p where c.[privod_id] = p.id)                 as "Привод",
       c.[capacity]                                                                    as "Объем двигателя",
       (select name_ru from [spr_Brand] br where tsprt.[brand_id] = br.id)             as "Бренд",
       tsprt.[price]                                                                   as "Цена",
       tsprt.[issue_date]                                                              as "Дата выпуска",
       (select name_ru from [spr_Currency] curr where tsprt.[currency_id] = curr.id)   as "Валюта",
       (select name_ru from [spr_Condition] cond where tsprt.[condition_id] = cond.id) as "Состояние",
       (select name_ru from [spr_Color] col where tsprt.[color_id] = col.id)           as "Цвет",
       tsprt.[description]                                                             as "Описание"
from Car c,
     Transport tsprt
where c.[transport_id] = tsprt.[id]
  and tsprt.[id] in (select transport_id from Sale);

-- Первый пункт, но только для марки Toyota, цена которых меньше 3000 $  (учитывать валюту)
select c.id,
       (select name_ru from [spr_CarType] crt where c.[car_type_id] = crt.id)          as "Тип автомобиля",
       (select name_ru from [spr_Model] m where c.[model_id] = m.id)                   as "Модель",
       (select name_ru from [spr_Transmission] tr where c.[transmission_id] = tr.id)   as "Коробка передач",
       (select name_ru from [spr_Privod] p where c.[privod_id] = p.id)                 as "Привод",
       c.[capacity]                                                                    as "Объем двигателя",
       (select name_ru from [spr_Brand] br where tsprt.[brand_id] = br.id)             as "Бренд",
       tsprt.[price]                                                                   as "Цена",
       tsprt.[issue_date]                                                              as "Дата выпуска",
       (select name_ru from [spr_Currency] curr where tsprt.[currency_id] = curr.id)   as "Валюта",
       (select name_ru from [spr_Condition] cond where tsprt.[condition_id] = cond.id) as "Состояние",
       (select name_ru from [spr_Color] col where tsprt.[color_id] = col.id)           as "Цвет",
       tsprt.[description]                                                             as "Описание"
from Car c,
     Transport tsprt
where c.[transport_id] = tsprt.[id]
  and tsprt.[brand_id] = 1
  and tsprt.[price] < 3000
  and tsprt.[currency_id] = 2;

-- По каждому продавцу вывести кол-во проданных им автомобилей
select seller.[id], seller.[fio], (select count(id) from Sale where seller.id = sale.seller_id) as sale_count
from Seller
group by seller.[fio], seller.[id]
having sale_count > 0;

-- Вывести суммарную выручку по продажам автомобилей за январь 2011 г
select sum(t.[price]) as "Выручка"
from Transport t
where t.[id] in (select transport_id
                 from Sale s
                 where strftime('%Y', s.[sale_date]) = '2011'
                   and strftime('%m', s.[sale_date]) = '01');

-- Получить всех продавцов, которые продали хотя бы одну подержанную машину
select s.[fio] as "ФИО"
from Seller s
where s.[id] in
      (select seller_id from Sale where [transport_id] in (select id from [Transport] where [condition_id] = 2));

-- Получить всех продавцов, которые не продали ни одной машины, вывести в алфавитном порядке по ФИО
select s.[fio] as "ФИО"
from Seller s
where s.[id] not in (select seller_id from Sale)
order by "ФИО";

-- Получить по каждому продавцу количество проданных им машин марки Toyota, где цена >= 1000 $
select seller.[id], seller.[fio] as "ФИО", count(seller.[fio]) as "Количество продаж"
from Seller
where Seller.id in (select seller_id
                    from Sale
                    where [transport_id] in
                          (select id from [Transport] t where t.[price] >= 1000
                                                          and t.[currency_id] = 2
                                                          and t.[brand_id] = 1))
group by seller.[fio], seller.[id]
order by seller.[fio];

-- Удаление всех автомобилей Тойота и БМВ
-- delete
-- from Car
-- where [transport_id]
--         in (select id
--             from [Transport]
--             where [brand_id]
--                     in (select id from spr_Brand where name_ru = 'Тойота'
--                                                     or name_ru = 'БМВ'));

