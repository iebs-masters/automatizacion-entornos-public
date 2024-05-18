from flask import Flask, render_template
from flask_mysqldb import MySQL

import os
import socket

app = Flask(__name__)

# Configuración de la base de datos
app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST')
app.config['MYSQL_USER'] = os.getenv('MYSQL_USER', 'root')
app.config['MYSQL_PASSWORD'] = os.getenv('MYSQL_PASSWORD')
app.config['MYSQL_DB'] = os.getenv('MYSQL_DB')

mysql = MySQL(app)


def get_machine_ip():
    try:
        hostname = socket.gethostname()
        ip_address = socket.gethostbyname(hostname)
        return ip_address
    except Exception as e:
        return str(e)

@app.route('/')
def index():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM juegos")
    juegos = cur.fetchall()
    cur.close()
    machine_ip = get_machine_ip()

    return render_template('index.html', juegos=juegos, machine_ip=machine_ip)


@app.route('/health-check')
def health_check():
    return 'OK'


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
