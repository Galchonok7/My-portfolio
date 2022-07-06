/*  КУРСОВОЙ ПРОЕКТ
  
	1. Составить общее текстовое описание БД и решаемых ею задач.

	База данных Бюджет доходов и расходов Машиностроительного предприятия. 

			Описание: 
		
			1.Время (год, квартал, месяц, день) - справочник
			2.Покупатели (наименование компании, город, страна) - справочник
			3.Продукция (категория продукции, наименование продукции) - справочник
			4.Статья затрат (категория статьи, наименование статьи) - справочник  
			5.Бюджет доходов (цена, количество, сумма) - результирующая таблица
			6.Бюджет расходов (цена, количество, сумма) - результирующая таблица
			7.Бюджет доходов и расходов (прибыль, налог на прибыль, чистая прибыль) - итоговая таблица
			
	
	2. Мминимальное количество таблиц - 10;
	3. Скрипты создания структуры БД (с первичными ключами, индексами, внешними ключами);
	4. ERDiagram для БД;
	5. Скрипты наполнения БД данными;	
*/


DROP DATABASE IF EXISTS pl;
CREATE DATABASE pl;
USE pl;

DROP TABLE IF EXISTS Timepl;
CREATE TABLE Timepl (
  idTime SERIAL PRIMARY KEY,
  Year_pl INT,
  Quarter_pl INT,
  Month_pl INT,
  Day_pl INT
  );

 
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2022, 1, 3, 31);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2022, 2, 6, 30);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2022, 3, 9, 30);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2022, 3, 12, 31);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2023, 1, 3, 31);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2023, 2, 6, 30);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2023, 3, 9, 30);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2023, 3, 12, 31);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2024, 1, 3, 31);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2024, 2, 6, 30);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2024, 3, 9, 30);
INSERT INTO pl.Timepl (Year_pl, Quarter_pl, Month_pl, Day_pl) VALUES(2024, 3, 12, 31); 
 
 
DROP TABLE IF EXISTS Customer;  
CREATE TABLE Customer (
  idCustomer SERIAL PRIMARY KEY,
  CompanyName VARCHAR(100) NOT NULL,
  City VARCHAR(45) NOT NULL,
  Country VARCHAR(45) NOT NULL
  );

INSERT INTO pl.customer (CompanyName, City, Country) VALUES('ООО "Рога и копыта"','Москва','Россия');
INSERT INTO pl.customer (CompanyName, City, Country) VALUES('ООО "Звезда"','Санкт-Петербург','Россия');
INSERT INTO pl.customer (CompanyName, City, Country) VALUES('ООО "Лохматыые веники"','Тула','Россия');
INSERT INTO pl.customer (CompanyName, City, Country) VALUES('АО "Большое предприятие"','Екатеринбург','Россия');
INSERT INTO pl.customer (CompanyName, City, Country) VALUES('АО "Крупное предприятие"','Нижний Новгород','Россия');
INSERT INTO pl.customer (CompanyName, City, Country) VALUES('ЗАО "Наш заказчик"','Казань','Россия');
INSERT INTO pl.customer (CompanyName, City, Country) VALUES('Уз_заказчик','Ташкент','Узбекистан');
INSERT INTO pl.customer (CompanyName, City, Country) VALUES('Яп_заказчик','Токио','Япония');
INSERT INTO pl.customer (CompanyName, City, Country) VALUES('Кит_заказчик','Сеул','Китай');

 
DROP TABLE IF EXISTS Product; 
CREATE TABLE Product (
  idProduct SERIAL PRIMARY KEY,
  ProductCategory VARCHAR(45) NOT NULL,
  ProductName VARCHAR(100) NOT NULL
  );

 
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Промышленное машиностроение','Станок УК-10');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Промышленное машиностроение','Станок ЯК-25');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Промышленное машиностроение','Паровой котел ША-45');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Промышленное машиностроение','Паровой котел ША-95');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Судостроение','Промышленная установка ФА-156');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Судостроение','Турбина ПРИ-29');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Судостроение','Тепловая установка ЛПР-1');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Сервис','Обслуживание станков');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Сервис','Обслуживание котлов');
INSERT INTO pl.product (ProductCategory, ProductName) VALUES('Сервис','Обслуживание турбин');
 
 
DROP TABLE IF EXISTS Article;  
CREATE TABLE Article (
  idArticle SERIAL PRIMARY KEY,
  ArticleCategory VARCHAR(45) NOT NULL,
  ArticleName VARCHAR(45) NOT NULL
  );

INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Прямые затраты','Заработная плата');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Прямые затраты','Материалы');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Прямые затраты','Основные средства');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Общепроиводственные затраты','Заработная плата');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Общепроиводственные затраты','Материалы');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Общепроиводственные затраты','Основные средства');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Общехозяйственные затраты','Заработная плата');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Общехозяйственные затраты','Материалы');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Общехозяйственные затраты','Основные средства');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Управленческие затраты','Заработная плата');
INSERT INTO pl.article (ArticleCategory,ArticleName) VALUES('Управленческие затраты','Заработная плата');
 
 
 
DROP TABLE IF EXISTS Profit;   
CREATE TABLE Profit (
  idProfit SERIAL PRIMARY KEY,
  Price DECIMAL(8,2) NOT NULL,
  Quantity FLOAT NOT NULL,
  Summa DECIMAL(10,2) AS (Price * Quantity) STORED,
  idTimeP BIGINT UNSIGNED NOT NULL,
  idCustomer BIGINT UNSIGNED NOT NULL,
  idProduct BIGINT UNSIGNED NOT NULL,
  INDEX idTimeP_idx (idTimeP ASC) VISIBLE,
  INDEX idCustomer_idx (idCustomer ASC) VISIBLE,
  INDEX idProduct_idx (idProduct ASC) VISIBLE,
  CONSTRAINT idTimeP
    FOREIGN KEY (idTimeP)
    REFERENCES pl.Timepl (idTime)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT idCustomer
    FOREIGN KEY (idCustomer)
    REFERENCES pl.Customer (idCustomer)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT idProduct
    FOREIGN KEY (idProduct)
    REFERENCES pl.Product (idProduct)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(100,200, 1, 1, 1);
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(200,400, 2, 7, 2);   
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(600,800, 3, 2, 3); 
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(200,400, 4, 4, 5); 
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(200,150, 5, 3, 6); 
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(52,300, 6, 4, 8); 
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(140,250, 7,7, 2); 
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(78,450, 8, 1, 2); 
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(56,300, 9, 8, 2); 
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(89,100, 10, 1, 2); 
INSERT INTO pl.profit (Price, Quantity, idTimeP, idCustomer, idProduct) VALUES(52,300, 11, 9, 2);   
   
   
   
DROP TABLE IF EXISTS Loots; 
CREATE TABLE Loots (
  idLoots SERIAL PRIMARY KEY,
  Price DECIMAL(8) NOT NULL,
  Quantity FLOAT NOT NULL,
  Summa DECIMAL(10,2) AS (Price * Quantity) STORED,
  idTimeL BIGINT UNSIGNED NOT NULL,
  idArticle BIGINT UNSIGNED NOT NULL,
  INDEX idTimeL_idx (idTimeL ASC) VISIBLE,
  INDEX idArticle_idx (idArticle ASC) VISIBLE,
  CONSTRAINT idTimeL
    FOREIGN KEY (idTimeL)
    REFERENCES pl.Timepl (idTime)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT idArticle
    FOREIGN KEY (idArticle)
    REFERENCES pl.Article (idArticle)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(100,200, 1, 1);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(1000,50, 2, 2);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(10,8000, 3, 3);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(80,150, 4, 4);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(500,40, 5, 2);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(15,700, 6, 1);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(60,100, 7, 6);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(300,50, 8, 7);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(25,400, 9, 6);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(50,500, 10, 8);
INSERT INTO pl.loots (Price, Quantity, idTimeL, idArticle) VALUES(50,500, 11, 9);  
   
   
  
DROP TABLE IF EXISTS BDR; 
CREATE TABLE BDR (
  idBDR SERIAL PRIMARY KEY,
  Profit DECIMAL(10,2) NOT NULL,
  Tax DECIMAL(10,2) NOT NULL,
  NetProfit DECIMAL(10,2) NOT NULL
  );

DROP TABLE IF EXISTS BDR_has_Profit; 
CREATE TABLE BDR_has_Profit (
  BDR_idBDR BIGINT UNSIGNED NOT NULL,
  Profit_idProfit BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (BDR_idBDR, Profit_idProfit),
  INDEX fk_BDR_has_Profit_Profit1_idx (Profit_idProfit ASC) VISIBLE,
  INDEX fk_BDR_has_Profit_BDR1_idx (BDR_idBDR ASC) VISIBLE,
  CONSTRAINT fk_BDR_has_Profit_BDR1
    FOREIGN KEY (BDR_idBDR)
    REFERENCES pl.BDR (idBDR)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_BDR_has_Profit_Profit1
    FOREIGN KEY (Profit_idProfit)
    REFERENCES pl.Profit (idProfit)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


DROP TABLE IF EXISTS BDR_has_Loots; 
CREATE TABLE BDR_has_Loots (
  BDR_idBDR BIGINT UNSIGNED NOT NULL,
  Loots_idLoots BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (BDR_idBDR, Loots_idLoots),
  INDEX fk_BDR_has_Loots_Loots1_idx (Loots_idLoots ASC) VISIBLE,
  INDEX fk_BDR_has_Loots_BDR1_idx (BDR_idBDR ASC) VISIBLE,
  CONSTRAINT fk_BDR_has_Loots_BDR1
    FOREIGN KEY (BDR_idBDR)
    REFERENCES pl.BDR (idBDR)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_BDR_has_Loots_Loots1
    FOREIGN KEY (Loots_idLoots)
    REFERENCES pl.Loots (idLoots)
    ON DELETE CASCADE
    ON UPDATE CASCADE);



