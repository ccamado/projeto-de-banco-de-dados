-- Prática: SELECT, filtro, ordenação, agregação e relacionamento.
-- 1. Lista geral
SELECT id,titulo,ativo FROM cepef_pratica.avisos ORDER BY id;
-- 2. Apenas ativos
SELECT id,titulo FROM cepef_pratica.avisos WHERE ativo = TRUE ORDER BY titulo;
-- 3. Relacionamentos: duas chaves estrangeiras
SELECT a.id,a.titulo,c.nome AS categoria,t.nome AS turma
FROM cepef_pratica.avisos a
JOIN cepef_pratica.categorias c ON c.id=a.categoria_id
JOIN cepef_pratica.turmas t ON t.id=a.turma_id
ORDER BY a.id;
-- 4. Filtrar a turma 2A
SELECT a.titulo,c.nome AS categoria
FROM cepef_pratica.avisos a
JOIN cepef_pratica.categorias c ON c.id=a.categoria_id
JOIN cepef_pratica.turmas t ON t.id=a.turma_id
WHERE t.nome='2A' AND a.ativo
ORDER BY a.titulo;
-- 5. Quantidade por categoria (inclusive categorias com zero)
SELECT c.nome,COUNT(a.id) AS total
FROM cepef_pratica.categorias c
LEFT JOIN cepef_pratica.avisos a ON a.categoria_id=c.id
GROUP BY c.id,c.nome ORDER BY c.nome;
