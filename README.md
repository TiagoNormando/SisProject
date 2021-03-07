# SisProject

SisProject - Sistema de Controle de Projetos - Lorem Ipsum Inc. (Aplicação teste desenvolvida em Delphi com back-end usando MYSQL)


Saudações, 
Escolhi desenvolver uma aplicação back end com delphi e o Banco de dados MySQL,
apesar dessa escolha, todo os fundamentos que adotei nesse projeto, podem ser ultilizados em outras linguanges, pois são bem semelhantes.
Para a validações das regras e calculos, foi utlizado MVC para demostrar seu uso com Delphi.
Foi criando outras opções no menu, apenas para demostrar como ficaria, evento não está implementado.


Ferramentas:

Delphi Community 
Versão gratuída da Embarcadero, que pode ser baixado em: https://www.embarcadero.com/br/products/delphi/starter/free-download 
e utilizar o Serial recebido por e-mail (Caso queria verificar os fontes).


Banco de dados MySQL.
Servidor Xampp  - Para trabalhar com o servidor Localmente (pode ser utilizados outros, como Vertrigo),
que pode ser baixado em : https://www.apachefriends.org/pt_br/download.html
depois de instalado startar os servicos do Apache e MySQL no Painel, caso não habilite pode ser que exista outro serviço usando as portas.


Acessando e criando banco de dados:
Depois do servidor local habilitado, digitar no navegador : http://localhost/phpmyadmin/.
Precisa criar o banco dbsisproject de preferencia dom o collation utf8_general_ci.
Disponibilizei uma pasta SQL contento dois aquivos com scripts das tabelas do banco(um scripts com dados e outros sem..basta esolher..),
depois de criar o banco, basta apenas exportar, como mostra na imagem que está na pasta.

Caso seja o projeto aberto no Delphi e de erro pedido o Drive do MySql na pasta de Documentos,
basta vincular ao componente "Driver", no DataModule, como mostra na imagem que esta junto com a dll na pasta Lib.







