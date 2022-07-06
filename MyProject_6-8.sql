/* 6. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы) */

/*	6.1 Определить наиболее затратную статью затрат. */

	USE PL;

	SELECT
	 a.ArticleName,
	 SUM(l.Summa) AS total
	FROM
	 loots l	
	JOIN
	 article a
	ON  
	 l.idArticle =	a.idArticle
	GROUP BY a.ArticleName
	ORDER BY total DESC;



/*	6.2 Определить наиболее доходного покупателя. */

	SELECT
	 c.CompanyName,
	 SUM(p.Summa) AS total
	FROM
	 profit p	
	JOIN
	 customer c
	ON  
	 p.idCustomer =	c.idCustomer
	GROUP BY c.CompanyName
	ORDER BY total DESC;


/*	6.3 Определить совокупную зарубежную выручку за 2022 год. */

	SELECT
	 SUM(p.Summa) AS total
	FROM
	 profit p	
	JOIN
	 customer c
	JOIN
	 timepl t
	ON  
	 p.idCustomer =	c.idCustomer AND p.idTimeP = t.idTime
	WHERE c.Country <> 'Россия' AND t.Year_pl = 2022;


/*	6.4 Определить прогнозную совокупную выручку внутри РФ за 2023-2024 года. */

	SELECT
	 SUM(p.Summa) AS total
	FROM
	 profit p	
	JOIN
	 customer c
	JOIN
	 timepl t
	ON  
	 p.idCustomer =	c.idCustomer AND p.idTimeP = t.idTime
	WHERE c.Country = 'Россия' AND t.Year_pl <> 2022;


/*	6.5 Определить 5 наиболее доходных продуктов. */

	SELECT
	 pr.ProductName,
	 COUNT(p.Summa) AS cnt,
	 SUM(p.Summa) AS total
	FROM
	 profit p	
	JOIN
	 product pr
	ON  
	 p.idProduct =	pr.idProduct
	GROUP BY  pr.ProductName
	ORDER BY total DESC
	LIMIT 5;


/*	6.6 Вывести бюджет доходов и расходов за 2022 год. */

	SELECT
	 CONCAT(t.Year_pl,' ',t.Quarter_pl,' квартал') AS period,
	 SUM(p.Summa) AS dohod,
	 SUM(l.Summa) AS rashod,
	 (SUM(p.Summa) - SUM(l.Summa)) AS profit_,
	 ROUND((SUM(p.Summa) - SUM(l.Summa))*0.2) AS tax,
	 ((SUM(p.Summa) - SUM(l.Summa)) -  ROUND((SUM(p.Summa) - SUM(l.Summa))*0.2)) AS net_profit
	FROM
	 profit p	
	JOIN
	 loots l	
	JOIN	 
	 timepl t
	ON  
	 p.idTimeP = t.idTime AND l.idTimeL = t.idTime 
	WHERE t.Year_pl = 2022
	GROUP BY t.Quarter_pl;


/* 7. представления (минимум 2)*/

/*	7.1 Создать представление бюджета доходов и расходов. */

CREATE OR REPLACE VIEW v_bdr
AS SELECT 
	 CONCAT(t.Year_pl,' ',t.Quarter_pl,' квартал') AS period,
	 SUM(p.Summa) AS dohod,
	 SUM(l.Summa) AS rashod,
	 (SUM(p.Summa) - SUM(l.Summa)) AS profit_,
	 ROUND((SUM(p.Summa) - SUM(l.Summa))*0.2) AS tax,
	 ((SUM(p.Summa) - SUM(l.Summa)) -  ROUND((SUM(p.Summa) - SUM(l.Summa))*0.2)) AS net_profit
	FROM	
	 profit p	
	JOIN
	 loots l	
	JOIN	 
	 timepl t
	ON  
	 p.idTimeP = t.idTime AND l.idTimeL = t.idTime 
	GROUP BY t.Year_pl, t.Quarter_pl;


SELECT * FROM v_bdr;

/*	7.2 Создать представление бюджета доходов. */


CREATE OR REPLACE VIEW v_profit
AS SELECT 
	 CONCAT(t.Year_pl,' ',t.Quarter_pl,' квартал') AS period,
	 pr.ProductCategory,
	 pr.ProductName,
	 c.CompanyName,
	 p.Price,
	 p.Quantity,
	 p.Summa
	FROM	
	 profit p	
	JOIN
	 product pr	
	JOIN
	 customer c
	JOIN	 
	 timepl t
	ON  
	 p.idTimeP = t.idTime AND p.idProduct = pr.idProduct AND p.idCustomer = c.idCustomer 
	GROUP BY t.Year_pl, t.Quarter_pl;

SELECT * FROM v_profit;


/* 8. хранимые процедуры / триггеры */

/*	8.1 Создать процедуру вывода суммы затрат для указанной статьи затртат. */

DROP PROCEDURE IF EXISTS sp_loots; 
DELIMITER //
CREATE PROCEDURE sp_loots(sp_article VARCHAR(45))
BEGIN
	SELECT
	 SUM(l.Summa) AS total
	FROM
	 loots l	
	JOIN
	 article a
	ON  
	 l.idArticle =	a.idArticle
	WHERE a.ArticleName = sp_article;
END //
DELIMITER ;

CALL sp_loots('Заработная плата');

/*	8.2 Создать функцию вывода суммы дохода для указанного бизнес-направления. */


CREATE FUNCTION pl.f_doxod_bn(f_category VARCHAR(45))
RETURNS DECIMAL(10,2) READS SQL DATA
BEGIN
	 DECLARE sum_cat DECIMAL(10,2);
	
	 SET f_category = (
		SELECT
		 SUM(p.Summa)
		FROM
		 profit p	
		JOIN
		 product pr
		ON  
		 p.idProduct =	pr.idProduct
		WHERE pr.ProductCategory = f_category);
	
	RETURN sum_cat;

END;

SELECT f_doxod_bn('Промышленное машиностроение');


/*	8.3 Создать триггер контроля удаления последней строки в таблице bdr. */


CREATE DEFINER=`root`@`localhost` TRIGGER `check_bdr` BEFORE DELETE ON `bdr` FOR EACH ROW BEGIN 
	DECLARE total INT;
	SELECT COUNT(*) INTO total FROM bdr;
	IF total <=1 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Удаление последней записи!';
	END IF;
END;
































