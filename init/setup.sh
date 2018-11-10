#!/bin/bash
psql -U username -d database << "EOSQL"
CREATE TABLE people (
    id              serial PRIMARY KEY,
    firstname       varchar(40) NOT NULL,
    lastname        varchar(40) NOT NULL
);

CREATE TABLE emails (
    id          serial PRIMARY KEY,
    email       varchar(256) NOT NULL,
    person      integer REFERENCES people (id),
    "primary"   boolean DEFAULT false
);
EOSQL

psql -U username -d database << "EOSQL"
INSERT INTO people (id, firstname, lastname) VALUES
    (1, 'aaa', 'bbb'),
    (2, 'ccc', 'ddd'),
    (3, 'eee', 'fff');
INSERT INTO emails (id, email, person) VALUES
    (0001, 'aaa@bbb.com', 1),
    (0002, 'ccc@ddd.com', 2),
    (0003, 'eee@fff.com', 3);
EOSQL

# 本当はこんな感じにしたい。
# psql -U username -d database -f setup.sql
# psql -U username -d database -f initpeople.sql
# psql -U username -d database -f initemails.sql
