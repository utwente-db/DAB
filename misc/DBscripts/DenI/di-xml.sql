--- Database di00

\c di00

CREATE SCHEMA semi;
ALTER SCHEMA semi OWNER TO di00;
SET search_path TO semi;

\i voc.sql
ALTER TABLE semi.voc OWNER TO di00;
