package main

import (
	"database/sql"
	"fmt"
	"net/http"
	"os"

	_ "github.com/lib/pq"
)

func main() {
	http.HandleFunc("/health", healthHandler)
	http.ListenAndServe(":8080", nil)
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	// Reemplaza con tus detalles de conexión PostgreSQL
	host := os.Getenv("DB_HOST")
	port := os.Getenv("DB_PORT")
	user := os.Getenv("DB_USER")
	password := os.Getenv("DB_PASSWORD")
	dbname := os.Getenv("DB_NAME")

	if host == "" { host = "localhost" }
	if port == "" { port = "5432" }
	if user == "" { user = "postgres" }
	if password == "" { password = "postgres" }
	if dbname == "" { dbname = "postgres" }

	// Construye la cadena de conexión
	connStr := fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable", user, password, host, port, dbname)

	fmt.Println("Connection string:", connStr)

	// Abre una conexión a la base de datos
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		http.Error(w, fmt.Sprintf("mal: %v", err), http.StatusInternalServerError)
		return
	}
	defer db.Close()

	// Verifica si la conexión es exitosa
	err = db.Ping()
	if err != nil {
		http.Error(w, fmt.Sprintf("mal: %v", err), http.StatusInternalServerError)
		return
	}

	fmt.Fprint(w, "bien")
}
