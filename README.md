# dataOps-assessment
Este projeto tem o objetivo de entender a base de dados do cliente, para melhor atender as demandas de relatórios, e apresentar as melhores soluções ao negócio.

Realizamos o assessment do banco de dados sample da Microsoft, o AdventureWorks2014. Este processo é importante, pois nos deu o embasamento mínimo para construirmos os Pipelines, uma vez que entendemos aspectos importantes da modelagem, como: 

<ul>
  <li>O Negócio;</li>
  <li>Quais informações estão presentes;</li>
  <li>Como foi feita a normalização;</li>
  <li>Como as informações foram distribuídas, e como se relacionam;</li>
</ul>

Todos os scripts gerados durante o assessment, foram disponibilizados no diretório:
https://github.com/conam-fiap/dataOps-assessment/tree/master/Assessment

Recebemos diversas solicitações para gerar relatórios, e para construção dos pipelines, utilizamos o Talend. A ferramenta possui uma vasta gama de componentes e funcionalidades, que facilitam a construção dos fluxos. 

O projeto em si, foi disponibilizado no diretório:
https://github.com/conam-fiap/dataOps-assessment/tree/master/ProjetoTalend/CONANFIAP

Algumas boas práticas adotadas:

<ul>
  <li>Em todos os Jobs, tivemos a preocupação de utilizar um componente, que abre a conexão com o banco de dados no início do processamento, e que ao término da execução, a mesma se encerre. Isso garante que sessões não fiquem remanescentes no banco de dados.</li>
  <li>Antes de iniciar, criamos os diretórios necessários para a geração dos arquivos;</li>
  <li>Procuramos utilizar tFilterColumns, para garantir um fluxo mais limpo, com apenas a colunas de interesse;</li>
</ul>
