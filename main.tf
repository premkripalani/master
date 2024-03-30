terraform {
    required_providers {
        snowflake = {
            source  = "chanzuckerberg/snowflake"
            version = "0.25.0"
        }
    }
}

provider "snowflake" {
    account   = "<snowflake_account>"
    username  = "<snowflake_username>"
    password  = "<snowflake_password>"
    warehouse = "<snowflake_warehouse>"
    database  = "<snowflake_database>"
    schema    = "<snowflake_schema>"
}

resource "snowflake_database" "example_database" {
    name = "example_db"
}

resource "snowflake_schema" "example_schema" {
    name     = "example_schema"
    database = snowflake_database.example_database.name
}

resource "snowflake_table" "example_table" {
    name     = "example_table"
    schema   = snowflake_schema.example_schema.name
    database = snowflake_database.example_database.name

    column {
        name     = "id"
        type     = "NUMBER"
        nullable = false
    }

    column {
        name     = "name"
        type     = "VARCHAR"
        nullable = true
    }
}