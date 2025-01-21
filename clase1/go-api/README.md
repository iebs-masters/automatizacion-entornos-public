# Comandos realizados en la clase "Creación de Nuestra Primera Propia Imagen"

```bash
docker build -t mi-api-go .

docker run -p 8080:8080 --name mi-api-go mi-api-go

docker ps -a

docker rm X # Siendo X el identificador del contenedor de docker

docker images

docker rmi Y # Siendo Y el identificador de la imagen de docker
```