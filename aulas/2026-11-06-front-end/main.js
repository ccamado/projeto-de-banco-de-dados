import { createClient } from '@supabase/supabase-js';
// Cada estudante informa somente a URL e a chave pública do SEU projeto.
// Os valores ficam só na memória desta página; não são gravados no GitHub.
let db = null;
let user = null;
const $ = id => document.getElementById(id);
const status = message => { $('status').textContent = message; };
const safe = value => String(value ?? '');
function requireDB() { if (!db) throw new Error('Conecte primeiro seu Supabase.'); }
function requireUser() { if (!user) throw new Error('Faça login antes de modificar avisos.'); }
async function check(result) { if (result.error) throw result.error; return result.data; }
function options(el,rows) {
  el.replaceChildren();
  for(const row of rows) {
    const opt = document.createElement('option'); opt.value = row.id; opt.textContent = row.nome;
    el.append(opt);
  }
}
async function loadReference() {
  requireDB(); requireUser();
  const cats = await check(await db.from('categorias').select('id,nome').order('nome'));
  const turmas = await check(await db.from('turmas').select('id,nome').order('nome'));
  options($('categoria'),cats); options($('turma'),turmas);
}
async function list() {
  requireDB(); requireUser();
  const records = await check(await db.from('avisos').select('id,titulo,descricao,ativo').order('id',{ascending:false}));
  $('avisos').replaceChildren();
  for(const a of records) {
    const li = document.createElement('li');
    const title = document.createElement('strong'); title.textContent = a.titulo;
    const detail = document.createElement('span'); detail.textContent = ' — '+safe(a.descricao)+(a.ativo?'':' (inativo)');
    const edit = document.createElement('button'); edit.textContent='Editar';
    edit.onclick=async()=>{ const novo=prompt('Novo título (mínimo 3 caracteres)',a.titulo); if(novo===null)return;
      if(novo.trim().length<3){status('Título curto demais.');return;}
      try { await check(await db.from('avisos').update({titulo:novo.trim()}).eq('id',a.id)); await list();status('Aviso editado.'); }
      catch(e){status('Erro ao editar: '+e.message);}
    };
    const remove=document.createElement('button');remove.textContent='Excluir';remove.className='secondary';
    remove.onclick=async()=>{if(!confirm('Excluir apenas este aviso?'))return;
      try { await check(await db.from('avisos').delete().eq('id',a.id));await list();status('Aviso excluído.'); }
      catch(e){status('Erro ao excluir: '+e.message);}
    };
    li.append(title,detail,document.createTextNode(' '),edit,document.createTextNode(' '),remove);
    $('avisos').append(li);
  }
}
$('config').onsubmit=async e=>{
 e.preventDefault();
 try {
  const url=$('url').value.trim(), key=$('key').value.trim();
  if(!/^https:\/\/[a-zA-Z0-9-]+\.supabase\.co$/.test(url)) throw new Error('URL inválida de projeto Supabase.');
  if(!(key.startsWith('sb_publishable_')||key.startsWith('eyJ'))) throw new Error('Use somente publishable ou anon key.');
  db=createClient(url,key,{db:{schema:'cepef_pratica'}});
  const result=await db.auth.getUser();user=result.data.user;
  status('Conexão inicial configurada. Faça login.');if(user){await loadReference();await list();}
 }catch(e){status('Erro de configuração: '+e.message);}
};
$('signup').onclick=async()=>{
 try{requireDB();const r=await db.auth.signUp({email:$('email').value.trim(),password:$('password').value});
 await check(r);status('Cadastro solicitado. Confira o e-mail se a confirmação estiver habilitada.');}
 catch(e){status('Erro no cadastro: '+e.message);}
};
$('auth').onsubmit=async e=>{
 e.preventDefault();
 try{requireDB();const r=await db.auth.signInWithPassword({email:$('email').value.trim(),password:$('password').value});
 await check(r);user=r.data.user;await loadReference();await list();status('Login realizado.');$('password').value='';}
 catch(e){status('Erro ao entrar: '+e.message);}
};
$('logout').onclick=async()=>{try{requireDB();await check(await db.auth.signOut());user=null;$('avisos').replaceChildren();status('Saiu da conta.');}catch(e){status(e.message);}};
$('form').onsubmit=async e=>{
 e.preventDefault();
 try{requireDB();requireUser();
 const entry={titulo:$('titulo').value.trim(),descricao:$('descricao').value.trim(),
  categoria_id:Number($('categoria').value),turma_id:Number($('turma').value),aluno_id:user.id};
 await check(await db.from('avisos').insert(entry));
 $('titulo').value='';$('descricao').value='';await list();status('Aviso persistido no Supabase!');}
 catch(e){status('Erro ao cadastrar: '+e.message);}
};
