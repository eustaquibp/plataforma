# Introdução

Repositório contendo template dos arquivos e scripts responsáveis pela automação de testes e deploy do terraform.

# Atenção

1) Os arquivos aqui contidos são apenas templates, isto é, **deve ser alterado** de acordo com a necessidade.
2) Não fazer commit diretamente em branch que não seja DEV, alto risco de conflito e erros na automação.
3) Para um processo consistente e clareza nos versionamentos, descreva de forma objetiva os commits.
4) **NUNCA** realizar alterações diretamente pelo painel da Azure DevOps, **SEMPRE** pela linha de comando.
5) As alterações devem originar-se na branch DEV, **SEMPRE**


# Modulos do terraform.

Os modulos do terraform utilizados internamente foram individualizados, isto é, criado repositório único para cada módulo.
Cada módulo vai ser versionado por tag, iniciando em 1.0 que é a versão utilizada no antigo repositório.
Para chamar o módulo em um terraform (tf) deverá utilizar a seguinte sintaxe:

git::https://<PAT TOKEN>@<Azure DevOps URL>/DefaultCollection/<PROJECT NAME>/_git/<REPO NAME>?REF=<TAG>

## Repositórios de módulos:

1) terraform-module-aws-ec2
2) terraform-module-aws-rds
3) terraform-module-aws-vpc

### Exemplo:

```bash
git::https://nneyf2wrzavcq4bx5mymzs7vfw4pvijqe3vwzdrfhryfv6x6ftaq@alelo.visualstudio.com/DefaultCollection/Adquirencia/_git/terraform-module-aws-ec2?ref=v1.0"
```

# Deploy de nova release

## Pré-Requisitos

1) Cliente GIT instalado no seu local.

## Build and Test

O script possui quatro estágios, sendo 1 deles responsável por realizar o processo de Build e Testes.
A pipeline será ativada quando houver qualquer commit novo na branch DEV.
O estágio de build e test é descrito abaixo:

1) Clone do repositório da branch DEV 
2) Testes com "terraform (init, validate e plan), sendo interrompido imediatamente caso apresente algum erro;
3) Se caso os testes tiverem sucesso são gerados três artefatos, respectivos a cada ambiente (DEV, HML e PRD);
4) Os artefatos serão publicados no serviço de artefatos da Azure DevOps, no feed "terraform";
5) Se ocorrer erro nos testes os artefatos não serão gerados e a automação será cancelada imediatamente. 

## Deploy

1) Após o processo de build e testes será realizado o processo de deploy no ambiente de DEV;
2) Se caso obtiver sucesso no deploy de DEV é aberto uma solicitação pull request para branch HML, ficando pendente de aprovação do responsável;
3) Sendo aprovado o pull request citado acima é realizado o merge e deploy em HML;
4) Se o deploy ocorrer com sucesso em HML é aberto nova solicitação pull request para branch PRD, ficando pendente de aprovação do responsável;
4) Sendo aprovado o pull request para PRD será realizado o merge e deploy em PRD.

## Modo de uso

```bash
git clone https://alelo.visualstudio.com/Adquirencia/_git/<repositorio>
cd terraform-sg
git checkout dev
<alter files>
git add -A (Adiciona todos os arquivos alterados)
git commit -m "descrever a nova funcionalidade ou alteração"
git push origin dev
```

------------------------------------------------------------------------------------------------------------------

# Criar nova automação do terraform

## Pré-Requisitos de ambiente

1) Usuário com permissão para alterar o ambiente Azure Pipeline e Repositórios. 

## Pré-Requisitos de configuração/parametros

1) Alterar repositoryid no powershell (pull request) (Dois campos para )
2) Alterar o feedpackage de acordo com a necessidade.
3) PAT (Já está incluido no template)
4) Branch DEV, HML e PRD (Se caso possuir outros ambientes o arquivo azure-pipelines.yml deverá ser adequado)
5) Alterar o tfstate

## Variáveis de ambiente

* AWS_ACCESS_KEY_ID
* AWS_DEFAULT_REGION
* AWS_SECRET_ACCESS_KEY

## Arquivos necessários para a automação funcionar corretamente

         azure-pipelines.yml
        .artifactignore
        .gitignore

## Criação do repositório

O novo repositório deverá ser um fork (All branches) de um template pré-definido identificado como "terraform-automation-template"
O template já contempla os arquivos necessários para a automação.
Os arquivos terraform devem ser espelhados em todas as branchs.


## Criação do repositório


Esse projeto foi construido com base nas solicitações da Alelo com foco no repositório do terraform-sg, sendo assim, "ainda" não recomendado para utilizar em todos os repositórios sem testes unitários e de ambiente, com aprovação do gerente e do desenvolvedor.

## Setup build repositório

Após a criação do repositório deverá configurar a pipeline para o respectivo repositório, sendo assim, clique no botão "Set Up Build" no canto superior direito do painel principal do repositório.


## Autor
[Equipe Infraestrutura - Projeto Adquirencia](ti.infra.adquirencia@alelo.com.br)


# Contribute

- [Azure Devops Pipelines](https://docs.microsoft.com/pt-br/azure/devops/pipelines)
- [Azure DevOps REST API](https://docs.microsoft.com/en-us/rest/api/azure/devops/?view=azure-devops-rest-5.1)
- [Azure DevOps Sintax PowerShell](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/utility/powershell?view=azure-devops)
