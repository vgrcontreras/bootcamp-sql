-- 1. Cria um relatório para todos os pedidos de 1996 e seus clientes (152 linhas)

SELECT * FROM orders
WHERE order_date BETWEEN '01-01-1996' AND '31-12-1996'

-- 2. Cria um relatório que mostra o número de funcionários e clientes de cada cidade que tem funcionários (5 linhas)

SELECT
	e.city,
	COUNT(DISTINCT e.first_name) AS quantidade_funcionarios,
	COUNT(DISTINCT c.contact_name) AS quantidade_clientes
FROM employees e
LEFT JOIN customers c
ON e.city = c.city
GROUP BY e.city

-- 3. Cria um relatório que mostra o número de funcionários e clientes de cada cidade que tem clientes (69 linhas)

SELECT 
	c.city,
	COUNT(DISTINCT e.first_name) AS quantidade_funcionarios,
	COUNT(DISTINCT c.contact_name) AS quantidade_clientes
FROM employees e
RIGHT JOIN customers c
ON e.city = c.city
GROUP BY c.city

-- 4.Cria um relatório que mostra o número de funcionários e clientes de cada cidade (71 linhas)

SELECT 
	e.city,
	COUNT(DISTINCT e.first_name) AS quantidade_funcionarios,
	c.city,
	COUNT(DISTINCT c.contact_name) AS quantidade_clientes
FROM employees e
FULL JOIN customers c
ON e.city = c.city
GROUP BY e.city, c.city

-- 5. Cria um relatório que mostra a quantidade total de produtos encomendados.
-- Mostra apenas registros para produtos para os quais a quantidade encomendada é menor que 200 (5 linhas)

SELECT 
	product_id,
	SUM(quantity) AS total_quantidade
FROM order_details
GROUP BY product_id
HAVING SUM(quantity) < 200
ORDER BY product_id

-- 6. Cria um relatório que mostra o total de pedidos por cliente desde 31 de dezembro de 1996.
-- O relatório deve retornar apenas linhas para as quais o total de pedidos é maior que 15 (5 linhas)

SELECT
	customer_id,
	COUNT(order_id) AS total_pedidos
FROM orders
WHERE order_date >= '31-12-1996'
GROUP BY customer_id
HAVING COUNT(order_id) > 15