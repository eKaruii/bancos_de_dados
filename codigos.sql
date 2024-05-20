-- 1. Exibir todas as informações da tabela `PRODUTOS`.
SELECT * FROM PRODUTOS

-- 2. Mostrar os nomes e preços dos produtos que custam mais de 50,00.
SELECT NOME_PRO, PRECO_PROD
FROM PRODUTOS
where PRECO > 50;

-- 3. Listar os nomes e cidades dos fornecedores.
SELECT NOME_FOR,CIDADE
FROM FORNECEDORES;

-- 4. Exibir os detalhes dos pedidos de compra: ID do pedido, data, hora e nome do fornecedor.
SELECT ID_PEDIDO, DATA_PEDIDO, HORA_PEDIDO, FORNECEDOR
FROM PEDIDOS_COMPRA;

-- 5. Listar o nome dos produtos e a quantidade disponível em cada armazém.
SELECT NOME_PRO, ARMAZEM, QUANTIDADE
FROM PRODUTOS_ARMAZENS
JOIN  PRODUTOS ON NOME_PRO;

-- 6. Mostrar os nomes dos fornecedores que têm produtos no armazém de "São Paulo".
SELECT NOME_FOR
FROM FORNECEDORES
JOIN ARMAZENS ON CIDADE_ARMAZEM
WHERE CIDADE_ARMAZEM = 'São Paulo';

-- 7. Listar todos os armazéns, ordenados pelo nome do armazém de A a Z.
SELECT NOME_ARMAZEM
FROM ARMAZENS
ORDER BY NOME_ARMAZEM;

-- 8. Mostrar os nomes dos produtos que têm a palavra "Premium" na descrição.
select NOME_PRO
FROM PRODUTOS
WHERE DESCRICAO LIKE '%Premium%';

-- 9. Exibir os detalhes dos produtos: ID do produto, nome, descrição, preço e nome dos fornecedores.
select ID_PRODUTO, NOME_PRO, DESCRICAO, PRECO, NOME_FOR
FROM PRODUTOS
JOIN FORNECEDORES ON NOME_FOR;

-- 10. Para cada pedido de compra, mostrar o ID do pedido e a quantidade total de produtos solicitados.


-- 11. Contar quantos produtos cada fornecedor oferece.
SELECT NOME_FOR, QUANTIDADE
FROM FORNECEDORES
JOIN PRODUTOS_ARMAZENS ON QUANTIDADE;

-- 