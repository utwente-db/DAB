CREATE SCHEMA movies;
SET search_path TO movies;
\i movies-dump.sql

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO db009;
SET search_path TO srs;
\i DBparel-SRS-dump-1819.sql