#!/usr/bin/perl

# Conf
$aant=200;

# Constants
$formatstr="db%03d";

sub recreatedbs()
{
	foreach $db (@dbs) {
		print <<EORECREATE;
--- Drop database $db

DROP DATABASE IF EXISTS $db;

EORECREATE
	}

	foreach $db (@dbs) {
		print <<EORECREATE;
--- Database for user $db

CREATE DATABASE $db WITH OWNER $db;

\\c $db
GRANT ALL PRIVILEGES ON DATABASE $db TO $db;
REVOKE ALL PRIVILEGES ON DATABASE $db FROM public;
DROP SCHEMA public;

CREATE SCHEMA $db;
ALTER SCHEMA $db OWNER TO $db;

CREATE SCHEMA movies;
ALTER SCHEMA movies OWNER TO $db;
SET search_path TO movies;
\\i movies-dump.sql
ALTER TABLE movies.acts OWNER TO $db;
ALTER TABLE movies.certification OWNER TO $db;
ALTER TABLE movies.directs OWNER TO $db;
ALTER TABLE movies.genre OWNER TO $db;
ALTER TABLE movies.language OWNER TO $db;
ALTER TABLE movies.movie OWNER TO $db;
ALTER TABLE movies.person OWNER TO $db;
ALTER TABLE movies.runtime OWNER TO $db;
ALTER TABLE movies.writes OWNER TO $db;

CREATE SCHEMA srs;
ALTER SCHEMA srs OWNER TO $db;
SET search_path TO srs;
\\i DBparel-SRS-dump-1819.sql
ALTER TABLE srs.grades OWNER TO $db;
ALTER TABLE srs.education OWNER TO $db;
ALTER TABLE srs.courses OWNER TO $db;

EORECREATE
	}
}

@dbs=();
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

recreatedbs();
