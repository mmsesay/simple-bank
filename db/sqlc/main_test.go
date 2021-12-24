package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dataSourceName = "postgresql://root:maejor123@localhost:5432/simple_bank?sslmode=disable"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dataSourceName)
	if err != nil {
		log.Fatal("unable to connect to db: ", err)
	}

	testQueries =  New(conn)

	os.Exit(m.Run())
}
