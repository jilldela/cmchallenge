#!/usr/bin/env sh

dropdb -U postgres cmdb
createdb -U postgres cmdb
psql -U postgres cmdb < data/create_tables.sql