-- Demonstrar uma única vez, depois observar a nova coluna no Table Editor
ALTER TABLE central_avisos_demo.aviso ADD COLUMN IF NOT EXISTS local_evento VARCHAR(100);
-- DROP TABLE é destrutivo: NÃO EXECUTAR durante a demonstração.
-- DROP TABLE central_avisos_demo.aviso;