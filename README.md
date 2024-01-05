# TP Terraform AWS Entibourt Mounir.

1. Dans un premier va falloir installer terraform sur votre machine (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. Ensuite créer un fichier provider.tf qui va etre notre "fournisseur" nos clés d'accès etc
3. Créés le fichier main.tf dans lequel on va declarer nos configuration pour créer notre instace avec un groupe security et un vpc
## Commandes Terraform
- Initialiser terraform
```bash
terraform init
```
- Deployer la configuration sur AWS, il faut executer:
```bash
terraform apply
```
- Pour nettoyer toute l'infra créée via terraform, on execute:
```bash
terraform destroy
```
## Problèmes recontrés

Lorsque je faisais un terraform init j'avais l'erreur suivante :
```bash
Initializing the backend...
╷
│ Error: No valid credential sources found
│
│ Please see https://www.terraform.io/docs/language/settings/backends/s3.html
│ for more information about providing credentials.
│
│ Error: failed to refresh cached credentials, no EC2 IMDS role found, operation error ec2imds: GetMetadata, exceeded maximum number of attempts, 3, request send    
│ failed,
```
J'ai resolu l'erreur en installant l'AWS CLI, ensuite faut lancer: 
```bash
aws configure
```
Rentrer les informations demandés

J'ai recontrés une autre erreur lors du terraform apply :
```bash
aws_instance.app_server: Creating...
╷
│ Error: creating EC2 Instance: InvalidParameter: Security group sg-00ee7d6ae30a37512 and subnet subnet-09b1ca5658af3da53 belong to different networks.
│       status code: 400, request id: fc7b049f-ad41-4cd7-9c84-8c7fcd3ce88c
│
│   with aws_instance.app_server,
│   on main.tf line 1, in resource "aws_instance" "app_server":
│    1: resource "aws_instance" "app_server" {
│
```
J'ai dû rajouter la resource aws_subnet et ajouter l'id dans la resource de l'instance. Pour que l'instance soit dans le même sous-reseau que le groupe security.
