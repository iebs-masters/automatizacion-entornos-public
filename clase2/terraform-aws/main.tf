# Configuración del proveedor AWS
provider "aws" {
  region = "eu-west-3" # París
}

# Recurso: grupo de seguridad
resource "aws_security_group" "my_security_group" {
  name        = "Everything Opened v2"
  description = "Security group with all ports open for all IPs"

  # Regla de entrada para todos los puertos y protocolos desde todas las IPs
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Recurso: instancia EC2
resource "aws_instance" "my_instance" {
  ami           = "ami-00c71bd4d220aa22a" # ID de la imagen de Ubuntu Server 22
  instance_type = "t2.small" # Tipo de instancia (puedes cambiarlo según tus necesidades)

  key_name = "iebs_user"

  # Asigna el grupo de seguridad a la instancia
  security_groups = [aws_security_group.my_security_group.name]
}

resource "aws_instance" "my_instance2" {
  ami           = "ami-00c71bd4d220aa22a" # ID de la imagen de Ubuntu Server 22
  instance_type = "t2.small" # Tipo de instancia (puedes cambiarlo según tus necesidades)

  key_name = "iebs_user"

  # Asigna el grupo de seguridad a la instancia
  security_groups = [aws_security_group.my_security_group.name]
}
