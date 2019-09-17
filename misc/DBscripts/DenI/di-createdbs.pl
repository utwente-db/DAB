#!/usr/bin/perl

# Conf
$aant=200;

# Constants
$formatstr="di%03d";

sub recreatedbs()
{
	foreach $db (@dbs) {
		print <<EORECREATE;
--- Drop database $db

DROP DATABASE $db;

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

SET search_path TO $db;
\\i movies-dump.sql
ALTER TABLE $db.acts OWNER TO $db;
ALTER TABLE $db.certification OWNER TO $db;
ALTER TABLE $db.directs OWNER TO $db;
ALTER TABLE $db.genre OWNER TO $db;
ALTER TABLE $db.language OWNER TO $db;
ALTER TABLE $db.movie OWNER TO $db;
ALTER TABLE $db.person OWNER TO $db;
ALTER TABLE $db.runtime OWNER TO $db;
ALTER TABLE $db.writes OWNER TO $db;

CREATE SCHEMA semi;
ALTER SCHEMA semi OWNER TO $db;

SET search_path TO semi;
\\i semi-dump.sql
ALTER TABLE semi.voc OWNER TO $db;

EORECREATE
	}
}

@dbs=();
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

recreatedbs();
