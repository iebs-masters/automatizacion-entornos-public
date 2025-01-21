# Comandos para la clase "Automatización de Entornos para VMs, Ansible"

Creamos la infraestructura de terraform
```bash
# Debeis estar en la carpeta terraform-aws dentro de la carpeta clase2
cd terraform-aws

terraform init
terraform apply --auto-approve
```

Nos conectamos a la máquina con ansible con los ficheros de la carpeta ansible:
```bash
# Debeis estar en la carpeta de ansible dentro de la carpeta clase2
cd ansible

# Cambiar el fichero iebs_user.pem y la IP_PUBLICA por los vuestros
scp -i iebs_user.pem ./apache.yml ./inventory.yml ./iebs_user.pem ubuntu@<IP_PUBLICA>:/home/ubuntu

ssh -i "iebs_user.pem" ubuntu@<IP_PUBLICA>
```

Dentro de la máquina ahora hacemos:
```bash
sudo apt update
sudo apt upgrade

sudo apt install ansible

ansible --version

chmod 600 iebs_user.pem
ansible-playbook -i inventory.yml apache.yml
```

Comprobamos que todo funcionó mirando la máquina a la que no nos hemos conectado.
Salimos luego de la máquina a la que nos hemos conectado con ssh:
```bash
exit
```

Destruimos la infraestructura de terraform:
```bash
# Debeis estar en la carpeta terraform-aws dentro de la carpeta clase2
cd terraform-aws

terraform destroy --auto-approve
```