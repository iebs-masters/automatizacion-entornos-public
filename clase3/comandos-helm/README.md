# Comandos Helm

En este fichero podréis ver los comandos que se han utilizado en el sexto vídeo de la clase 3 en el cual hicimos comandos de Helm para arrancar un servicio de MySQL.

## Comandos

Comandos Helm:
```bash
helm repo add stable https://charts.helm.sh/stable

helm install mysql oci://registry-1.docker.io/bitnamicharts/mysql --set auth.rootPassword=cotanRootPassword,auth.username=cotan,auth.password=cotanPassword,auth.createDatabase=true,auth.database=juegos
```

Ejecutamos un pod de ubuntu para comprobar la conexión con la base de datos:
```bash
kubectl run -i --tty ubuntu --image=ubuntu:20.04 --restart=Never -- bash -il
```

Comandos a ejecutar dentro del pod para instalar el cliente de mysql y comprobar la conexión con la base de datos:
```bash
apt-get update && apt-get install -y mysql-client

mysql -h mysql.default.svc.cluster.local -u cotan -p juegos
```