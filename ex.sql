--Questão 01 – Faça um INSERT na tabela Locations (0,5 )

INSERT INTO locations VALEUS (99, 'meu end', '666', 'guaiba', 'RS', 'BR')

--Questão 02 –  Faça UPDATE de postal_code e country_id em uma linha da tabela “Locations”. (0,5 )

UPDATE locations SET 
postal_code = '97987897',
coutry_id= 'CH'
WHERE location_id=3200;

--Questão 03 –  DELETE as linhas da tabela countries os países Japão, China e Singapura. Se precisar faça outras exclusões em outras tabelas. Mostre todas elas. (1,0)

DELETE FROM locations WHERE locations_id=1200 OR locations_id=1300 OR locations_id=2000 OR locations_id=2300;
DELETE FROM countries WHERE country_id='JP';
DELETE FROM countries WHERE country_id='CN';
DELETE FROM countries WHERE country_id='SG';

/*
Questão 04– Faça uma consulta que retorne: (1,5 pto)
01 - A cidade com maior número de letras (mostrar o número de letras),
02 - O nome do primeiro endereço em ordem alfabética, 
03 - A cidade com menor número de letras (mostrar o número de letras), 
04 - O endereço com maior número de letras (mostrar o número de letras),
05 - Todos os resultados acima concatenados,
06 - O número de caracteres de todos os resultados concatenados.
Faça os apelidos das colunas de acordo com a figura abaixo. 
*/

SELECT 
	MAX(LENGTH(city))           AS '01',
	MIN(street_address)         AS '02',
	MIN(LENGTH(city))           AS '03',
	MAX(LENGTH(street_address)) AS '04',
	CONCAT(MAX(LENGTH(city)),MIN(street_address),MIN(LENGTH(city)),MAX(LENGTH(street_address))) AS '05',
	LENGTH(CONCAT(MAX(LENGTH(city)),MIN(street_address),MIN(LENGTH(city)),MAX(LENGTH(street_address)))) AS '06'
FROM locations; 

--Questão 05 (Função de grupo) –  Faça uma consulta SQL para exibir o id de cada gerente juntamente com o funcionário que tenha o maior salário dentro da gerência. Não exiba os dados se o id do gerente for nulo. Exiba apenas os dados em que o salário máximo for maior que 8 mil. Ordene tudo em ordem crescente de salário. (1,5 pto)

 SELECT 
 	manager_id AS 'Gerente',
 	MAX(salary) AS 'MaiorSalario'
 FROM employees
 WHERE manager_id is not null
 GROUP BY manager_id; 
 HAVING MAX(salary)>8000;

--Questão 06 (JOIN) – Faça junções nas tabelas do banco HR selecionando o nome dos empregados, sobrenome, a cidade, o país e diga a origem de cada funcionário de acordo com a sua região: Europeu, Asiático, Americano ou Africano. (1,0 pto)

 SELECT 
 	e.first_name  AS 'nome',
 	e.last_name   AS 'sobrenome',

 	l.city        AS 'cidade',

 	.ccoutry_name AS 'pais',

	CASE (r.region_id) 
		WHEN 1 THEN 'Europeu'
		WHEN 2 THEN 'Americano'
		WHEN 3 THEN 'Asiatico'
		WHEN 4 THEN 'Africano'
		END
		AS 'origem'
 FROM employees e
 JOIN department d ON (e.deparment_id=d.department_id)
 JOIN locations  l ON (d.locations_id=l.locations_id)
 JOIN countries  c ON (l.country_id=c.country_id)
 JOIN regions    r ON (c.region_id=r.region_id);
 
 
