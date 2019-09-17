#!/usr/bin/perl

# Conf
$startfrom=0;
$aant=100;

# Constants
$formatstr="dpv1a%03d";

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
DROP SCHEMA public CASCADE;

CREATE SCHEMA ass2;
ALTER SCHEMA ass2 OWNER TO $db;
CREATE SCHEMA ass3;
ALTER SCHEMA ass3 OWNER TO $db;
CREATE SCHEMA project;
ALTER SCHEMA project OWNER TO $db;

EORECREATE
	}
}

@dbs=();
for ($i=$startfrom; $i<$aant; $i++) { $d=sprintf($formatstr,$i); push @dbs,$d; }

recreatedbs();
