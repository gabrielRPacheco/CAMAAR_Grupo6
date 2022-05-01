Funcionalidade: Cadastrar usuarios do SIGAA no sistema CAMAAR

Contexto:
Dado que eu esteja na página de registro

Cenário: Registrar com campos válidos estando o email presente no banco de dados "members"(happy path)
Quando eu escrever "biancaglyciaboueri@gmail.com" no campo "E-mail"
E eu escrever "senha123" no campo "Senha"
E eu clicar em "registrar"
Então eu devo ver uma notificação de "Cadastro realizado com sucesso."

Cenário:  Registrar com campos válidos não estando o email presente no banco de dados "members"(sad path)
Quando eu escrever "meuemail@mail.com" no campo "E-mail"
E eu escrever "batatinha123" no campo "senha"
E eu clicar em "registrar"
Então eu devo ver uma notificação de "Falha ao realizar o cadastro."

Cenário:  Registrar com campos válidos tendo ja um email cadastrado no banco de dados "users"(sad path)
Quando eu escrever "biancaglyciaboueri@gmail.com" no campo "E-mail"
E eu escrever "senha123" no campo "Senha"
E eu clicar em "registrar"
Então eu devo ver uma notificação de "Falha ao realizar o cadastro."
