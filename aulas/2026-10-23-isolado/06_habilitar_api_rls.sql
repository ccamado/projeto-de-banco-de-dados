-- CEPEF • AULA FUTURA — configurar acesso seguro ao esquema cepef_pratica
-- Executar no SQL Editor do projeto INDIVIDUAL, depois dos scripts de 23/10.
-- O usuário do Supabase Dashboard não é automaticamente um usuário de Supabase Auth.
-- A aplicação terá cadastro/login separados, com email e senha.

ALTER TABLE cepef_pratica.avisos
 ADD COLUMN IF NOT EXISTS aluno_id UUID REFERENCES auth.users(id);

-- RLS garante que cada usuário da aplicação só vê/modifica os próprios avisos.
ALTER TABLE cepef_pratica.avisos ENABLE ROW LEVEL SECURITY;
ALTER TABLE cepef_pratica.categorias ENABLE ROW LEVEL SECURITY;
ALTER TABLE cepef_pratica.turmas ENABLE ROW LEVEL SECURITY;

GRANT USAGE ON SCHEMA cepef_pratica TO authenticated;
GRANT SELECT ON cepef_pratica.categorias, cepef_pratica.turmas TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON cepef_pratica.avisos TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA cepef_pratica TO authenticated;

-- Não conceder acesso anônimo a tabelas.
REVOKE ALL ON cepef_pratica.categorias, cepef_pratica.turmas, cepef_pratica.avisos FROM anon;
REVOKE USAGE ON SCHEMA cepef_pratica FROM anon;

DROP POLICY IF EXISTS "categorias_leitura_autenticada" ON cepef_pratica.categorias;
CREATE POLICY "categorias_leitura_autenticada" ON cepef_pratica.categorias
 FOR SELECT TO authenticated USING (true);
DROP POLICY IF EXISTS "turmas_leitura_autenticada" ON cepef_pratica.turmas;
CREATE POLICY "turmas_leitura_autenticada" ON cepef_pratica.turmas
 FOR SELECT TO authenticated USING (true);

DROP POLICY IF EXISTS "avisos_ler_proprios" ON cepef_pratica.avisos;
CREATE POLICY "avisos_ler_proprios" ON cepef_pratica.avisos
 FOR SELECT TO authenticated USING (aluno_id = (select auth.uid()));
DROP POLICY IF EXISTS "avisos_criar_proprios" ON cepef_pratica.avisos;
CREATE POLICY "avisos_criar_proprios" ON cepef_pratica.avisos
 FOR INSERT TO authenticated WITH CHECK (aluno_id = (select auth.uid()));
DROP POLICY IF EXISTS "avisos_editar_proprios" ON cepef_pratica.avisos;
CREATE POLICY "avisos_editar_proprios" ON cepef_pratica.avisos
 FOR UPDATE TO authenticated USING (aluno_id = (select auth.uid()))
 WITH CHECK (aluno_id = (select auth.uid()));
DROP POLICY IF EXISTS "avisos_excluir_proprios" ON cepef_pratica.avisos;
CREATE POLICY "avisos_excluir_proprios" ON cepef_pratica.avisos
 FOR DELETE TO authenticated USING (aluno_id = (select auth.uid()));

-- NOTA: registros fictícios inseridos anteriormente (aluno_id NULL)
-- continuarão disponíveis via SQL Editor, mas invisíveis para contas da aplicação.
-- Não use service_role no front-end nem desative RLS.
-- MANUAL: Settings > API > Exposed schemas > incluir cepef_pratica.
