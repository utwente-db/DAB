#!/usr/bin/perl

# Conf
$aant=50;

# Constants
$formatstr="pp%02d";

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
SET search_path TO $db;

GRANT ALL PRIVILEGES ON varid,domid TO $db;

\\i trio-crime.sql

ALTER TABLE saw_raw OWNER TO $db;
ALTER TABLE drives_raw OWNER TO $db;
ALTER TABLE saw OWNER TO $db;
ALTER TABLE drives OWNER TO $db;

EORECREATE
	}
}


@dbs=();
for ($i=0; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

recreatedbs();
