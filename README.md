# Terraform 

Tool per IAC -> codice sorgente -> Engine -> Infrastruttura

Tool per infrastruttura AWS
- Cloudformation
- Terraform
- AWS CDK
- Pulumi

Terraform
- enterprise a pagamento
- free 
- https://opentofu.org fork della versione free, quasi uguale a terraform free

Più info: https://www.linkedin.com/pulse/free-terraform-course-aws-giuseppe-borgese/

Posso passare le info tra un cloud e un altro

# terraform plan
senza argomenti mi dice cosa andrà a fare terraform

# terraform apply
Fa di nuovo il plan con altre azioni

# best practises: 
- salviamo l'output in un file temporaneo
- terraform plan -out /tmp/tf.out ( in realtà ci vorrebbe ./tmp ecc.. altrimenti salva su tmp del mac) 
- terraform apply "/tmp/tf.out"
- ogni modifica lancio plan e apply


# terraform.tfstate
Registra le associazioni dei dati su AWS. Mai cambiare il JSON manualmente, sennò si spacca tutto

# terraform state list
Elenca le risorse 

# terraform show [nome_della_risorsa]
Mostra più info della risorsa indicata

# Tre tipi di oggetti
- provider (aws, azure ecc.)
- resource (security group, virtual machines ecc..) [write]
- data (query su AWS per estrarre dati) [read]
- module (organizzare il codice per riutilizzarlo)

# Variables
Variabili, o tutte in un file var.tf o un file per variabile
To access variable i use alwaws [var.namevariable]

# Locals
Per le costanti

# Provisioner
Lanciare uno script con terraform

# terraform state rm
Voglio togliere il security group da Terraform, non da AWS..perchè voglio lavorarlo manualmente senza codice [terraform state rm aws_security_group.localtest]

# terraform import 
Ho creato un EFS da console, la aggiungo su terraform dopo aver scritto il suo codice (efs.tf) con [terraform import aws_efs_file_system.test fs-00bdd6687a6010942]

# TIPS:
- se tolgo il codice, ma non faccio rm dallo state, lui ricrea la risorsa
- se tolgo il codice, faccio rm dallo state, lui elimina la risorsa

# Modules
Per raggruppare e riutilizzare il codice.
Quando aggiungo un modulo devo lanciare di nuovo [terraform init]

# Functions
# terraform console
Per vedere le funzioni

# Count & Dynamic blocks
Per dinamicizzare -> vedi file sg.tf

# Target option
terraform plan -out ./tmp/tf.out -target [option] (terraform plan -out /tmp/tf.out -target aws_security_group.my-sg)

# terraform destroy
Contrario di apply, rimuove tutto

