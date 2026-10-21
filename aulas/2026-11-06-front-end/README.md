# CEPEF — Front-end com Supabase (2º A)

Aula planejada para 06/11/2026 (data sujeita à confirmação da escola, com prazo administrativo de entrega de provas). Material produzido, **não ministrado**.

## Passo a passo do estudante
1. Use **seu próprio projeto Supabase**. Execute os scripts SQL de 23/10 na ordem 01 e 02.
2. Execute o script **06_habilitar_api_rls.sql** no SQL Editor do seu projeto. No Dashboard, em API settings / Exposed schemas, adicione `cepef_pratica` (não substitua os outros esquemas). Consulte a documentação do Supabase caso o menu mude.
3. Confira que em `cepef_pratica` há tabelas `categorias`, `turmas`, `avisos`. Os registros fictícios anteriores têm `aluno_id IS NULL` e **não aparecem na aplicação**; isso é esperado.
4. Abra o projeto de front-end pelo link da página da aula e faça uma cópia no StackBlitz. Instale dependências automaticamente e execute `npm run dev`, caso solicitado.
5. Informe apenas **Project URL** e **publishable/anon key** do seu próprio projeto — nunca a secret/service_role. São dados públicos para desenvolvimento, protegidos por permissões e RLS.
6. Crie também um **usuário de autenticação da aplicação** (Supabase Auth): sua conta que abre o Dashboard não equivale a um login da aplicação. Se a verificação de e-mail estiver habilitada, confirme antes de entrar.
7. Faça login, cadastre um aviso, verifique-o no SQL Editor com `SELECT id,titulo,aluno_id FROM cepef_pratica.avisos ORDER BY id DESC LIMIT 10;`. Teste editar e excluir.
8. Entregue o link da cópia do projeto, screenshot sem senhas/chaves e respostas: (a) para que serve o `aluno_id`? (b) por que o RLS é necessário? (c) por que o banco é diferente do front-end?

## Problemas mais comuns
- **Invalid schema**: incluir `cepef_pratica` na lista de esquemas expostos.
- **Permission denied**: executar script de grants/RLS usando SQL Editor do próprio projeto.
- **Lista vazia**: criar registros logado; os registros do exercício de SQL, sem dono, não são visíveis pelo cliente.
- **Email not confirmed**: conferir o e-mail de cadastro ou orientação do professor.
- **Não compartilhe seu login**. Dados fictícios, sem informações pessoais reais na tabela de avisos.

## Organização por camadas
**UI**: `index.html` | **regras e conexão**: `main.js` | **persistência**: PostgreSQL no Supabase, sob `cepef_pratica`.

## Alternativa sem computador
Desenhe o formulário, identifique as requisições de INSERT/SELECT/UPDATE/DELETE e explique qual regra RLS impede editar o aviso de outra pessoa.
