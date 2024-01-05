# TP Terraform AWS Entibourt Mounir.

Dans un premier va falloir installer terraform sur votre machine (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
Ensuite créer un fichier provider.tf qui va etre notre "fournisseur" nos clés d'accès etc
Créés le fichier main.tf dans lequel on va declarer nos configuration pour créer notre instace avec un groupe security et un vpc

## Problèmes recontrés

Lorsque je faisais un terraform init j'avais l'erreur suivante :
''Initializing the backend...
╷
│ Error: No valid credential sources found
│
│ Please see https://www.terraform.io/docs/language/settings/backends/s3.html
│ for more information about providing credentials.
│
│ Error: failed to refresh cached credentials, no EC2 IMDS role found, operation error ec2imds: GetMetadata, exceeded maximum number of attempts, 3, request send    
│ failed,''
