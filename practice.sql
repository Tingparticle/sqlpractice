######data definition####################################

CREATE DATABASE practice2;

CREATE TABLE test (
	id int,
    name varchar(45) NOT NULL UNIQUE,
    Adress varchar(45)NOT NULL UNIQUE,
    phone varchar(45),
    work varchar(45),
    PRIMARY KEY (id)
) ;
    
ALTER TABLE test ADD UNIQUE (phone);
ALTER TABLE test ADD CHECK(id>0);
ALTER TABLE test ALTER COLUMN phone SET DEFAULT '未知';
#Q2?#

CREATE TABLE testo (
	id_o int,
    order_no VARCHAR(45),
    id int,
    PRIMARY KEY (id_o),
    FOREIGN KEY (id) REFERENCES test(id)
);
#test裡的id要是主健，在testo才可以設成外健#

DROP TABLE testo;

CREATE TABLE testo(
	id_o int,
    order_no VARCHAR(45),
    id int,
    PRIMARY KEY (id_o)
);
#id int 要存在，ALTER才可以把它變成外健#

ALTER TABLE testo ADD FOREIGN KEY (id) REFERENCES test(id);
ALTER TABLE testo ADD CONSTRAINT ID FOREIGN KEY (id) REFERENCES test(id);
	
SELECT *
FROM test;

SELECT *
FROM testo;
    
ALTER TABLE test ADD friend varchar(45);

ALTER TABLE test ALTER COLUMN friend int; 
#Q1?#

ALTER TABLE test DROP COLUMN friend;

TRUNCATE TABLE test;

DROP TABLE test;

DROP DATABASE practice2;

#分開字元 用``框住字#
DROP TABLE titanic.`social service`;

SELECT *
FROM titanic.`social service`;
#分開字元 用``框住字#


######data manipulation####################################


INSERT INTO test(
	id,
    name,
    Adress,
    phone,
    work
)
VALUES(
	1,
    'Ting',
    'Taipei',
    '0953873917',
    'BA'
);

SELECT *
FROM test;


UPDATE test SET 
work = 'pg'
WHERE name = 'Ting';

DELETE FROM test
WHERE name = 'Ting';


CREATE TABLE test2 (
	id int,
    name varchar(45) NOT NULL UNIQUE,
    Adress varchar(45)NOT NULL UNIQUE,
    phone varchar(45),
    work varchar(45),
    PRIMARY KEY (id)
) ;

INSERT INTO test2(
	id,
    name,
    Adress,
    phone,
    work
)
VALUES(
	1,
    'Ting',
    'Taipei',
    '0953873917',
    'BA'
);

CREATE TABLE testbc (
	id int,
    name varchar(45) NOT NULL UNIQUE,
    Adress varchar(45)NOT NULL UNIQUE,
    phone varchar(45),
    work varchar(45),
    PRIMARY KEY (id)
) ;

# mysql 数据库是不支持 SELECT INTO FROM #
SELECT * INTO testbc 
FROM test2;
# mysql 数据库是不支持 SELECT INTO FROM #

CREATE TABLE testbc(
	SELECT*
    FROM test
);


SELECT *
FROM testbc;

DROP TABLE testbc;


######Queries####################################

SELECT *
FROM test
WHERE name = 'Ting';


SELECT *
FROM iris
ORDER BY id;


SELECT DISTINCT Species
FROM iris;

SELECT *
FROM iris
LIMIT 10;

SELECT TOP 10 PERCENT *
FROM iris;
#Q3? mysql不支持#

SELECT *
FROM iris
WHERE id<= 70
ORDER BY 'Species';

SELECT *
FROM iris
WHERE 'Sepal.Length'<= 5;
#Q4? 無法用Sepal.Length下條件查詢#


SELECT 'Sepal.Length', 'Sepal.Width'
FROM iris
WHERE id IN (1,2,3);

SELECT *
FROM iris
WHERE id
BETWEEN 30  AND 70;


SELECT *
FROM iris AS ir
WHERE Species LIKE 'virg%';


INSERT INTO testgrades(
	id,
    name,
    grades
)
VALUES(
	'1',
    'Ting',
    '97'
);

INSERT INTO testgrades(
	id,
    name,
    grades
)
VALUES(
	'2',
    'rose',
    '88'
);

INSERT INTO testgrades(
	id,
    name,
    grades
)
VALUES(
	'3',
    'kobe',
    '90'
);

CREATE TABLE testgrades2(
SELECT*
FROM testgrades
);


SELECT *
FROM testgrades2;

DELETE FROM testgrades
WHERE id = '2';

DROP TABLE testgrades2;


SELECT *
FROM testgrades AS t1
INNER JOIN testgrades2 AS t2
ON t1.id = t2.id;




SELECT *
FROM testgrades AS t1
LEFT JOIN testgrades2 AS t2
ON t1.id = t2.id;

SELECT *
FROM testgrades2 AS t2
LEFT JOIN testgrades AS t1
ON t2.id  = t1.id;


SELECT *
FROM testgrades AS t1
RIGHT JOIN testgrades2 AS t2
ON t1.id = t2.id;



SELECT *
FROM testgrades2 AS t2
FULL JOIN testgrades AS t1
ON t2.id  = t1.id;
#Q5? FULL JOIN MYSQL 語法問題#
#A5 MySQL 資料庫中沒有 FULL JOIN，但是可以用 UNION 來模擬。#

SELECT *
FROM testgrades AS t1
CROSS JOIN testgrades2 AS t2;


SELECT *
FROM testgrades AS t1
NATURAL JOIN testgrades2 AS t2;

SELECT *
FROM testgrades
UNION
SELECT *
FROM testgrades2;


SELECT *
FROM testgrades
INTERSECT
SELECT *
FROM testgrades2;
#MySQL 目前還不支援 INTERSECT。#


SELECT *
FROM testgrades
MINUS
SELECT *
FROM testgrades2;
#MySQL 目前還不支援 MINUS。#


SELECT t1.grades,
CASE 'level'
WHEN 97 THEN 'A'
WHEN 90 THEN 'B'
WHEN 88 THEN 'C'
END
FROM testgrades AS t1;

#Q6? ABC塞不進去欄位中#

SELECT *
FROM iris;

SELECT AVG('Petal.Width')
FROM iris;

#Q7? 'Petal.Width'等字串的平均都是0 ，跑id是可以的#

SELECT COUNT('Petal.Width')
FROM iris;

SELECT MAX('Petal.Width')
FROM iris;
#Q8? 'Petal.Width'等字串的最大都是'Petal.Width'，跑id是可以的#

SELECT MIN('Petal.Width')
FROM iris;
#Q9? 'Petal.Width'等字串的最小都是'Petal.Width'，跑id是可以的#

SELECT SUM('Petal.Width')
FROM iris;
#Q10? 'Petal.Width'等字串的總和是0，跑id是可以的#

SELECT*
FROM mtcars;

SELECT COUNT(id)
FROM mtcars;

SELECT *,
SUM(wt)
FROM mtcars
WHERE cyl >= 7
GROUP BY id;
 
SELECT *,
SUM(wt)
FROM mtcars
GROUP BY id
HAVING SUM(wt)>=4;

SELECT CONCAT(id,'-',wt)
FROM mtcars;


SELECT LENGTH(id)
FROM mtcars;

SELECT REPLACE(id, 'AMC Javelin', 'woo')
FROM mtcars;

SELECT MID(id,1,3)
FROM mtcars;


SELECT ABS(-20);
SELECT ABS(20);

SELECT FLOOR(qsec)
FROM mtcars;

SELECT CEIL(-2.1);

SELECT ROUND(wt, 1)
FROM mtcars;




