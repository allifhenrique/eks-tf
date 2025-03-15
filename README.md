## 1. Iniciar a configuração do aws cli

1.1 Instalando aws-cli no ubuntu WSL, conforme doc: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
``` bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

1.2 Verificando Versão do aws cli, utilizado a versão: aws-cli/2.17.8
``` bash
aws --version
```

1.3 Fazendo configuração do novo Profile
``` bash
aws configure --profile "giovane-devops"
```

1.4 Visualizando Credenciais configuradas
``` bash
cat ~/.aws/credentials
```

1.5 Listando as Configurações
``` bash
aws configure list
```

## 2. Iniciar a configuração do terraform

2.1 Instalando o terraform no ubuntu WSL, conforme doc: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
``` bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

2.2 Verifica a versão do terraform
``` bash
gvenunes@gvenunes:~/terraform-fiap$ terraform -version
Terraform v1.11.2
on linux_amd64
+ provider registry.terraform.io/hashicorp/aws v5.90.1
+ provider registry.terraform.io/hashicorp/tls v4.0.6
```

2.3 Iniciando a configuração do terraform
 - Esse comando `terraform init` inicializa o diretório do Terraform, baixa todos os plug-ins ou módulos necessários mencionados em sua configuração e prepara o ambiente para trabalhar com o Terraform.
``` bash
terraform init
```

2.4 Planejando as alterações
 - O `terraform plan` serve para visualização das mudanças que o Terraform fará em sua infraestrutura. 
Ele compara o estado atual da infraestrutura com o estado desejado definido nos arquivos de configuração do Terraform e mostra as ações específicas que o Terraform tomará para preencher a lacuna.
``` bash
terraform plan
```

2.5 Salve a saída do plan
 - Se quiser salvar o plano para referência futura ou compartilhá-lo com os membros da equipe, você pode usar o sinalizador -out com o comando plan.
Por exemplo, o seguinte comando salva o plano em um arquivo chamado plan.tfplan.
``` bash
terraform plan -out=plan.tfplan
```

2.6 Aplicando as alterações
 - Executa a “criação” dos recursos (instâncias/objetos) no provider indicado nos arquivos TF;
``` bash
terraform apply -auto-approve
```

2.7 Destruindo o ambiente
 - Executa a “remoção” dos recursos (instâncias/objetos) no provider indicado nos arquivos TF.
 - (Seria interesante usar o 'terraform plan -destroy' antes.)
``` bash
terraform destroy
```

## Anotações: 💻

Sobre o arquivo terraform.tfstate

 - Este é o arquivo de estado de modificações, onde sempre está sincronizado com as modificações aplicadas.
 - Muito importante para se utilizar com muitas pessoas, pois quando alguém precisa adicionar/atualizar ou remover algo,
 - antes de qualquer operação, o Terraform faz uma atualização para atualizar o estado com a infraestrutura real.

 - Pode ser definido no arquivo root (0-provider.tf)
 - Existe a possibilidade de salvar o arquivo de estado ".tfstate" direto no S3

#### Exemplo de como salvar o tfstate em um bucket no S3
```
terraform {
  backend "s3" {
    bucket = "iac-urbanfood-tfstates"   # Qual bucket
    key    = "terraform.tfstate"        # Qual arquivo
    region = "us-east-1"                # Qual região
  }
}
```
