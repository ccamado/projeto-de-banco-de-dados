-- Executar DEPOIS do script 01. Dados exclusivamente fictícios.
INSERT INTO cepef_pratica.categorias (nome) VALUES
 ('Evento'),('Atividade'),('Comunicado')
ON CONFLICT (nome) DO NOTHING;

INSERT INTO cepef_pratica.turmas (nome) VALUES
 ('1A'),('2A'),('3A')
ON CONFLICT (nome) DO NOTHING;

-- Reiniciar apenas os avisos da prática para resultados reproduzíveis.
-- Atenção: apaga SOMENTE registros da tabela cepef_pratica.avisos do projeto do aluno.
TRUNCATE TABLE cepef_pratica.avisos RESTART IDENTITY;

INSERT INTO cepef_pratica.avisos(titulo,descricao,categoria_id,turma_id,ativo)
SELECT d.titulo,d.descricao,c.id,t.id,d.ativo
FROM (VALUES
 ('Feira de Tecnologia','Participação fictícia na feira.','Evento','2A',true),
 ('Entrega do DER','Revisar o modelo da atividade.','Atividade','2A',true),
 ('Reunião de turma','Encontro demonstrativo.','Comunicado','1A',true),
 ('Oficina SQL','Executar os scripts no SQL Editor.','Atividade','2A',true),
 ('Mostra de Projetos','Evento de exemplo.','Evento','3A',true),
 ('Troca de laboratório','Aviso de teste.','Comunicado','2A',false),
 ('Revisão de consultas','Resolver exercícios de SELECT.','Atividade','1A',true),
 ('Apresentação final','Simulação de entrega.','Evento','3A',true)
) AS d(titulo,descricao,categoria,turma,ativo)
JOIN cepef_pratica.categorias c ON c.nome=d.categoria
JOIN cepef_pratica.turmas t ON t.nome=d.turma;
