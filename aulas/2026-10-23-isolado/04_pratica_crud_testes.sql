-- Operações com transação: demonstração sem mudar permanentemente o conjunto inicial.
BEGIN;
-- INSERT com chave estrangeira obtida pelo nome
INSERT INTO cepef_pratica.avisos(titulo,descricao,categoria_id,turma_id)
SELECT 'Aviso experimental','Cadastro feito na aula',c.id,t.id
FROM cepef_pratica.categorias c CROSS JOIN cepef_pratica.turmas t
WHERE c.nome='Atividade' AND t.nome='2A';
SELECT id,titulo,ativo FROM cepef_pratica.avisos WHERE titulo='Aviso experimental';
-- UPDATE
UPDATE cepef_pratica.avisos SET ativo=FALSE WHERE titulo='Aviso experimental';
SELECT id,titulo,ativo FROM cepef_pratica.avisos WHERE titulo='Aviso experimental';
-- DELETE apenas o registro experimental
DELETE FROM cepef_pratica.avisos WHERE titulo='Aviso experimental';
-- Reverter a transação para preservar o banco da turma.
ROLLBACK;
-- DESAFIO: explique quando preferir UPDATE (desativar) a DELETE (excluir).
